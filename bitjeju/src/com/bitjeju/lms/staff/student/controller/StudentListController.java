package com.bitjeju.lms.staff.student.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.member.MemberDao;
import com.bitjeju.member.MemberDto;

/**
 * Servlet implementation class StudentListController
 */
@WebServlet("/lmsstaffstudentlist.bit")
public class StudentListController extends HttpServlet {

	HttpSession session;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		session = request.getSession(false);
		if(session==null) {
			response.sendRedirect("main.bit");
			return;
		}
		String key = null;
		String word = null;
		try {
			key = request.getParameter("key"); 
			word = new String(request.getParameter("word").getBytes("iso-8859-1"), "utf-8");
		} catch (NullPointerException e) {
		} finally {
			if (key == null || key.trim() == "")
				key = "name";
			if (word == null || word.trim() == "")
				word = "";
		} // finally *****************************회원리스트에서 받은
			// 검색값***************************
		//key lecture or name
		
		int pageNum;
		int totalStudent=-1;
		if (request.getParameter("pageNum") != null) {
			System.out.println(request.getParameter("pageNum"));
			pageNum = Integer.parseInt(request.getParameter("pageNum").trim());
		}else {
			pageNum=1;
		}
		MemberDao dao = new com.bitjeju.member.MemberDao();
		ArrayList<MemberDto> list = null;
		
		try {
			list = dao.stuSelectAll(pageNum, key, word); //회원테이블의 정보를 모두 가져온다.
				dao = new MemberDao();
				totalStudent = dao.totalStudent(key, word); //검색안했을 때 전체row반환. 페이징처리때문에.
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalStudent", totalStudent); //member 테이블의 총 row 수 
		request.setAttribute("list", list); //리퀘스트스코프에 list = ArrayList<MemberDto> list를 저장.
		request.getRequestDispatcher("staffStudentList.jsp").forward(request, response);//회원정보 페이지이동
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
