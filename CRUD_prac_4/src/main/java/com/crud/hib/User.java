package com.crud.hib;

public class User {
	private int viewNo;
	private String title;
	private int viewcnt;
	private String enroll_dt;
	private int ref;
	private int textlvl;
	private int step;
	private int parentsno;
	private String content;
	private String writer;
	
	
	public User(){}
	
	public User(int viewNo, String title, int viewcnt, String enroll_dt, int ref, int textlvl, int step, int parentsno, String content, String writer) {
		this.viewNo = viewNo;
		this.title = title;
		this.viewcnt = viewcnt;
		this.enroll_dt = enroll_dt;
		this.ref = ref;
		this.textlvl = textlvl;
		this.step = step;
		this.parentsno = parentsno;
		this.content = content;
		this.writer = writer;
	}

	public int getViewNo() {
		return viewNo;
	}

	public void setViewNo(int viewNo) {
		this.viewNo = viewNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getEnroll_dt() {
		return enroll_dt;
	}

	public void setEnroll_dt(String enroll_dt) {
		this.enroll_dt = enroll_dt;
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

	public String getContent() {
		return content;
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
	
	
}