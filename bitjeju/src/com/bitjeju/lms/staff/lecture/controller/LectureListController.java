package com.bitjeju.lms.staff.lecture.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.staff.lecture.model.LectureDao;
import com.bitjeju.lms.staff.lecture.model.LectureDto;
import com.bitjeju.member.MemberDao;
import com.bitjeju.member.MemberDto;

/**
 * Servlet implementation class LectureListController
 */
@WebServlet("/lmsstafflecturelist.bit")
public class LectureListController extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		LectureDao dao = new LectureDao();
		ArrayList<LectureDto> list = null;
		try {
			list = dao.selectAll(); //강좌테이블, 멤머테이블 조인한 정보를 모두 가져온다.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (LectureDto dto : list) {
			System.out.println(dto.toString());
		}
		request.setAttribute("list", list); //리퀘스트스코프에 list를 저장.
		request.getRequestDispatcher("staffLectureList.jsp").forward(request, response);//강의목록 페이지이동
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
