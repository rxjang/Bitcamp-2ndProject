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
		
		//detail페이지에서 파라미터로 올 때 브라우저 기본 인코딩으로 변환되서 다시 utf-8로 변환해줌.
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
		//삭제페이지에서 삭제 눌렀을 때 
		MemberDao dao = new MemberDao();
		try {
			dao.deleteOne(num, emailid); //detail에서 삭제를 눌렀을 때 필드에 저장한 값으로 삭제.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("staffAccountDeleted.jsp").forward(request, response);
	
	}

}
