package com.bitjeju.member.find.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.member.MemberDao;
import com.bitjeju.member.find.model.FindDao;

/**
 * Servlet implementation class FindIdController
 */
@WebServlet("/findid.bit")
public class FindIdController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("findname");
		String phone = request.getParameter("findphone");
		
		FindDao dao = new FindDao();
		String id_email = dao.findEmail(name, phone);//찾은 아이디 반환
		System.out.println(id_email);
		request.setAttribute("id_email", id_email);//아이디 전달 
		request.getRequestDispatcher("accountFoundId.jsp").forward(request, response);
	}

}
