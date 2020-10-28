package com.bitjeju.lms.teacher.stu.controller;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.teacher.stu.model.StudentDao;
import com.bitjeju.lms.teacher.stu.model.StudentDto;

@WebServlet("/lmsteacherstudetail.bit")
public class StuDetailController extends HttpServlet {
	
	private int num;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		request.getRequestDispatcher("teacherStuDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
