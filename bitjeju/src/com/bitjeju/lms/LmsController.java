package com.bitjeju.lms;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.member.MemberDto;

/**
 * Servlet implementation class LmsController
 */
@WebServlet("/lms.bit")
public class LmsController extends HttpServlet {
	HttpSession session;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		session = request.getSession(false);//현재세션이 있으면 가져옴. 없으면 null
	
		MemberDto bean = (MemberDto) session.getAttribute("login");
		String dept = bean.getDept(); // 영업 행정 강사 학생
		int loginlevel = bean.getLvl(); // 권한레벨
		System.out.println(loginlevel);

		if (dept.equals("행정")) {
			//request.getRequestDispatcher("staff.jsp").forward(request, response);
			response.sendRedirect("lmsstaffaccountlist.bit");
			return;
		} else if (dept.equals("영업")) {
			response.sendRedirect("lmssalesrecruitlist.bit");
			return;
		}else if (dept.equals("강사")) {
			response.sendRedirect("lmsteacherattendance.bit");
			//request.getRequestDispatcher("teacher.jsp").forward(request, response);
			return;
		}else if (dept.equals("수강생")) {
			response.sendRedirect("lmsstugrade.bit");
			return;
		}

		request.getRequestDispatcher("main.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
