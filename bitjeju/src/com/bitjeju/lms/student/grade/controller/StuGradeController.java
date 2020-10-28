package com.bitjeju.lms.student.grade.controller;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.lms.student.grade.model.StuGradeDao;
import com.bitjeju.lms.student.grade.model.StuGradeDto;
import com.bitjeju.member.MemberDto;




@WebServlet("/lmsstugrade.bit")
public class StuGradeController extends HttpServlet {
	HttpSession session;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		session = req.getSession(false);
		StuGradeDto bean=new StuGradeDto();
		MemberDto bean2=(MemberDto) session.getAttribute("login");
		int num=bean2.getNum();
		try {
			StuGradeDao dao=new StuGradeDao();
			bean=dao.selectGrade(num);
			
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("stuGrade.jsp").forward(req, resp);
		
		
	}

}
