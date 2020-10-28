package com.bitjeju.customer.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.customer.model.NoticeDao;
import com.bitjeju.customer.model.NoticeDto;
import com.bitjeju.member.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeEditController
 */
@WebServlet("/noticeedit.bit")
public class NoticeEditController extends HttpServlet {

	HttpSession session;
	private int ntnum;
	private String fileName;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		int ntnum = Integer.parseInt(request.getParameter("idx"));
		this.ntnum = ntnum;
		NoticeDao dao = new NoticeDao();
		NoticeDto bean = dao.selectOne(ntnum);
		this.fileName=bean.getFilename();
		
		request.setAttribute("bean", bean);
		request.getRequestDispatcher("noticeEdit.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		session = request.getSession(false);
		
		
		request.setCharacterEncoding("utf-8");
		MemberDto bean2 = (MemberDto) session.getAttribute("login");
		int num = bean2.getNum();
		System.out.println("num: " + num);
		
		String directory = request.getSession().getServletContext().getRealPath("/notice");
		

		int maxSize = 1024 * 1024 * 100;
		DefaultFileRenamePolicy frp = new DefaultFileRenamePolicy();
		MultipartRequest mpReq = new MultipartRequest(request, directory, maxSize, "utf-8", frp);
		
		
		String title = mpReq.getParameter("notiTitle");
		String fileName = mpReq.getFilesystemName("fileName");
		String content = mpReq.getParameter("notiContent").replace("\r\n", "<br>");
		
		if(fileName==null&&this.fileName!=null){
			fileName=this.fileName;
		}else if(fileName!=null&&this.fileName!=null){
			File file2 = new File(directory+"/"+this.fileName);
			if(file2.delete()) System.out.println("deleted");
		}

		mpReq.getOriginalFileName("fileName");
		

		NoticeDao dao = new NoticeDao();
		dao.updateOne(ntnum,title, num, content, fileName); // 제목, 작성자회원번호, 내용, 파일

		response.sendRedirect("noticedetail.bit?idx="+ntnum);
	}

}
