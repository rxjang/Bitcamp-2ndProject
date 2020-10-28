package com.bitjeju.login.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/logout.bit")
public class LogoutController extends HttpServlet {
	HttpSession session;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("login", null);
		session=request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		//id나 pw가 입력되지않으면 세션있다면 종료, 메인페이지로 forward함.
		//response.sendRedirect("main.jsp");
		//request.getRequestDispatcher("main.jsp").forward(request, response);
		response.sendRedirect("main.bit");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setAttribute("login", null);
		session=request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		//id나 pw가 입력되지않으면 세션있다면 종료, 메인페이지로 forward함.
		//response.sendRedirect("main.jsp");
		response.sendRedirect("main.bit");
///		request.getRequestDispatcher("main.jsp").forward(request, response);
		
		
	}

}
