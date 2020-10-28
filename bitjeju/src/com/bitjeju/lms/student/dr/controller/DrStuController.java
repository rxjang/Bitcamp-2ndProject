package com.bitjeju.lms.student.dr.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.lms.student.dr.model.DrDao;
import com.bitjeju.lms.teacher.dr.model.DrDto;
import com.bitjeju.member.MemberDto;



@WebServlet("/lmsstudataroom.bit")
public class DrStuController extends HttpServlet {
	HttpSession session;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session=request.getSession(false);
		request.setCharacterEncoding("utf-8");
		MemberDto bean2=(MemberDto) session.getAttribute("login");
		String lecture=bean2.getLecture();
		System.out.println("DrStuController, lecture: "+lecture);
		int pageNum;
		int totalList=-1;
		if (request.getParameter("pageNum") != null) {
			System.out.println("pageNum:"+request.getParameter("pageNum"));
			pageNum = Integer.parseInt(request.getParameter("pageNum").trim());
		}else {
			pageNum=1;
		}
		ArrayList<DrDto> list=null;
		DrDao dao=null;
		try {
			dao=new DrDao();
			list=dao.getList(pageNum,lecture);	
			dao=new DrDao();
			totalList=dao.totalList(lecture);
			System.out.println("totalList: "+totalList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalList", totalList);
		request.setAttribute("list", list);
		request.setAttribute("login", bean2);
		request.getRequestDispatcher("stuDataroom.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
