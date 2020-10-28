package com.bitjeju.customer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.customer.model.NoticeDao;
import com.bitjeju.customer.model.NoticeDto;

@WebServlet("/customercenter.bit")
public class NoticeListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String word = "";
		if(request.getParameter("searchword")!=null)
			word = new String(request.getParameter("searchword").getBytes("iso-8859-1"), "utf-8");
		
		System.out.println(word);
		int pageNum=0;
		int totalList = -1;
		if (request.getParameter("pageNum") != null) {
			System.out.println("pageNum:" + request.getParameter("pageNum"));
			pageNum = Integer.parseInt(request.getParameter("pageNum").trim());
		} else {
			pageNum = 1;
			System.out.println("pageNum :" + pageNum);
		}

		NoticeDao dao = new NoticeDao();
		ArrayList<NoticeDto> list = dao.selectAll(pageNum, word);
		dao = new NoticeDao();
		totalList = dao.totalList();

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalList", totalList);
		request.setAttribute("notice", list);
		request.getRequestDispatcher("notice.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
