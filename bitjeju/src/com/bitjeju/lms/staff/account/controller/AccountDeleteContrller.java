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
 * Servlet implementation class AccountDeleteContrller
 */
@WebServlet("/lmsstaffaccountdelete.bit")
public class AccountDeleteContrller extends HttpServlet {
	private int num;
	private String emailid;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		//detail���������� �Ķ���ͷ� �� �� ������ �⺻ ���ڵ����� ��ȯ�Ǽ� �ٽ� utf-8�� ��ȯ����.
		String emailid =new String(request.getParameter("emailid").getBytes("iso-8859-1"), "utf-8");	
		int num = Integer.parseInt(request.getParameter("num"));
		this.num = num;
		this.emailid = emailid;
		System.out.println(num+emailid);

//		LectureDto lecture = new LectureDto();
//		lecture.setLecture_name(lecture_name);
		request.setAttribute("emailid", emailid);
		request.getRequestDispatcher("staffAccountDelete.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//�������������� ���� ������ �� 
		MemberDao dao = new MemberDao();
		try {
			dao.deleteOne(num, emailid); //detail���� ������ ������ �� �ʵ忡 ������ ������ ����.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("staffAccountDeleted.jsp").forward(request, response);
	
	}

}
