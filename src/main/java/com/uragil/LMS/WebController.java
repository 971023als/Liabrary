package com.uragil.LMS;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.dao.DuplicateKeyException;


import com.uragil.LMS.dao.IDao;
import com.uragil.LMS.dto.BookDto;
import com.uragil.LMS.dto.BorrowDto;
import com.uragil.LMS.dto.MemberDto;




@Controller
public class WebController {

	
	@Autowired
	private SqlSession sqlSession;


	
	
	@RequestMapping(value="/")
	public String main(Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<BookDto> bDtos = dao.b_listDao();

		model.addAttribute("book01", bDtos.get(0));
		model.addAttribute("book02", bDtos.get(1));
		model.addAttribute("book03", bDtos.get(2));	
		return "index";
			
		}
	
	@RequestMapping(value="/home")
	public String home(Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<BookDto> bDtos = dao.b_listDao();

		model.addAttribute("book01", bDtos.get(0));
		model.addAttribute("book02", bDtos.get(1));
		model.addAttribute("book03", bDtos.get(2));
			
		return "home";
			
		}
	
	@RequestMapping(value="/index")
	public String index(Model model) {
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<BookDto> bDtos = dao.b_listDao();

		model.addAttribute("book01", bDtos.get(0));
		model.addAttribute("book02", bDtos.get(1));
		model.addAttribute("book03", bDtos.get(2));
		
		
		return "index";
	}
	
	@RequestMapping(value="/login")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping(value="/join")
	public String join() {
		
		return "join";
	}


	@RequestMapping(value ="/joinOk", method=RequestMethod.POST)
	public String joinOk(HttpServletRequest request, Model model) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mphone = request.getParameter("mphone");

		IDao dao = sqlSession.getMapper(IDao.class);

		int checkId = dao.checkIdDao(mid);
		System.out.println("Check ID result for " + mid + ": " + checkId); // Log check result

		if (checkId != 1) {
			try {
				dao.joinDao(mid, mpw, mname, mphone);
			} catch (DuplicateKeyException e) {
				System.out.println("Duplicate Key Exception: " + e.getMessage());
				model.addAttribute("error", "Duplicate entry for ID: " + mid);
				return "joinError"; // Return an error page
			}

			HttpSession session = request.getSession();
			session.setAttribute("id", mid);
			session.setAttribute("name", mname);

			model.addAttribute("mname", mname);
			model.addAttribute("mid", mid);
		} else {
			model.addAttribute("error", "ID already exists: " + mid);
		}

		model.addAttribute("checkId", checkId);

		return "joinOk";
	}



	@RequestMapping(value = "/loginOk", method = RequestMethod.POST)
	public String loginOk(HttpServletRequest request, Model model) {

		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");

		IDao dao = sqlSession.getMapper(IDao.class);

		int checkId = dao.checkIdDao(mid);
		int checkPw = dao.checkPwDao(mid, mpw);

		model.addAttribute("checkId", checkId);
		model.addAttribute("checkPw", checkPw);

		System.out.println("Check ID result: " + checkId); // 디버그 로그
		System.out.println("Check Password result: " + checkPw); // 디버그 로그

		if (checkId == 0) {
			model.addAttribute("message", "아이디 불 일치");
			return "loginError";
		}

		if (checkPw == 0) {
			model.addAttribute("message", "비밀번호 불 일치");
			return "loginError";
		}

		if (checkPw == 1) {
			MemberDto memberDto = dao.loginInfoDao(mid);
			HttpSession session = request.getSession();

			session.setAttribute("id", memberDto.getMid());
			session.setAttribute("name", memberDto.getMname());

			model.addAttribute("mid", memberDto.getMid());
			model.addAttribute("mname", memberDto.getMname());
		}

		return "loginOk";
	}


	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		// 현재 세션을 가져옴
		HttpSession session = request.getSession(false); // false는 세션이 없을 경우 새로 생성하지 않음을 의미
		if (session != null) {
			session.invalidate(); // 세션 무효화
		}
		return "redirect:/login"; // 로그아웃 후 로그인 페이지로 리다이렉트
	}



	@RequestMapping(value ="/member_list")
	public String member_list(HttpServletRequest request,  Model model) {
		
		String searchKeyword = request.getParameter("searchKeyword");
		String searchOption = request.getParameter("searchOption");
		System.out.println(searchKeyword);		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		
		
		
		ArrayList<MemberDto> mDtos = null;
		ArrayList<BorrowDto> brDtos = null;
		if(searchOption == null || searchKeyword == null) {
			mDtos = dao.m_listDao();
			brDtos = dao.br_listDao();
//		} else {
//			if(searchOption.equals("title")) {
//				//제목 특정 키워드 검색한 결과
//				mDtos = dao.TitleSearchlistDao(searchKeyword);
//			} else if(searchOption.equals("categori") ) {
//				//장르 특정 키워드 검색한 결과
//				mDtos = dao.CategoriSearchlistDao(searchKeyword);
//			} else {
//				//글쓴이에서 특정 키워드 검색한 결과
//				mDtos = dao.WriterSearchlistDao(searchKeyword);
//			}
		
		}
				
		
		
		model.addAttribute("m_list", mDtos);
		model.addAttribute("br_list", brDtos);

		return "member_list";
		
		
	}
	
	
	@RequestMapping(value = "/infoModify")
	public String infoModify(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		String sessionId = (String) session.getAttribute("id");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		MemberDto memberDto = dao.loginInfoDao(sessionId);
		
		model.addAttribute("memberDto", memberDto);		
		
		return "infoModify";
	}
	
	@RequestMapping(value = "/infoModifyOk")
	public String infoModifyOk(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.infoM(request.getParameter("mpw"), request.getParameter("mname"), request.getParameter("mphone"), request.getParameter("mid"));
		
		MemberDto memberDto = dao.loginInfoDao(request.getParameter("mid"));
		
		model.addAttribute("memberDto", memberDto);
		
		return "infoModifyOk";
	}
	
	@RequestMapping(value = "/deleteMem")
	public String deleteMem(HttpServletRequest request) {
		
		String mid = request.getParameter("mid");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.deleteMemDao(mid);
		
		
		return "redirect:logout";	
	}
	
	
	@RequestMapping(value ="/book_list")
	public String book_list(HttpServletRequest request,  Model model) {
		
		String searchKeyword = request.getParameter("searchKeyword");
		String searchOption = request.getParameter("searchOption");
		String mid = request.getParameter("mid");
		System.out.println(searchKeyword);		
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		
		HttpSession session = request.getSession();
		
		
		
		ArrayList<BookDto> bDtos = null;
		ArrayList<BorrowDto> brDtos = null;
		
		if(searchOption == null || searchKeyword == null) {
			bDtos = dao.b_listDao();
			brDtos = dao.br_listDao();
		} else {
			if(searchOption.equals("title")) {
				//제목 특정 키워드 검색한 결과
				bDtos = dao.TitleSearchlistDao(searchKeyword);
			} else if(searchOption.equals("categori") ) {
				//장르 특정 키워드 검색한 결과
				bDtos = dao.CategoriSearchlistDao(searchKeyword);
			} else {
				//글쓴이에서 특정 키워드 검색한 결과
				bDtos = dao.WriterSearchlistDao(searchKeyword);
			}
		
			
		}
				
		
		
		model.addAttribute("b_list", bDtos);
		model.addAttribute("br_list", brDtos);

		return "book_list";
		
		
	}
	
	
	@RequestMapping(value="/book_input")
	public String book_input() {
		
		return "book_input";
	}
	
	
	@RequestMapping(value ="/book_inputOk")
	public String b_inputOk(HttpServletRequest request, Model model) {
		
		String bname = request.getParameter("bname");
		String bcategori = request.getParameter("bcategori");
		String bwriter = request.getParameter("bwriter");
		
						
		IDao dao = sqlSession.getMapper(IDao.class);
		
			dao.b_inputDao(bname, bcategori, bwriter);
			
		return "redirect:book_list";
	}
	
		
	
	
//	
	@RequestMapping(value ="/br_list")
	public String br_list(HttpServletRequest request, Model model) {

		
		String searchKeyword = request.getParameter("searchKeyword");
		String searchOption = request.getParameter("searchOption");
		System.out.println(searchKeyword);		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		ArrayList<BorrowDto> brDtos = null;
		if(searchOption == null || searchKeyword == null) {
			brDtos = dao.br_listDao();
		} else {
			if(searchOption.equals("brmid")) {
				//제목에서 특정 키워드 검색한 결과
				brDtos = dao.IdSearchlistDao(searchKeyword);
			}
		}
		
						
		model.addAttribute("br_list", brDtos);
		
		return "br_list";
		
	}
	
	@RequestMapping(value ="/mbr_list")
	public String mbr_list(HttpServletRequest request, Model model) {

		
		HttpSession session = request.getSession();
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String sessionId = (String) session.getAttribute("id");
		String mid = sessionId;
		ArrayList<BorrowDto> brDtos = dao.IdSearchlistDao(mid);
						
		model.addAttribute("br_list", brDtos);
	
		return "br_list";
		
	}
	
	
	@RequestMapping(value="/br_input")
	public String br_input() {
		
		return "br_input";
	}
	
	
	@RequestMapping(value ="/br_inputOk")
	public String br_inputOk(HttpServletRequest request, Model model) {
		String brbcode = request.getParameter("brbcode");
		String brmid = request.getParameter("brmid");
								
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int checkbrbcode = dao.checkbrbcodeDao(brbcode);
		int checkhavebcode = dao.checkhavebcodeDao(brbcode);
		int checkbrmid = dao.checkbrmidDao(brmid);
		if (checkbrbcode == 1 & checkhavebcode !=1 & checkbrmid ==1) {
				 	
			dao.br_inputDao(brbcode, brmid);
			dao.bstateDao();
			
			model.addAttribute("brbcode", brbcode);
			model.addAttribute("bname", brmid);
		}
		
		model.addAttribute("checkbrbcode", checkbrbcode);	    
		model.addAttribute("checkhavebcode", checkhavebcode);
		model.addAttribute("checkbrmid", checkbrmid);
		return  "brinputOk";
		
		//return  "redirect:br_list";
	}
	
	
	
	@RequestMapping(value ="/b_modifyView")
	public String b_modify(HttpServletRequest request, Model model) {
		
		String bcode = request.getParameter("bcode");
		IDao dao = sqlSession.getMapper(IDao.class);
		BookDto bDto = dao.modifyViewDao(bcode);
		
		model.addAttribute("bDto", bDto);
		
		
		
		return  "b_modifyView";
	}
	
	@RequestMapping(value = "/b_modifyOk")
	public String b_modifyOk(HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String bcode = request.getParameter("bcode");
		String bname = request.getParameter("bname");
		String bcategori = request.getParameter("bcategori");
		String bwriter = request.getParameter("bwriter");
		
		dao.bookModifyDao(bname, bcategori, bwriter, bcode);
		
		return "redirect:book_list";
	}
	

//	@RequestMapping(value = "/br_update")
//	public String br_update(HttpServletRequest request) {
//		
//		
//		IDao dao = sqlSession.getMapper(IDao.class);
//		
//		String brcode = request.getParameter("brcode");
//		
//		String bstate = "";
//		String rdate = "";
//		String brbcode = request.getParameter("brbcode");
//		
//		
//		//brbcode 업데이트 문자열 붙여주기 
//		dao.br_updateDao(bstate, rdate, brcode);
//		dao.bstateDao();
//		
//		return "redirect:br_list";
//	}
//	
	

	@RequestMapping(value = "/br_update")
	public String br_update(HttpServletRequest request) {
		
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		String brcode = request.getParameter("brcode");
		
		String bstate = "";
		String rdate = "";
		String brbcode = request.getParameter("brbcode");
		brbcode = "a"+ brbcode;
		
		//brbcode 업데이트 문자열 붙여주기 
		dao.br_updateDao(bstate, rdate, brcode);
		dao.bstateDao();
		dao.rbcodeDao(brbcode, brcode);
		return "redirect:br_list";
	}
	
}


