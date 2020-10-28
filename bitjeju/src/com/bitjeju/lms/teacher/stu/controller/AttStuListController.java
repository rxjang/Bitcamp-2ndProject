package com.bitjeju.lms.teacher.stu.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.lms.teacher.att.model.AttendanceDao;
import com.bitjeju.lms.teacher.att.model.AttendanceDto;
import com.bitjeju.lms.teacher.stu.model.StudentDao;
import com.bitjeju.member.MemberDto;

@WebServlet("/lmsteacherattendance.bit")
public class AttStuListController extends HttpServlet {
	HttpSession session;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session=request.getSession(false);
		   request.setCharacterEncoding("utf-8");
		   MemberDto bean2=(MemberDto) session.getAttribute("login");
		   int num=bean2.getNum();
		   int classStu=-1;
		   String lecture=bean2.getLecture();
		   System.out.print("num: "+num);
		   AttendanceDao dao2;
		try {
			StudentDao dao=new StudentDao();
			 dao2=new AttendanceDao();
			ArrayList<MemberDto> list=dao.selectAll(lecture);
			ArrayList<AttendanceDto> list2=dao2.selectToday(num);
			dao2=new AttendanceDao();
			classStu=dao2.classStu(num);
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			request.setAttribute("classStu", classStu);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("teacherAttCheck.jsp").forward(request, response);
	}

}