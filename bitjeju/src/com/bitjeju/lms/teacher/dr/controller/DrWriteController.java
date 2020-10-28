package com.bitjeju.lms.teacher.dr.controller;


import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.lms.teacher.dr.model.DrDao;
import com.bitjeju.member.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/lmsteacherdrwrite.bit")
public class DrWriteController extends HttpServlet {
	HttpSession session;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session=request.getSession(false);
		request.setCharacterEncoding("utf-8");
		
		request.getRequestDispatcher("teacherDataroomWrite.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session=request.getSession(false);
		request.setCharacterEncoding("utf-8");
		MemberDto bean2=(MemberDto) session.getAttribute("login");
		int num=bean2.getNum();
		System.out.println("DrWriteController,num: "+num);
		
		String directory = request.getSession().getServletContext().getRealPath("/upload/");
		File file = new File(directory);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		int maxSize=1024*1024*100;
		DefaultFileRenamePolicy frp = new DefaultFileRenamePolicy();
		
		MultipartRequest mpReq = new MultipartRequest(request, directory, maxSize, "utf-8" ,frp);
		String drTitle=mpReq.getParameter("drTitle");
		String fileName = mpReq.getFilesystemName("fileName");
		String drContent=mpReq.getParameter("drContent").replace("\r\n","<br>");
		
		try {
			DrDao dao=new DrDao();
			dao.writeDr(drTitle, num, fileName, drContent);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("lmsteacherDataroom.bit");
	}

}