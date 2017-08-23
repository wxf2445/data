package cn.com.jtang.lucene;
import java.io.StringReader;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.lucene.analysis.Analyzer;  
import org.apache.lucene.analysis.TokenStream;  
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;  
import org.apache.lucene.analysis.standard.StandardAnalyzer;  
import org.apache.lucene.document.Document;  
import org.apache.lucene.index.DirectoryReader;  
import org.apache.lucene.index.IndexReader;  
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;  
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.IndexSearcher;  
import org.apache.lucene.search.Query;  
import org.apache.lucene.search.ScoreDoc;  
import org.apache.lucene.search.TopDocs;  
import org.apache.lucene.search.highlight.Fragmenter;  
import org.apache.lucene.search.highlight.Highlighter;  
import org.apache.lucene.search.highlight.QueryScorer;  
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;  
import org.apache.lucene.search.highlight.SimpleSpanFragmenter;  
import org.apache.lucene.store.Directory;  
import org.apache.lucene.store.FSDirectory;  
import org.springframework.beans.factory.annotation.Value;

import cn.com.jtang.service.ArchivesService;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;

import org.springframework.stereotype.Component;

@Component("luceneSearch")
public class LuceneSearch {
    @Value("${luceneurl}")
    private String ROOT_PATH;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private ArchivesService archivesService;
    
	public static int pageSize = 15;
    public Page search(String q,String type,int pageNum,String recordtypeid)throws Exception{
		Page page = new Page(null,0);
		IndexReader reader = null;
    	try{
    		Directory dir=FSDirectory.open(Paths.get(ROOT_PATH+"/"+recordtypeid+"/"+type)); 
	        reader=DirectoryReader.open(dir);
	        IndexSearcher is=new IndexSearcher(reader);  
	        
	        //中文分词器  
	        SmartChineseAnalyzer analyzer=new SmartChineseAnalyzer();  
	        QueryParser parser=new QueryParser("body", analyzer);  
	        //创建查询规则  
	        Query query=parser.parse(q);  
	        
	        /*String[] queries = {  type, q };  
	        String[] fields = { "type", "body"};  
	        BooleanClause.Occur[] clauses = { BooleanClause.Occur.MUST, BooleanClause.Occur.MUST };  
	        Query query = MultiFieldQueryParser.parse(queries, fields, clauses, new StandardAnalyzer());  */
	        
	        long start=System.currentTimeMillis();  
	        //获取命中文档
	        TopDocs hits=is.search(query, pageNum*pageSize);  
	        ScoreDoc[] sd=hits.scoreDocs;  
	        
	        //创建QueryScoer  
	        QueryScorer scorer=new QueryScorer(query);//获得  
	        //scorer.setMaxDocCharsToAnalyze(5); 
	        Fragmenter fragmenter=new SimpleSpanFragmenter(scorer);  
	        //自定义高亮显示格式  
	        SimpleHTMLFormatter simpleHTMLFormatter=new SimpleHTMLFormatter("<font color='red'>","</font>");  
	        Highlighter highlighter=new Highlighter(simpleHTMLFormatter, scorer);  
	        highlighter.setTextFragmenter(fragmenter);  
	        
	        //分页显示，start为每页第一个索引，end是最后一个索引，pagesize是每页显示条数，pageindex是第几页  
	        int startPage = (pageNum-1)*pageSize;  
	        int endPage = (pageNum*pageSize)<hits.totalHits?(pageNum*pageSize):hits.totalHits;  
	        //System.out.println(startPage+" "+endPage);
	        List<SearchResult> searchResults = new ArrayList<SearchResult>();
	        for(int i=startPage;i<endPage;i++)  
	        {  
	            Document doc=is.doc(sd[i].doc);  
	            String body=doc.get("body");  
	            if(body!=null){
	            	
	            	if(doc.get("recordno").equals(""))
	            		continue;
	                //权限
	            	/*
	            	if(!(shiroUserService.getLoginUser().getRoleid()+"").equals("1")){
		                List<String> codes = shiroUserService.getCode(shiroUserService.getLoginUser().getUserid(), doc.get("recordtypeid"));
		                if(!codes.contains(RecordUtil.ACCESSRECORD)){
			                List<String> archivesaudits = archivesService.getArchivesOrder(doc.get("recordtypeid"),type,doc.get("recordid"));
			                if(archivesaudits.size()==0){
				            	codes = archivesService.getRecordTypeOrder(doc.get("recordtypeid"));
				            	if(codes.size()==0||codes.get(0)==null||codes.get(0).equals("")){
				            		continue;
				            	}else{
				            		String [] code = codes.get(0).split(",");
				            		if(code.length==0)
				            			continue;
				            	}
			                }

		                }
	            	}*/
	                
	                TokenStream tokenStream=analyzer.tokenStream("body", new StringReader(body)); 
	                
	                //获取最高分的文本片段，即摘要 
	                SearchResult sr = new SearchResult();
	                sr.setContent(highlighter.getBestFragment(tokenStream, body));
	                //sr.setPath(doc.get("path"));
	                sr.setRecordno(doc.get("recordno"));
	                sr.setRecordid(doc.get("recordid"));
	                sr.setRecordtypeid(recordtypeid);
	                sr.setSubject(doc.get("subject"));
	                sr.setType(doc.get("type"));
	                searchResults.add(sr);
	                //System.out.println(highlighter.getBestFragment(tokenStream, body));  
	            }   
	        }  
	        
	        long end=System.currentTimeMillis();  
	        System.out.println("匹配 "+q+" ，总共花费"+(end-start)+"毫秒"+"查询到"+hits.totalHits+"个记录");  
	          
	        
	       /* for(ScoreDoc scoreDoc:hits.scoreDocs){  
	            Document doc=is.doc(scoreDoc.doc); 
	            String body=doc.get("body");  
	            if(body!=null){  
	                System.out.println(doc.get("path"));   
	                TokenStream tokenStream=analyzer.tokenStream("body", new StringReader(body));  
	                //获取最高分的文本片段，即摘要  
	                System.out.println(highlighter.getBestFragment(tokenStream, body));  
	            }  
	        }*/  
	        reader.close();
	        
	        page = new Page(searchResults,hits.totalHits);
    	}catch(Exception e){
    		e.printStackTrace();
	        List<SearchResult> searchResults = new ArrayList<SearchResult>();
	        page = new Page(searchResults,0);
    	}finally{
    		if(reader!=null)
    			reader.close();
    	}
        
        
        
		return page;  
        
    }  
    public static void main(String[] args) {  
        String q="管理";  
        try {  
            //search(q,1);
        } catch (Exception e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
    }  
}  