package com.bitjeju.lms.staff.account.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.member.MemberDao;

/**
 * Servlet implementation class AccountAddController
 */
@WebServlet("/lmsstaffaccountadd.bit")
public class AccountAddController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		request.getRequestDispatcher("staffAccountAdd.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//var memberInfo = 'emailid='+$('#accountemailid').val()+'&pw='+$('#accountpw').val()+'&dept=';
		//memberInfo += $('#deptselect').val()+'&phone='+$('#phone').val()+'&name='+$('#name');
		request.setCharacterEncoding("utf-8");
		String emailid =new String(request.getParameter("emailid").getBytes("iso-8859-1"), "utf-8");	
		String pw =new String(request.getParameter("pw").getBytes("iso-8859-1"), "utf-8");	
		String name =request.getParameter("name");	
		String dept =request.getParameter("dept");	//이메일은 ..인코딩이변해서 오는데 얘네는 왜?
		int phone = Integer.parseInt(request.getParameter("phone"));
		
		MemberDao dao = new MemberDao();
		System.out.println(dept+" " + name+" "+emailid);
		try {
			dao.insertOne(emailid, name, dept, pw, phone);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("lmsstaffaccountlist.bit");
	}

}
