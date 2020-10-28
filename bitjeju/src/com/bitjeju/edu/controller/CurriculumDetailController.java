package com.bitjeju.edu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.sales.recruit.model.RecruitDao;
import com.bitjeju.lms.sales.recruit.model.RecruitDto;

/**
 * Servlet implementation class CurriculumDetailController
 */
@WebServlet("/curriculumdetail.bit")
public class CurriculumDetailController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		int recruit_num = Integer.parseInt(request.getParameter("idx"));
		
		RecruitDao dao = new RecruitDao();
		RecruitDto bean = dao.selectCurriculum(recruit_num);
		
		request.setAttribute("recruit", bean);
		request.getRequestDispatcher("curriculumDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
