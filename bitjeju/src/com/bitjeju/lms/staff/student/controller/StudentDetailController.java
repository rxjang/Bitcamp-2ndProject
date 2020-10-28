package com.bitjeju.lms.staff.student.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.teacher.stu.model.StudentDao;
import com.bitjeju.lms.teacher.stu.model.StudentDto;

/**
 * Servlet implementation class StudentDetailController
 */
@WebServlet("/lmsstaffstudentdetail.bit")
public class StudentDetailController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 
	 *학생 디테일 페이지에서 필요한 정보.
	 *출석정보, 성적, 이름, 강좌, 강사명, 강의실, 전화번호.
	 */
		private int num;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int num = Integer.parseInt(request.getParameter("num"));//학생리스트에서 학생 눌렀을 때 받는 값.
		this.num = num;
		StudentDto bean = null;
		try {
			StudentDao dao = new StudentDao();
			bean =  dao.stuSelectOne(num);

			//이름, 강좌명, 강사명, 강의실, 전화번호, 출석률(Dto attRate()메서드 이용할것.), 성적, 교육기간(개강일,종강일)
			System.out.println(bean.attRate());
			System.out.println(bean.cntAtt()+"회 출석");
			request.setAttribute("bean", bean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("staffStudentDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	
	
	
	}

}
