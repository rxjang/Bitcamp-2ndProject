package com.bitjeju.signup.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.member.MemberDao;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/signup.bit")
public class SignUp extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("signUp.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		String name = request.getParameter("name");
		String id_email = request.getParameter("emailid");
		String password = request.getParameter("pw");
		String phone = request.getParameter("phone");

		System.out.println("name=" + name + " email= " + id_email + "password= " + password + "phone= " + phone);

		int result = 0;
		MemberDao dao = new MemberDao();
		try {
			result = dao.signUp(id_email, name, password, phone);
			System.out.println("result = "+result);
			if (result == -1) {//중복된 이메일
				
				response.sendRedirect("signuperror.bit");
				return;
			} else if (result == 1) {//가입성공 멤버테이블에 회원정보 추가함

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("signuperror.bit");
			return;
		}

		response.sendRedirect("signedup.bit");

	}//

}
