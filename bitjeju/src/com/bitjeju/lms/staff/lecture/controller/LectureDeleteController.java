package com.bitjeju.lms.staff.lecture.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.staff.lecture.model.LectureDao;
import com.bitjeju.lms.staff.lecture.model.LectureDto;

/**
 * Servlet implementation class LectureDeleteController
 */
@WebServlet("/lmsstafflecturedelete.bit")
public class LectureDeleteController extends HttpServlet {
		private int lecture_num;
		private String lecture_name;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		//detail페이지에서 파라미터로 올 때 브라우저 기본 인코딩으로 변환되서 다시 utf-8로 변환해줌.
		String lecture_name =new String(request.getParameter("lecture_name").getBytes("iso-8859-1"), "utf-8");	
		int lecture_num = Integer.parseInt(request.getParameter("lecture_num"));
		this.lecture_num = lecture_num;
		this.lecture_name = lecture_name;
		

//		LectureDto lecture = new LectureDto();
//		lecture.setLecture_name(lecture_name);
		request.setAttribute("lecture_name", lecture_name);
		request.getRequestDispatcher("staffLectureDelete.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LectureDao dao = new LectureDao();
		
		try {
			//강좌이름과 강좌번호(PK)로 더블체크후 삭제.
			
			LectureDto bean = dao.selectOne(lecture_num);
			dao = new LectureDao();
			System.out.println(lecture_num);
			System.out.println(bean.getNum());
			System.out.println(bean.getName());
			dao.deleteLecture(bean.getName());//멤버테이블에 강사의 과목컬럼에 과목 삭제 종강

			dao = new LectureDao();
			dao.deleteStuInfo(lecture_name); //해당과목 수강하는 수강생의 성적과 출석정보 삭제. 

			
			
			dao = new LectureDao();
			dao.deleteLecture(lecture_name, lecture_num); //detail에서 삭제를 눌렀을 때 필드에 저장한 값으로 삭제.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//HttpSession session = request.getSession(false);
		//response.sendRedirect("lmsstafflecturelist.bit");
		request.getRequestDispatcher("staffLectureDeleted.jsp").forward(request, response);
	}

}
