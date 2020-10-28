package com.bitjeju.lms.staff.lecture.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.staff.lecture.model.LectureDao;

/**
 * Servlet implementation class EndingLectureController
 */
@WebServlet("/lmsteacherlecdelete.bit")
public class EndingLectureController extends HttpServlet {


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String lecture = request.getParameter("lecture");
		String name = request.getParameter("name");
		
		
		LectureDao dao = new LectureDao();
		dao.deleteLecture(name);//������̺� ������ �����÷��� ���� ���� ����
		//�ش������ �����ϴ� �л����� �⼮, ���� ������ ���� �ʿ�. 
		//�ش��л����� ������(2)���� �����(1)���� ��ȯ �ʿ�
		/*
		 * delete from attendance, grade 
		 * 
		 * where num = (select num from member where lecture = ? and lvl = 2) 
		 * 
		 * 
		 * 
		 */
		dao = new LectureDao();
		dao.deleteStuInfo(lecture);
		response.setContentType("application/xml;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<result>ending</result>");
		out.close();
	}

}
