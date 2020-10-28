package com.bitjeju.lms.teacher.dr.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.teacher.dr.model.DrDao;
import com.bitjeju.lms.teacher.dr.model.DrDto;




@WebServlet("/lmsteacherdrdelete.bit")
public class DrDeleteController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int drNum=Integer.parseInt(request.getParameter("drNum").trim());
		System.out.println("DrDeleteController, drNum: "+drNum);
		
		try {
			DrDao dao=new DrDao();
			DrDto bean=dao.selectOne(drNum);
			request.setAttribute("bean", bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("teacherDataroomDelete.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int drNum=Integer.parseInt(request.getParameter("drNum").trim());
		String directory = request.getRealPath("./upload");
		System.out.println(directory);
		DrDao dao=null;
		try {
			dao=new DrDao();
			DrDto bean=dao.selectOne(drNum);		
			File file = new File(directory+"/"+bean.getFileName());		
			System.out.println(bean.getFileName());
			if (file.delete()) {
				System.out.println("file deleted");
			}
			dao=new DrDao();
			dao.deleteDr(drNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("teacherDataroomDeleteTemp.jsp").forward(request, response);
	}

}