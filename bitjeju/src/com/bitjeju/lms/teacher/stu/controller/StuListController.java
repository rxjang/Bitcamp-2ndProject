package com.bitjeju.lms.teacher.stu.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.member.MemberDao;
import com.bitjeju.member.MemberDto;

@WebServlet("/lmsteacherstulist.bit")
public class StuListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String key = null;
				String word = null;
				try {
					key = request.getParameter("key"); 
					word = new String(request.getParameter("word").getBytes("iso-8859-1"), "utf-8");
				} catch (NullPointerException e) {
				} finally {
					if (key == null || key.trim() == "")
						key = "name";
					if (word == null || word.trim() == "")
						word = "";
				} // finally *****************************ȸ������Ʈ���� ����
					// �˻���***************************
				//key lecture or name
				
				int pageNum;
				int totalStudent=-1;
				if (request.getParameter("pageNum") != null) {
					System.out.println(request.getParameter("pageNum"));
					pageNum = Integer.parseInt(request.getParameter("pageNum").trim());
				}else {
					pageNum=1;
				}
				
				ArrayList<MemberDto> list = null;
				try {
					MemberDao dao = new MemberDao();
					list = dao.stuSelectAll(pageNum, key, word); //ȸ�����̺��� ������ ��� �����´�.
						dao = new MemberDao();
						totalStudent = dao.totalStudent(key, word); //�˻������� �� ��ürow��ȯ. ����¡ó��������.
								
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("totalStudent", totalStudent); //member ���̺��� �� row �� 
				request.setAttribute("list", list); //������Ʈ�������� list = ArrayList<MemberDto> list�� ����.
				request.getRequestDispatcher("teacherStudList.jsp").forward(request, response);//ȸ������ �������̵�
	}

}