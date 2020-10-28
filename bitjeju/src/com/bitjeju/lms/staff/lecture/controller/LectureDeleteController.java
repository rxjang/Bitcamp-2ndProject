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
		
		//detail���������� �Ķ���ͷ� �� �� ������ �⺻ ���ڵ����� ��ȯ�Ǽ� �ٽ� utf-8�� ��ȯ����.
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
			//�����̸��� ���¹�ȣ(PK)�� ����üũ�� ����.
			
			LectureDto bean = dao.selectOne(lecture_num);
			dao = new LectureDao();
			System.out.println(lecture_num);
			System.out.println(bean.getNum());
			System.out.println(bean.getName());
			dao.deleteLecture(bean.getName());//������̺� ������ �����÷��� ���� ���� ����

			dao = new LectureDao();
			dao.deleteStuInfo(lecture_name); //�ش���� �����ϴ� �������� ������ �⼮���� ����. 

			
			
			dao = new LectureDao();
			dao.deleteLecture(lecture_name, lecture_num); //detail���� ������ ������ �� �ʵ忡 ������ ������ ����.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//HttpSession session = request.getSession(false);
		//response.sendRedirect("lmsstafflecturelist.bit");
		request.getRequestDispatcher("staffLectureDeleted.jsp").forward(request, response);
	}

}
