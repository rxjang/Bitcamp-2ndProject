package com.bitjeju.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.bitjeju.member.MemberDao;
import com.bitjeju.member.MemberDto;

@WebServlet("/login.bit")
public class LoginController extends HttpServlet {
	HttpSession session;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("main.jsp").forward(request, response);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/xml;charset=utf-8");

		String id = request.getParameter("emailid");
		String password = request.getParameter("pw");
		System.out.println("id = " + id + "  pw = " + password);
		
		if (id == null || password == null) {
			request.setAttribute("login", null);//로그인창 보이게함
			request.setAttribute("loginFail", "fail");
			if (session != null) {
				session.invalidate();
			}
			//id나 pw가 입력되지않으면 세션있다면 종료, 메인페이지로 forward함.
			request.getRequestDispatcher("main.jsp").forward(request, response);
			return;
		}

		MemberDao dao = new MemberDao();
		MemberDto bean = null;
		try {
			bean = dao.loginValidation(id, password);
			System.out.println(bean.getId_email());
			if (bean.getId_email().equals("fail")) {
				//id나 pw가 회원정보와 일치하지 않으면 id에 fail문자열이 담겨온다. 
				//fail이 나오면 메인으로 이동. 
				PrintWriter out = response.getWriter();
				out.print("<loginfail><fail>fail</fail></loginfail>");
				out.close();
				return;
			}

			session = request.getSession();
			session.setAttribute("login", bean);
			// 로그인에 성공하면 세션을 만들고, 세션이 유지되는동안 세션에 login속성에 bean값을 저장.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("main.jsp").forward(request, response);

	}//doPost

}
