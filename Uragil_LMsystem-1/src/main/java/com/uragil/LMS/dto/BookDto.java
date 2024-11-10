package com.uragil.LMS.dto;

public class BookDto {


	private String bcode;
	private String bname;
	private String bcategori;
	private String bwriter;
	private String bstate;
	private String rdate;
	private String brcount;
	public BookDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookDto(String bcode, String bname, String bcategori, String bwriter, String bstate, String rdate,
			String brcount) {
		super();
		this.bcode = bcode;
		this.bname = bname;
		this.bcategori = bcategori;
		this.bwriter = bwriter;
		this.bstate = bstate;
		this.rdate = rdate;
		this.brcount = brcount;
	}
	public String getBcode() {
		return bcode;
	}
	public void setBcode(String bcode) {
		this.bcode = bcode;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBcategori() {
		return bcategori;
	}
	public void setBcategori(String bcategori) {
		this.bcategori = bcategori;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBstate() {
		return bstate;
	}
	public void setBstate(String bstate) {
		this.bstate = bstate;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getBrcount() {
		return brcount;
	}
	public void setBrcount(String brcount) {
		this.brcount = brcount;
	}
	
	
	
	
}
