package com.bitjeju.member.find.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.member.find.model.FindDao;

/**
 * Servlet implementation class FindPwController
 */
@WebServlet("/findpw.bit")
public class FindPwController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("sentEmail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String id_email = request.getParameter("findemail");
		String name = request.getParameter("findname");
		
		FindDao dao = new FindDao();
		response.setContentType("text/html;charset=utf-8");
		dao.sendEmail(id_email);
		request.getRequestDispatcher("sentEmail.jsp").forward(request, response);
	}

}
