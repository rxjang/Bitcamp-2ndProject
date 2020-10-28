package com.bitjeju.lms.sales.recruit.controller;

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

/**
 * Servlet implementation class RecruitListController
 */
@WebServlet("/lmssalesrecruitlist.bit")
public class RecruitListController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// TODO Auto-generated method stub

		LectureDao dao = new LectureDao();
		ArrayList<LectureDto> list = null;
		try {
			list = dao.selectAll(); // 강좌테이블, 멤머테이블 조인한 정보를 모두 가져온다.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list", list); // 리퀘스트스코프에 list를 저장.
		request.getRequestDispatcher("salesRecruitList.jsp").forward(request, response);// 강의목록 페이지이동
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
