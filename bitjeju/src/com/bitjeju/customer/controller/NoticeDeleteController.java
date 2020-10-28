package com.bitjeju.customer.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.customer.model.NoticeDao;
import com.bitjeju.customer.model.NoticeDto;
import com.bitjeju.lms.teacher.dr.model.DrDao;
import com.bitjeju.lms.teacher.dr.model.DrDto;

/**
 * Servlet implementation class NoticeDeleteController
 */
@WebServlet("/noticedelete.bit")
public class NoticeDeleteController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int ntnum = Integer.parseInt(request.getParameter("ntnum").trim());
		System.out.println("ntnum: " + ntnum);

		NoticeDao dao = new NoticeDao();
		NoticeDto bean = dao.selectOne(ntnum);

		request.setAttribute("bean", bean);
		request.getRequestDispatcher("noticeDelete.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		int ntnum = Integer.parseInt(request.getParameter("ntnum").trim());
		String directory = request.getRealPath("./notice");
		System.out.println(directory);
		NoticeDao dao = new NoticeDao();
		
		NoticeDto bean = dao.selectOne(ntnum);
		File file = new File(directory + "/" + bean.getFilename()); //파일삭제
		System.out.println(bean.getFilename());
		if (file.delete()) {
			System.out.println("file deleted");
		}
		
		dao = new NoticeDao(); //공지사항 테이블에서 row삭제
		dao.deleteOne(ntnum);
		request.getRequestDispatcher("noticeDeleteTemp.jsp").forward(request, response);
	}

}
