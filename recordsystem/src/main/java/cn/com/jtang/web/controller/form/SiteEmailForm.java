package cn.com.jtang.web.controller.form;

import java.util.List;

public class SiteEmailForm {
private String username;
private List<String> recipients;
private String theme;
private String content;
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public List<String> getRecipients() {
	return recipients;
}
public void setRecipients(List<String> recipients) {
	this.recipients = recipients;
}
public String getTheme() {
	return theme;
}
public void setTheme(String theme) {
	this.theme = theme;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
}
