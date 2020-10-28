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
 * Servlet implementation class MypageEditPhoneController
 */
@WebServlet("/mypagephoneedit.bit")
public class MypageEditPhoneController extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String phone = request.getParameter("mypagephone"); //마이페이지에서 비밀번호 수정.
		 String id_email = request.getParameter("mypageid");//아이디, uique값이라 식별가능
		 
		 MemberDao dao = new MemberDao();
		 try {
			dao.phoneUpdate(phone, id_email);
			System.out.println(phone+"  "+id_email );
			response.getWriter().write("<pwupdate><update>success</update></pwupdate>");

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
