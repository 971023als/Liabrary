package com.uragil.LMS.dao;

import java.util.ArrayList;

import com.uragil.LMS.dto.BookDto;
import com.uragil.LMS.dto.BorrowDto;
import com.uragil.LMS.dto.MemberDto;



public interface IDao {
	
	//memberDao
	public void joinDao(String mid, String mpw, String mname, String mphone);
	public int checkIdDao(String mid);
	public int checkPwDao(String mid, String mpw);
	public MemberDto loginInfoDao(String mid);
	public ArrayList<MemberDto> m_listDao();
	public void infoM(String mpw, String mname, String mphone, String mid);
	public void deleteMemDao(String mid);
	
	
	//bookDao
	public ArrayList<BookDto> b_listDao();//리스트 가져오기

	public void b_inputDao(String bname, String bcategori, String bwriter);
	public void bstateDao();
	
	public ArrayList<BookDto> TitleSearchlistDao(String keyword);
	public ArrayList<BookDto> CategoriSearchlistDao(String keyword);
	public ArrayList<BookDto> WriterSearchlistDao(String keyword);
	public BookDto modifyViewDao(String bcode);
	public void bookModifyDao(String bcode, String bname, String bcategori, String bwriter);
	
	

	//brDao
	public ArrayList<BorrowDto> br_listDao();//리스트 가져오기
	
	public ArrayList<BorrowDto> IdSearchlistDao(String keyword);
	public void br_inputDao(String brbcode, String brmid);
	
	//public void br_updateDao(String rdate, String bstate, String brbcode);
	public void br_updateDao(String brcode, String rdate, String bstate);
	public void rbcodeDao(String brbcode, String brcode);
	public int checkbrbcodeDao(String brbcode);
	public int checkhavebcodeDao(String brbcode);
	public int checkbrmidDao(String brmid);
}