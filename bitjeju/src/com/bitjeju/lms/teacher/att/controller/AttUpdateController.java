package com.bitjeju.lms.teacher.att.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.teacher.att.model.AttendanceDao;
import com.bitjeju.lms.teacher.att.model.AttendanceDto;

@WebServlet("/lmsteacherattupdate.bit")
public class AttUpdateController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int num = Integer.parseInt(request.getParameter("num"));
//		System.out.println(request.getParameter("nalja"));
		Date nalja = Date.valueOf(request.getParameter("nalja"));
		AttendanceDto bean = null;
		try {
	         AttendanceDao dao=new AttendanceDao();
			bean = dao.selectOne(num,nalja); //회원테이블의 정보를 1명 가져옴
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("bean", bean);
		request.getRequestDispatcher("teacherAttUpdate.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		req.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(req.getParameter("num"));
		Date nalja = Date.valueOf(req.getParameter("nalja"));
		String state=req.getParameter("state");
		try {
			AttendanceDao dao=new AttendanceDao();
			dao.updateOne(num, nalja, state);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("teacherAttUpdateTemp.jsp").forward(req, resp);
	}

}