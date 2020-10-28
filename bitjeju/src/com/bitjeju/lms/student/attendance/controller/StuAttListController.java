package com.bitjeju.lms.student.attendance.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.lms.student.attendance.model.StuAttDao;
import com.bitjeju.lms.student.attendance.model.StuAttDto;
import com.bitjeju.lms.teacher.stu.model.StudentDao;
import com.bitjeju.lms.teacher.stu.model.StudentDto;
import com.bitjeju.member.MemberDto;


@WebServlet("/lmsstuattendance.bit")
public class StuAttListController extends HttpServlet {
	HttpSession session;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session=request.getSession(false);
		StuAttDto bean=new StuAttDto();
		MemberDto bean2=(MemberDto) session.getAttribute("login");
		int num=bean2.getNum();
		
		try {
		//	StuAttDao dao=new StuAttDao();
			//bean=dao.selectAll(num);
			
			StudentDao dao2 = new StudentDao();
			StudentDto bean1 = dao2.stuSelectOne(num);
			//request.setAttribute("rate", rate);
			request.setAttribute("bean", bean1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("stuAttendance.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
