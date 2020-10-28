package com.bitjeju.customer.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.customer.model.NoticeDao;
import com.bitjeju.lms.teacher.dr.model.DrDao;
import com.bitjeju.member.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeAddController
 */
@WebServlet("/noticeadd.bit")
public class NoticeAddController extends HttpServlet {

	HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("noticeAdd.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		session = request.getSession(false);

		request.setCharacterEncoding("utf-8");
		MemberDto bean2 = (MemberDto) session.getAttribute("login");
		int num = bean2.getNum();
		System.out.println("DrWriteController,num: " + num);

		String directory = request.getSession().getServletContext().getRealPath("/notice/");
		File file = new File(directory);

		if (!file.exists()) {
			file.mkdirs();
		}
		int maxSize = 1024 * 1024 * 100;
		DefaultFileRenamePolicy frp = new DefaultFileRenamePolicy();

		MultipartRequest mpReq = new MultipartRequest(request, directory, maxSize, "utf-8", frp);
		String title = mpReq.getParameter("notiTitle");
		String fileName = mpReq.getFilesystemName("fileName");
		String content = mpReq.getParameter("notiContent").replace("\r\n", "<br>");

		NoticeDao dao = new NoticeDao();
		dao.insertOne(title, num, content, fileName); // 제목, 작성자회원번호, 내용, 파일

		response.sendRedirect("customercenter.bit");
	}

}
