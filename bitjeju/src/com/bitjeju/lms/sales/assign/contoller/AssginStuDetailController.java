package com.bitjeju.lms.sales.assign.contoller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.teacher.stu.model.StudentDao;
import com.bitjeju.lms.teacher.stu.model.StudentDto;


@WebServlet("/lmssalesassignstudetail.bit")
public class AssginStuDetailController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		StudentDto bean = null;
		StudentDao dao;
		try {
		
			dao = new StudentDao();
			bean = dao.stuSelectOne(num); //�л� ȸ����ȣ >>������������
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("student", bean);
		request.getRequestDispatcher("salesAssignDetail.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

/*
 * 
 * �л��̸�
 * �����̸�
 * �����Ⱓ
 * �л� ����ó
 * �̸���
 * ���� 
 * 
 * ���������� ���¹��� ������ ������ ��  ������ ������ ��Ʈ�ѷ� 

���¹��� ����Ʈ�� ��

�ҷ��ö� sql >> ������̺� lercture�� not null�̰� ������ 3�̸��� ȸ���� select�ϱ�. dao

 * */
 