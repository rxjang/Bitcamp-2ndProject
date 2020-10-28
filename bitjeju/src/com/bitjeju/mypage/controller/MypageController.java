package com.bitjeju.mypage.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.member.MemberDao;
import com.bitjeju.member.MemberDto;

/**
 * Servlet implementation class MypageController
 */
@WebServlet("/mypage.bit")
public class MypageController extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession(false);
		if (session != null) {
			request.getRequestDispatcher("beforeMypage.jsp").forward(request, response);
		} else {// 로그인해야만 마이페이지로 갈 수 있긴하지만
			response.sendRedirect("main.bit"); // 세션이 종료되었거나 그럴 때는 메인으로 돌아감.
			return;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("mypageid");
		String password = request.getParameter("mypagepw");

		System.out.println("id = " + id + " pw = " + password);

		MemberDao dao = new MemberDao();
		MemberDto bean = null;
		
		try {
			bean = dao.loginValidation(id, password);

			if (bean.getId_email().equals("fail")) {
				request.setAttribute("mypageChk", "fail");
				request.getRequestDispatcher("beforeMypage.jsp").forward(request, response);
				/*
				 * RequestDispatcher rd = request.getRequestDispatcher("주소");
				 * rd.forward(request, response);
				 */
			} else {		
				request.setAttribute("bean", bean);
				request.getRequestDispatcher("mypage.jsp").forward(request, response);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
