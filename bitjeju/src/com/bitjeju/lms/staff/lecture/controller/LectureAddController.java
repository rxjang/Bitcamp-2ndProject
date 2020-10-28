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
		//���°��� �޴��� ������ GET���� �޾Ƽ� �Է��������� �̵�***********************
		//���� ��ϵǾ��ִ� ���縦 �����ش�.
		LectureDao dao = new LectureDao();
		ArrayList<String> teacherList = null;
		try {
			 teacherList = dao.selectTeacher();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("teacherList", teacherList); //���°��� �������� ������ ����Ʈ ����
		request.getRequestDispatcher("staffLectureAdd.jsp").forward(request, response);// ���¸�� �������̵�
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
		// **************�Է� ���ߴµ� ��ϴ����� nullpointer���ܹ߻��ϹǷ� ����ó��.
		String lecture_name = null;
		Date start_day = null;
		Date end_day = null;
		String name = null; //�����̸� �Է¹���
		int lecture_room = -1;
		LectureDao dao = new LectureDao();
		try {
			lecture_name = request.getParameter("lecture_name").trim();
			start_day = Date.valueOf(request.getParameter("start_day"));
			end_day = Date.valueOf(request.getParameter("end_day"));
			// *************StringŸ������ �Ķ���Ͱ� ���ƿ��Ƿ� sqlDateŸ������ �ٲپ��ش�.
			name = request.getParameter("name"); //�����
			lecture_room = Integer.parseInt(request.getParameter("lecture_room"));

			dao.insertLecture(lecture_name, start_day, end_day, name, lecture_room);
			dao = new LectureDao();
		//	dao.updateLectureToteacher(name, lecture_name); //������3�̰� �����̸����� �˻��ؼ� ������ �����÷��� �������� �߰�.
			// �������̺� �Է¹��� ���� �߰�.
		} catch (NullPointerException e) {
			request.getRequestDispatcher("staffLectureAdd.jsp").forward(request, response);
			// �Է°��� �����ϸ� �ٽ� ���°��� �������̵�***************************
			// ����ȭ�鿡�� �ڹٽ�ũ��Ʈ�� ����� ��.
			return;//return���� ������ �̹� ��ȯ�� ������Ʈ����ó�� �ؿ��� �� �ؼ� �������Ƿ� �ݵ�� return
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.getRequestDispatcher("staffLectureAdd.jsp").forward(request, response);
			return;
		}
		// ****************************������ �ȳ����� ���� �߰��Ǿ��� ����Ʈ�� ���ư�***********************
		response.sendRedirect("lmsstafflecturelist.bit");
		//request.getRequestDispatcher("staffLectureList.jsp").forward(request, response);// ���¸�� �������̵�
	}

}
