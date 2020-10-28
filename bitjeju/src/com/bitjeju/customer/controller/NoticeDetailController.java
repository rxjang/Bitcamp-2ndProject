package com.bitjeju.customer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.customer.model.NoticeDao;
import com.bitjeju.customer.model.NoticeDto;

/**
 * Servlet implementation class NoticeDetailController
 */
@WebServlet("/noticedetail.bit")
public class NoticeDetailController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		int ntnum = Integer.parseInt(request.getParameter("idx"));
		NoticeDao dao = new NoticeDao();
		dao.readCountUp(ntnum);//조회수 증가
		dao = new NoticeDao();
		NoticeDto bean = dao.selectOne(ntnum);//상세정보받기
		
		request.setAttribute("bean", bean);
		
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
