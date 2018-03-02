package com.crud.dto;


public class ReplyVO {
	private String title;
	private String content;
	private String writer;
	private String enroll_dt;
	private int viewcnt;
	
	private int viewNo;
	private int ref;
	private int textlvl;
	private int step;
	private int parentsno;
	
	private int replyCnt;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content.replaceAll("\r\n", "<br />");
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEnroll_dt() {
		return enroll_dt;
	}
	public void setEnroll_dt(String enroll_dt) {
		this.enroll_dt = enroll_dt;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getViewNo() {
		return viewNo;
	}
	public void setViewNo(int viewNo) {
		this.viewNo = viewNo;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getTextlvl() {
		return textlvl;
	}
	public void setTextlvl(int textlvl) {
		this.textlvl = textlvl;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getParentsno() {
		return parentsno;
	}
	public void setParentsno(int parentsno) {
		this.parentsno = parentsno;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}   
    
}