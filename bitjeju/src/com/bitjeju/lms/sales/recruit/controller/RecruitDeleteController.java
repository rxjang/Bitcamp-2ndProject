package com.bitjeju.lms.sales.recruit.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.sales.recruit.model.RecruitDao;
import com.bitjeju.lms.sales.recruit.model.RecruitDto;

/**
 * Servlet implementation class RecruitDeleteController
 */
@WebServlet("/lmssalesrecruitdelete.bit")
public class RecruitDeleteController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
		request.setAttribute("recruit_num", recruit_num);
		request.getRequestDispatcher("salesRecruitDelete.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));

		RecruitDao dao = new RecruitDao();
		RecruitDto bean = dao.selectOne(recruit_num);
		
		String path = request.getRealPath("./recruit");
		
		File file = new File(path+"/"+bean.getRecruit_file_name());	
		File thumbnail = new File(path+"/"+bean.getThumbnail());
		System.out.println(bean.getRecruit_file_name());
		
		if (file.delete()) {
			System.out.println("deleted~~ ");
		}
		if(thumbnail.delete()) {
			System.out.println("deleted~~ ");
		}

		dao = new RecruitDao();
		dao.deleteOne(recruit_num);

		// request.getRequestDispatcher("salesRecruitList.jsp").forward(request,
		// response);
		response.sendRedirect("lmssalesrecruitlist.bit");

	}

}
