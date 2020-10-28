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
import com.bitjeju.member.MemberDao;

/**
 * Servlet implementation class LectureAddController
 */
@WebServlet("/lmsstafflectureadd.bit")
public class LectureAddController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//강좌개설 메뉴를 누르면 GET으로 받아서 입력페이지로 이동***********************
		//현재 등록되어있는 강사를 보내준다.
		LectureDao dao = new LectureDao();
		ArrayList<String> teacherList = null;
		try {
			 teacherList = dao.selectTeacher();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("teacherList", teacherList); //강좌개설 페이지에 강사목록 리스트 전달
		request.getRequestDispatcher("staffLectureAdd.jsp").forward(request, response);// 강좌목록 페이지이동
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		/*
		 * pstmt.setString(1, lecture_name); pstmt.setDate(2, start_day);
		 * pstmt.setDate(3, end_day); pstmt.setInt(4, num); pstmt.setInt(5,
		 * lecture_room);
		 * 
		 */
		// **************입력 덜했는데 등록누르면 nullpointer예외발생하므로 예외처리.
		String lecture_name = null;
		Date start_day = null;
		Date end_day = null;
		String name = null; //강사이름 입력받음
		int lecture_room = -1;
		LectureDao dao = new LectureDao();
		try {
			lecture_name = request.getParameter("lecture_name").trim();
			start_day = Date.valueOf(request.getParameter("start_day"));
			end_day = Date.valueOf(request.getParameter("end_day"));
			// *************String타입으로 파라미터가 날아오므로 sqlDate타입으로 바꾸어준다.
			name = request.getParameter("name"); //강사명
			lecture_room = Integer.parseInt(request.getParameter("lecture_room"));

			dao.insertLecture(lecture_name, start_day, end_day, name, lecture_room);
			dao = new LectureDao();
		//	dao.updateLectureToteacher(name, lecture_name); //레벨이3이고 강사이름으로 검색해서 강사의 과목컬럼에 개설강좌 추가.
			// 강좌테이블에 입력받은 값을 추가.
		} catch (NullPointerException e) {
			request.getRequestDispatcher("staffLectureAdd.jsp").forward(request, response);
			// 입력값이 부족하면 다시 강좌개설 페이지이동***************************
			// 그쪽화면에서 자바스크립트로 경고할 것.
			return;//return하지 않으면 이미 반환된 리퀘스트디스패처를 밑에서 또 해서 오류나므로 반드시 return
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.getRequestDispatcher("staffLectureAdd.jsp").forward(request, response);
			return;
		}
		// ****************************에러가 안났으면 정상 추가되었고 리스트로 돌아감***********************
		response.sendRedirect("lmsstafflecturelist.bit");
		//request.getRequestDispatcher("staffLectureList.jsp").forward(request, response);// 강좌목록 페이지이동
	}

}
