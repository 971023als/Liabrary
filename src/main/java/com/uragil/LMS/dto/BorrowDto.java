package com.uragil.LMS.dto;

public class BorrowDto {


	private int brcode;
	private String sdate;
	private String rdate;
	private String brbcode;
	private String brmid;
	private String bstate;
	public BorrowDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BorrowDto(int brcode, String sdate, String rdate, String brbcode, String brmid, String bstate) {
		super();
		this.brcode = brcode;
		this.sdate = sdate;
		this.rdate = rdate;
		this.brbcode = brbcode;
		this.brmid = brmid;
		this.bstate = bstate;
	}
	public int getBrcode() {
		return brcode;
	}
	public void setBrcode(int brcode) {
		this.brcode = brcode;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getBrbcode() {
		return brbcode;
	}
	public void setBrbcode(String brbcode) {
		this.brbcode = brbcode;
	}
	public String getBrmid() {
		return brmid;
	}
	public void setBrmid(String brmid) {
		this.brmid = brmid;
	}
	public String getBstate() {
		return bstate;
	}
	public void setBstate(String bstate) {
		this.bstate = bstate;
	}
	
	
	
	
	}
