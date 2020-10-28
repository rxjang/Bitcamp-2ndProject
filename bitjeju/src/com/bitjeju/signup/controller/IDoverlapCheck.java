package com.bitjeju.signup.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.member.MemberDao;

/**
 * Servlet implementation class IDoverlapCheck
 */
@WebServlet("/overlapcheck.bit")
public class IDoverlapCheck extends HttpServlet {


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
		response.setContentType("application/xml;charset=utf-8");
		
		String id_email = request.getParameter("id_email");
//		System.out.println(id_email);
		PrintWriter out = response.getWriter();
		MemberDao dao = new MemberDao();
		int result = 0;
		
		try {
			result = dao.signUp(id_email);
			
			if(result==-1) {
				out.print("<check><overlap>no</overlap></check>");				
			}else if(result==1){
				out.print("<check><overlap>ok</overlap></check>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //일치하는 아이디가 있으면 
		
		
		out.close();
		
	}

}
