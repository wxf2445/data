package cn.com.jtang.web.controller.form;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Created by ZJUXP on 2016-07-04.
 */
public class ArchivesForm implements Serializable {
	private String id;
	private String borrowunits;
	private String status;
	private String isread;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date borrowtime;
    private String phone;
    private String reason;
    private String borrowNo;
    private String borrowTitle;
    private String description;
    private String borrowPerson;
    private String returnPerson;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date deadline;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date returntime;
	public String getReturnPerson() {
		return returnPerson;
	}
	public void setReturnPerson(String returnPerson) {
		this.returnPerson = returnPerson;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
    public String getBorrowPerson() {
		return borrowPerson;
	}
	public void setBorrowPerson(String borrowPerson) {
		this.borrowPerson = borrowPerson;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getBorrowunits() {
		return borrowunits;
	}
	public void setBorrowunits(String borrowunits) {
		this.borrowunits = borrowunits;
	}
	public Date getBorrowtime() {
		return borrowtime;
	}
	public void setBorrowtime(Date borrowtime) {
		this.borrowtime = borrowtime;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getBorrowNo() {
		return borrowNo;
	}
	public void setBorrowNo(String borrowNo) {
		this.borrowNo = borrowNo;
	}
	public String getBorrowTitle() {
		return borrowTitle;
	}
	public void setBorrowTitle(String borrowTitle) {
		this.borrowTitle = borrowTitle;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getReturntime() {
		return returntime;
	}
	public void setReturntime(Date returntime) {
		this.returntime = returntime;
	}
	public String getIsread() {
		return isread;
	}
	public void setIsread(String isread) {
		this.isread = isread;
	}
    
}
