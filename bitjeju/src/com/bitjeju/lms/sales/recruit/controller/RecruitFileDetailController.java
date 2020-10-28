package com.bitjeju.lms.sales.recruit.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.sales.recruit.model.RecruitDao;
import com.bitjeju.lms.sales.recruit.model.RecruitDto;

/**
 * Servlet implementation class RecruitFileDetailController
 */
@WebServlet("/lmssalesrecruitfiledetail.bit")
public class RecruitFileDetailController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//모집공고파일 내용상세페이지
	
		
		int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
		
		RecruitDao dao = new RecruitDao();
		RecruitDto bean = dao.selectOne(recruit_num);
		
		request.setAttribute("recruit", bean);
		request.getRequestDispatcher("salesRecruitFileDetail.jsp").forward(request, response);
	}

	
	
	
	
	
	
	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	
	}

}
