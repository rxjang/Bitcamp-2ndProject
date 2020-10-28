package com.bitjeju.lms.staff.student.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.teacher.stu.model.StudentDao;
import com.bitjeju.lms.teacher.stu.model.StudentDto;

/**
 * Servlet implementation class StudentDeleteController
 */
@WebServlet("/lmsstaffstudentdelete.bit")
public class StudentDeleteController extends HttpServlet {


	private int num;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		this.num=num;
		StudentDto bean = null;
		try {
			StudentDao dao = new StudentDao();
			bean = dao.stuSelectOne(num);
			
			request.setAttribute("bean", bean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("staffStudentList.jsp");
			return;
		}
		
		request.getRequestDispatcher("staffStudentDelete.jsp").forward(request, response);
	}

	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		try {
			StudentDao dao = new StudentDao();
			dao.studeleteOne(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("lmsstaffstudentlist.bit");
	
	}

}
