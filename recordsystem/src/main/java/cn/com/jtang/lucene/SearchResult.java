package cn.com.jtang.lucene;

public class SearchResult {
	String recordid;
	String recordtypeid;
	String content;
	//String path;
	String subject;
	String type;
	String recordno;
	public String getRecordno() {
		return recordno;
	}
	public void setRecordno(String recordno) {
		this.recordno = recordno;
	}
	public String getRecordid() {
		return recordid;
	}
	public void setRecordid(String recordid) {
		this.recordid = recordid;
	}
	public String getRecordtypeid() {
		return recordtypeid;
	}
	public void setRecordtypeid(String recordtypeid) {
		this.recordtypeid = recordtypeid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	/*public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}*/
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
