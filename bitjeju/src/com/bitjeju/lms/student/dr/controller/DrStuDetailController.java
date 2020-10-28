package com.bitjeju.lms.student.dr.controller;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.lms.student.dr.model.DrDao;
import com.bitjeju.lms.teacher.dr.model.DrDto;
import com.bitjeju.member.MemberDto;



@WebServlet("/lmsstudrdetail.bit")
public class DrStuDetailController extends HttpServlet {
	HttpSession session;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session=request.getSession(false);
		request.setCharacterEncoding("utf-8");
		MemberDto bean2=(MemberDto) session.getAttribute("login");
		int drNum=Integer.parseInt(request.getParameter("drNum").trim());
		System.out.println("DrStuController, drNum: "+drNum);
		try {
			DrDao dao=new DrDao();
			DrDto bean=dao.selectOne(drNum);
			request.setAttribute("bean", bean);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("stuDataroomDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
