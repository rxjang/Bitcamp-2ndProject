package com.bitjeju.mypage.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.member.MemberDao;

/**
 * Servlet implementation class MypageEditValidationController
 */
@WebServlet("/mypageeditvalidate.bit")
public class MypageEditValidationController extends HttpServlet {


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String password = request.getParameter("mypagepw"); //�������������� ��й�ȣ ����.
		 String id_email = request.getParameter("mypageid");//���̵�, uique���̶� �ĺ�����
		 
		 MemberDao dao = new MemberDao();
		 try {
			dao.passwordUpdate(password, id_email);
			System.out.println(password+"  "+id_email );
			response.getWriter().write("<pwupdate><update>success</update></pwupdate>");

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
