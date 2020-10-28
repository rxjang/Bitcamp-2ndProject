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
	 
	 *�л� ������ ���������� �ʿ��� ����.
	 *�⼮����, ����, �̸�, ����, �����, ���ǽ�, ��ȭ��ȣ.
	 */
		private int num;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int num = Integer.parseInt(request.getParameter("num"));//�л�����Ʈ���� �л� ������ �� �޴� ��.
		this.num = num;
		StudentDto bean = null;
		try {
			StudentDao dao = new StudentDao();
			bean =  dao.stuSelectOne(num);

			//�̸�, ���¸�, �����, ���ǽ�, ��ȭ��ȣ, �⼮��(Dto attRate()�޼��� �̿��Ұ�.), ����, �����Ⱓ(������,������)
			System.out.println(bean.attRate());
			System.out.println(bean.cntAtt()+"ȸ �⼮");
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
