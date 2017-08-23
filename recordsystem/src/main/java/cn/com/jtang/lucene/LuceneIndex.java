package cn.com.jtang.lucene;

  
import java.io.*;
import java.nio.file.Paths;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;  
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;  
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;  import org.apache.lucene.store.LockObtainFailedException;
import org.apache.lucene.util.Version;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
/*
import org.pdfbox.pdfparser.PDFParser;
import org.pdfbox.pdmodel.PDDocument;
import org.pdfbox.util.PDFTextStripper;*/
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.apache.poi.POITextExtractor;
import org.apache.poi.hslf.extractor.PowerPointExtractor;
import org.apache.poi.hssf.extractor.ExcelExtractor;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.exceptions.OpenXML4JException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xslf.extractor.XSLFPowerPointExtractor;
import org.apache.poi.xssf.extractor.XSSFExcelExtractor;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.xmlbeans.XmlException;

import cn.com.jtang.util.RecordUtil;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

@Component("luceneIndex")
public class LuceneIndex{
    Directory dir;
    @Value("${luceneurl}")
    private String indexDir;

    /**
     * 获取IndexWriter实例 
     * @return 
     * @throws Exception 
     */  
    private IndexWriter getWriter()throws Exception{
        SmartChineseAnalyzer analyzer=new SmartChineseAnalyzer();
        IndexWriterConfig iwc=new IndexWriterConfig(analyzer);  
        IndexWriter writer=new IndexWriter(dir, iwc);  
        return writer;  
    }  
      
    /** 
     * 生成索引 
     * @param recordid tablename filePath indexPath
     * @throws Exception 
     */  
    public void index(String subject,String recordid,String recordtypeid,String type,String filePath,String recordno,String documentid){
        IndexWriter writer = null;
		try {
	        dir=FSDirectory.open(Paths.get(indexDir+"/"+recordtypeid+"/"+type));
	        
	        writer = getWriter();  
	        File fileDir = new File(filePath);
	        //判断文件路径是否有效
	        if(fileDir.isFile()&& fileDir.getName().toLowerCase().endsWith(".pdf")){
	            Document document = new Document(); 
	            //System.out.println("File " + textFiles[i].getCanonicalPath() + "正在被索引...."); 
	            String content = getTextFromPDF(filePath);
	            System.out.println(content);
	            //document.add(new StringField("path", fileDir.getPath(),Field.Store.YES));    
	            document.add(new StringField("subject", subject,Field.Store.YES));    
	            document.add(new Field("recordid", recordid, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new Field("recordno", recordno, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new Field("documentid", documentid, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new Field("type", type, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new TextField("body",content , Field.Store.YES));    
	            writer.addDocument(document);  
	        }else if(fileDir.isFile()&& fileDir.getName().toLowerCase().endsWith(".doc")){
	            Document document = new Document(); 
	            //System.out.println("File " + textFiles[i].getCanonicalPath() + "正在被索引...."); 
	            String content = getDocText(filePath);
	            System.out.println(content);
	            //document.add(new StringField("path", fileDir.getPath(),Field.Store.YES));    
	            document.add(new StringField("subject", subject,Field.Store.YES));    
	            document.add(new Field("recordid", recordid, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new Field("recordno", recordno, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new Field("documentid", documentid, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new Field("type", type, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new TextField("body",content , Field.Store.YES));    
	            writer.addDocument(document);  
	        }else if(fileDir.isFile()&& fileDir.getName().toLowerCase().endsWith(".docx")){
	            Document document = new Document(); 
	            //System.out.println("File " + textFiles[i].getCanonicalPath() + "正在被索引...."); 
	            String content = getDocxText(filePath);
	            System.out.println(content);
	            //document.add(new StringField("path", fileDir.getPath(),Field.Store.YES));    
	            document.add(new StringField("subject", subject,Field.Store.YES));    
	            document.add(new Field("recordid", recordid, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new Field("recordno", recordno, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new Field("documentid", documentid, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new Field("type", type, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
	            document.add(new TextField("body",content , Field.Store.YES));    
	            writer.addDocument(document);  
	        }
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (LockObtainFailedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(writer!=null) writer.close();
			} catch (CorruptIndexException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
        
    }  
    
  public void deleteByRecordNo(String recordno,String recordtypeid,String type) {
      IndexWriter writer = null;
		try {
	        dir=FSDirectory.open(Paths.get(indexDir+"/"+recordtypeid+"/"+type));
	        //dir=FSDirectory.open(Paths.get(indexDir+"lucene"));
	        writer = getWriter();
			//参数是一个选项，可以是一个Query，也可以是一个term，term是一个精确查找的值
			//此时删除的文档并不会被完全删除，而是存储在一个回收站中的，可以恢复
		    writer.deleteDocuments(new Term("recordno",recordno));
			writer.commit();
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (LockObtainFailedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(writer!=null) writer.close();
			} catch (CorruptIndexException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
  public void deleteByRecordId(String recordId,String type,String recordtypeid) {
      IndexWriter writer = null;
		try {
	        dir=FSDirectory.open(Paths.get(indexDir+"/"+recordtypeid+"/"+type));
	        //dir=FSDirectory.open(Paths.get(indexDir+"lucene"));
	        writer = getWriter();
			//参数是一个选项，可以是一个Query，也可以是一个term，term是一个精确查找的值
			//此时删除的文档并不会被完全删除，而是存储在一个回收站中的，可以恢复
		    writer.deleteDocuments(new Term("recordid",recordId));
			writer.commit();
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (LockObtainFailedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(writer!=null) writer.close();
			} catch (CorruptIndexException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
  public void deleteByDocumentId(String documentid,String type,String recordtypeid) {
      IndexWriter writer = null;
		try {
	        dir=FSDirectory.open(Paths.get(indexDir+"/"+recordtypeid+"/"+type));
	        //dir=FSDirectory.open(Paths.get(indexDir+"lucene"));
	        writer = getWriter();
			//参数是一个选项，可以是一个Query，也可以是一个term，term是一个精确查找的值
			//此时删除的文档并不会被完全删除，而是存储在一个回收站中的，可以恢复
		    writer.deleteDocuments(new Term("documentid",documentid));
			writer.commit();
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (LockObtainFailedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(writer!=null) writer.close();
			} catch (CorruptIndexException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

  private static boolean deleteDir(File dir) {
      if (dir.isDirectory()) {
          String[] children = dir.list();
          
          for (int i=0; i<children.length; i++) {
              boolean success = deleteDir(new File(dir, children[i]));
              if (!success) {
                  return false;
              }
          }
      }
      // 目录此时为空，可以删除
      return dir.delete();
  }
      
    public void delete(String recordtypeid) {
        IndexWriter writer = null;
		try {
			deleteDir(new File(indexDir+"/"+recordtypeid));
	        /*dir=FSDirectory.open(Paths.get(indexDir+"/"+recordtypeid));
	        //dir=FSDirectory.open(Paths.get(indexDir+"lucene"));
	        writer = getWriter();
		    writer.deleteDocuments(new Term("recordtypeid",recordtypeid));
			writer.commit();
			
	        dir=FSDirectory.open(Paths.get(indexDir+RecordUtil.PIECE));
	        //dir=FSDirectory.open(Paths.get(indexDir+"lucene"));
	        writer = getWriter();
			//参数是一个选项，可以是一个Query，也可以是一个term，term是一个精确查找的值
			//此时删除的文档并不会被完全删除，而是存储在一个回收站中的，可以恢复
		    writer.deleteDocuments(new Term("recordtypeid",recordtypeid));
			writer.commit();*/
		} /*catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (LockObtainFailedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} */catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(writer!=null) writer.close();
			} catch (CorruptIndexException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}


	public void updateRecordNo(String recordno, String recordid ,String recordtypeid) {
        IndexWriter writer = null;
		try {

			dir=FSDirectory.open(Paths.get(indexDir+"/"+recordtypeid+"/_record"));
			writer = getWriter(); 
	    	 //Directory dir=FSDirectory.open(Paths.get(indexDir+"lucene"));
	        IndexReader reader=DirectoryReader.open(dir);
	        IndexSearcher is=new IndexSearcher(reader); 
	        Term trem = new Term("recordid",recordid);
	        //------------TermQuery  单个关键字查询
	        Query query=new TermQuery(trem);
	        
	        TopDocs hits=is.search(query, 1);
	        ScoreDoc[] sd=hits.scoreDocs;  
	        
            Document doc=is.doc(sd[0].doc);  
            try{
    		    writer.deleteDocuments(trem);
    		    reader.close();
    			writer.commit();
            }catch(Exception e){
            	e.printStackTrace();
            }
            
			if(writer!=null) writer.close();
            
			writer = getWriter(); 
            Document document = new Document();
            //document.add(new StringField("path", fileDir.getPath(),Field.Store.YES));    
            document.add(new StringField("subject", doc.get("subject"),Field.Store.YES));    
            document.add(new Field("recordid", doc.get("recordid"), Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
            document.add(new Field("recordno", recordno, Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
            document.add(new Field("type", doc.get("type"), Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
            document.add(new Field("documentid", doc.get("documentid"), Field.Store.YES, Field.Index.NOT_ANALYZED_NO_NORMS  ));
            document.add(new TextField("body",doc.get("body") , Field.Store.YES));  
		    
            writer.addDocument(document);  
			writer.commit();
			
			
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (LockObtainFailedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(writer!=null) writer.close();
			} catch (CorruptIndexException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
        
	}  
/*    public static void main(String[] args) throws Exception {  
        //new LuceneIndex().index("subject","recordid","recordtypeid","type","D:\\file\\1.pdf");
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(LuceneIndex.class);
        LuceneIndex mockConfigTest = (LuceneIndex) annotationConfigApplicationContext.getBean("luceneIndex");
        mockConfigTest.readValues();
    }

    private void readValues() {
        System.out.println("indexDir:"+indexDir);
    }*/

    public static String FileReaderAll(String FileName, String charset)  { 
        String temp = new String();  
    	try{
            BufferedReader reader = new BufferedReader(new InputStreamReader(    
                    new FileInputStream(FileName), charset));      
            
            String line = new String();    
            while ((line = reader.readLine()) != null) {    
                temp += line;    
            }    
            reader.close(); 
    	}catch(Exception e){
    		e.printStackTrace();
    	}
        return temp;    
    } 
    public static String getTextFromPDF(String pdfFilePath)   
    {
        String result = null;
        FileInputStream is = null;
        PDDocument document = null;
        try {
            is = new FileInputStream(pdfFilePath);
            PDFParser parser = new PDFParser(is);
            parser.parse();
            document = parser.getPDDocument();
            PDFTextStripper stripper = new PDFTextStripper();
            result = stripper.getText(document);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                }
            }
            if (document != null) {
                try {
                    document.close();
                } catch (IOException e) {
                }
            }
        }
        return result;
    }

	public String getDocText(String path){
        FileInputStream fis = null;
        String str = null;
        try {
            fis = new FileInputStream(path);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        WordExtractor extractor = null;
		try {
            extractor = new WordExtractor(fis);
            str = extractor.getText();
            System.out.print(extractor.getText());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
        return str;
	}

	public String getDocxText(String path){
        FileInputStream fis = null;
        String str = null;
        try {
            fis = new FileInputStream(path);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        POITextExtractor textExtractor = null;
		try {
            textExtractor = new XWPFWordExtractor(new XWPFDocument(fis));
            str = textExtractor.getText();
            System.out.print(textExtractor.getText());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
        return str;
	}
}  