package com.bitjeju.lms.staff.account.controller;

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
 * Servlet implementation class AccountEditController
 */
@WebServlet("/lmsstaffaccountedit.bit")
public class AccountEditController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int num = Integer.parseInt(request.getParameter("num"));
		String id_email = request.getParameter("emailid");

		MemberDao dao = new MemberDao();
		MemberDto bean = null;

		bean = dao.selectOne(num);
		request.setAttribute("bean", bean);// ȸ����ȣ�� ���̵� ������������ ����
		request.getRequestDispatcher("staffAccountEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int deptLevel = Integer.parseInt(request.getParameter("accounteditlvl"));
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(deptLevel + " ����");
		MemberDao dao = new MemberDao();
		MemberDto bean = null;
		try {
			dao.updateLevel(deptLevel, num);// ���� ����.
			dao = new MemberDao();
			bean = dao.selectOne(num); // ������ ������ �ٽ� ȸ�������� �޾Ƽ� Detail�������� �����ش�.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("bean", bean);
		request.getRequestDispatcher("staffAccountDetail.jsp").forward(request, response);

	}

}
