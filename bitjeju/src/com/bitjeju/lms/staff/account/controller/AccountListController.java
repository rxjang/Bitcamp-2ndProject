package com.bitjeju.lms.staff.account.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.member.MemberDao;
import com.bitjeju.member.MemberDto;

/**
 * Servlet implementation class ListController
 */
@WebServlet("/lmsstaffaccountlist.bit")
public class AccountListController extends HttpServlet {

	HttpSession session;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		session = request.getSession(false);
		if (session == null) {
			response.sendRedirect("main.bit");
			return;
		}
		String key = null;
		String word = null;
		try {
			key = request.getParameter("key");
			word = new String(request.getParameter("word").getBytes("iso-8859-1"), "utf-8");
		} catch (NullPointerException e) {
		} finally {
			if (key == null || key.trim() == "")
				key = "name";
			if (word == null || word.trim() == "")
				word = "";
		} // finally *****************************회원리스트에서 받은
			// 검색값***************************
		
		//키값이 레벨이면 word를 숫자로 알맞게 바꾼다.
		if (key.equals("lvl") && word.equals("일반회원")) {
			word = "0";
		} else if (key.equals("lvl") && word.equals("수료생")) {
			word = "1";
		} else if (key.equals("lvl") && word.equals("수강생")) {
			word = "2";
		} else if (key.equals("lvl") && word.equals("강사")) {
			word = "3";
		} else if (key.equals("lvl") && word.equals("영업")) {
			word = "4";
		} else if (key.equals("lvl") && word.equals("행정")) {
			word = "5";
		} else if (key.equals("lvl") && word.equals("관리자")) {
			word = "6";
		}

		// 한글이 또..iso8859로바뀌어서 날라와서 다시 바꿔줌.
		int pageNum;
		int totalMember = -1;
		if (request.getParameter("pageNum") != null) {
			System.out.println(request.getParameter("pageNum"));
			pageNum = Integer.parseInt(request.getParameter("pageNum").trim());
		} else {
			pageNum = 1;
		}
		MemberDao dao = new MemberDao();
		ArrayList<MemberDto> list = null;
		try {
			list = dao.selectAll(pageNum, key, word); // 회원테이블의 정보를 모두 가져온다.
			dao = new MemberDao();
			totalMember = dao.totalMember(key, word); //.
			

			System.out.println("총 수 " + totalMember);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", list); // 리퀘스트스코프에 list = ArrayList<MemberDto> list를 저장.
		request.setAttribute("totalMember", totalMember); // member 테이블의 총 row 수
		request.getRequestDispatcher("staffAccountList.jsp").forward(request, response);// 회원정보 페이지이동
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
