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
			request.setAttribute("login", null);//�α���â ���̰���
			request.setAttribute("loginFail", "fail");
			if (session != null) {
				session.invalidate();
			}
			//id�� pw�� �Էµ��������� �����ִٸ� ����, ������������ forward��.
			request.getRequestDispatcher("main.jsp").forward(request, response);
			return;
		}

		MemberDao dao = new MemberDao();
		MemberDto bean = null;
		try {
			bean = dao.loginValidation(id, password);
			System.out.println(bean.getId_email());
			if (bean.getId_email().equals("fail")) {
				//id�� pw�� ȸ�������� ��ġ���� ������ id�� fail���ڿ��� ��ܿ´�. 
				//fail�� ������ �������� �̵�. 
				PrintWriter out = response.getWriter();
				out.print("<loginfail><fail>fail</fail></loginfail>");
				out.close();
				return;
			}

			session = request.getSession();
			session.setAttribute("login", bean);
			// �α��ο� �����ϸ� ������ �����, ������ �����Ǵµ��� ���ǿ� login�Ӽ��� bean���� ����.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("main.jsp").forward(request, response);

	}//doPost

}
