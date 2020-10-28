package com.bitjeju.mypage.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.member.MemberDao;
import com.bitjeju.member.MemberDto;

/**
 * Servlet implementation class MypageEdit
 */
@WebServlet("/mypageedit.bit")
public class MypageEdit extends HttpServlet {

	private int num;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDao dao = new MemberDao();
		MemberDto bean = null;

		bean = dao.selectOne(num);

		request.setAttribute("bean", bean);
		request.getRequestDispatcher("mypageEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int num = Integer.parseInt(request.getParameter("idx"));
		System.out.println(num + "<<회원번호");
		this.num = num;

	}

}
