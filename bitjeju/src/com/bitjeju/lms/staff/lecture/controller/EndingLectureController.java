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
		dao.deleteLecture(name);//멤버테이블에 강사의 과목컬럼에 과목 삭제 종강
		//해당과목을 수강하는 학생들의 출석, 성적 정보도 삭제 필요. 
		//해당학생들을 수강생(2)에서 수료생(1)으로 전환 필요
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
