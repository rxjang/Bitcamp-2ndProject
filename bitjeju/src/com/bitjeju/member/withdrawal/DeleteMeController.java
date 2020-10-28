package com.bitjeju.member.withdrawal;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.member.MemberDao;

@WebServlet("/deleteme.bit")
public class DeleteMeController extends HttpServlet {
	private int num;
	private String password;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		try {
			dao.deleteMe(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("logout.bit");
		//request.getRequestDispatcher("mypageDeleteMe.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		this.num= Integer.parseInt(request.getParameter("idx"));
		password = request.getParameter("pw");
		System.out.println("pw = "+password);
		MemberDao dao = new MemberDao();
		int result = dao.deleteMeValidation(num, password);
		//1이면 삭제성공 2면 삭제실패
		
		
		response.setContentType("application/xml;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<result>"+result+"</result>");
		out.close();
		
		//request.getRequestDispatcher();
	}

}