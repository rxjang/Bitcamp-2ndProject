/**
 * 
 */
package com.bitjeju.lms.student.lecture.controller;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.lms.staff.lecture.model.LectureDao;
import com.bitjeju.lms.staff.lecture.model.LectureDto;
import com.bitjeju.member.MemberDto;


@WebServlet("/lmsstulecture.bit")
public class StuLectureController extends HttpServlet {
	HttpSession session;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session=request.getSession(false);
		LectureDto bean=new LectureDto();
		MemberDto bean2=(MemberDto) session.getAttribute("login");
		int num=bean2.getNum();
		System.out.println("수강정보 페이지 학생번호:"+num);
		try {
			LectureDao dao=new LectureDao();
			bean=dao.selectInfo(num);
			
			request.setAttribute("bean",bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("stuLecture.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}