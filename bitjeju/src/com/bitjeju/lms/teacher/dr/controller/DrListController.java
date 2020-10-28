package com.bitjeju.lms.teacher.dr.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.lms.teacher.dr.model.DrDao;
import com.bitjeju.lms.teacher.dr.model.DrDto;
import com.bitjeju.member.MemberDto;



@WebServlet("/lmsteacherDataroom.bit")
public class DrListController extends HttpServlet {
	HttpSession session;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session=request.getSession(false);
		request.setCharacterEncoding("utf-8");
		MemberDto bean2=(MemberDto) session.getAttribute("login");
		int num=bean2.getNum();
		System.out.println("DrListController, num: "+num);
		int pageNum;
		int totalList=-1;
		if (request.getParameter("pageNum") != null) {
			System.out.println("pageNum:"+request.getParameter("pageNum"));
			pageNum = Integer.parseInt(request.getParameter("pageNum").trim());
		}else {
			pageNum=1;
			System.out.println("pageNum :"+pageNum);
		}
		ArrayList<DrDto> list=null;
		DrDao dao=null;
		try {
			dao=new DrDao();
			list=dao.getList(pageNum,num);	
			dao=new DrDao();
			totalList=dao.totalList(num);
			System.out.println("totalList: "+totalList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalList", totalList);
		request.setAttribute("list", list);
		request.setAttribute("login", bean2);
		request.getRequestDispatcher("teacherDataroom.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}