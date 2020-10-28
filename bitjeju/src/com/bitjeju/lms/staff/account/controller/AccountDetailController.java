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
 * Servlet implementation class AccountDetailController
 */
@WebServlet("/lmsstaffaccountdetail.bit")
public class AccountDetailController extends HttpServlet {

	HttpSession session;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		session = request.getSession(false);
		if (session == null) {
			response.sendRedirect("main.bit");
			return;
		}
		int num = Integer.parseInt(request.getParameter("num"));
		MemberDao dao = new com.bitjeju.member.MemberDao();
		MemberDto bean = null;
		bean = dao.selectOne(num); // 회원테이블의 정보를 1명 가져옴
		request.setAttribute("bean", bean); // 리퀘스트스코프에 list = ArrayList<MemberDto> list를 저장.
		request.getRequestDispatcher("staffAccountDetail.jsp").forward(request, response);// 회원정보 페이지이동
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
