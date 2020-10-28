package com.bitjeju.edu.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.sales.recruit.model.RecruitDao;
import com.bitjeju.lms.sales.recruit.model.RecruitDto;
import com.bitjeju.lms.staff.lecture.model.LectureDao;
import com.bitjeju.lms.staff.lecture.model.LectureDto;

/**
 * Servlet implementation class CurriculumController
 */
@WebServlet("/curriculum.bit")
public class CurriculumController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*
		 * 개설강좌정보가 필요함. 
		 */
		RecruitDao dao = new RecruitDao();
		ArrayList<RecruitDto> list =null;
		list = dao.curriculumList();
		request.setAttribute("lecture", list);
		request.getRequestDispatcher("curriculum.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
