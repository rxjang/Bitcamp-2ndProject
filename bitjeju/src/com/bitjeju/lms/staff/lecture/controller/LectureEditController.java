package com.bitjeju.lms.staff.lecture.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.staff.lecture.model.LectureDao;
import com.bitjeju.lms.staff.lecture.model.LectureDto;

/**
 * Servlet implementation class LectureEditController
 */
@WebServlet("/lmsstafflectureedit.bit")
public class LectureEditController extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int lecture_num = Integer.parseInt(request.getParameter("lecture_num"));
		LectureDao dao = new LectureDao();
		LectureDto lecture = null;
		ArrayList<String> teacherList = null;
		try {
			lecture = dao.selectOne(lecture_num);
			dao = new LectureDao();
			teacherList = dao.selectTeacher();
			request.setAttribute("teacherList", teacherList);
			request.setAttribute("lecture", lecture);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("staffLectureEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String lecture_name = null;
		Date start_day = null;
		Date end_day = null;
		String name = null; //강사이름 입력받음
		int lecture_room = -1;
		int lecture_num = -1;
		LectureDao dao = new LectureDao();
		
			try {
				lecture_name = request.getParameter("lecture_name").trim();
				start_day = Date.valueOf(request.getParameter("start_day"));
				end_day = Date.valueOf(request.getParameter("end_day"));
				// *************String타입으로 파라미터가 날아오므로 sqlDate타입으로 바꾸어준다.
				name = request.getParameter("name"); //강사명
				lecture_room = Integer.parseInt(request.getParameter("lecture_room"));
				lecture_num = Integer.parseInt(request.getParameter("lecture_num"));
				
				dao.updateLecture(lecture_num, lecture_name, start_day, end_day, name, lecture_room);
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				request.getRequestDispatcher("staffLectureEdit.jsp").forward(request, response);
				return;
			} catch (NullPointerException e1) {
				e1.printStackTrace();
				request.getRequestDispatcher("staffLectureEdit.jsp").forward(request, response);
				return;
			}
			//request.getRequestDispatcher("staffLectureList.jsp").forward(request, response);
			response.sendRedirect("lmsstafflecturelist.bit");
	}

}
