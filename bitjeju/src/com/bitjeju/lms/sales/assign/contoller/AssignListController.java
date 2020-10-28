package com.bitjeju.lms.sales.assign.contoller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.sales.assign.model.AssignDao;
import com.bitjeju.lms.sales.assign.model.AssignDto;


/**
 * Servlet implementation class AssignListController
 */
@WebServlet("/lmssalesassign.bit")
public class AssignListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String word=null;
		AssignDao dao=null;

		try{
			word=new String(request.getParameter("word").getBytes("ISO-8859-1"),"utf-8");
			//word=request.getParameter("word");
			System.out.println("1st "+word);
		}catch(NullPointerException e){
		}finally{
			if(word==null||word.trim()=="")word="";
			System.out.println("2nd "+word);
		}
		
		int pageNum;
		int totalStudent=-1;
		if(request.getParameter("pageNum")!=null){
			
			System.out.println("*************페이지넘버"+request.getParameter("pageNum"));
			
			pageNum=Integer.parseInt(request.getParameter("pageNum").trim());
		}else{
			pageNum=1;
		}
		
		ArrayList<AssignDto> bean=new ArrayList<AssignDto>();
		ArrayList<AssignDto> list=new ArrayList<AssignDto>();
		try {
			dao=new AssignDao();
			bean=dao.selectLecture();
			dao=new AssignDao();
			list=dao.selectAll(pageNum, word);
			dao=new AssignDao();
			totalStudent=dao.totalStudent(word);			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("lecturelist", bean);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalStudent", totalStudent);
		request.setAttribute("list", list);
		request.getRequestDispatcher("salesAssign.jsp").forward(request, response);		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			AssignDao dao=null;
		  request.setCharacterEncoding("utf-8");
		
			  int lecture_num= Integer.parseInt(request.getParameter("lecturelist").trim());
			  System.out.println("lecturenum"+lecture_num);
			  ArrayList<AssignDto> bean=new ArrayList<AssignDto>();
			  ArrayList<AssignDto> list = null;
			  try {
				dao=new AssignDao();
				list = dao.selecOnetLecture(lecture_num);
				dao=new AssignDao();
				bean=dao.selectLecture();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			  
			  request.setAttribute("lecturelist", bean);
			  request.setAttribute("list", list);
			  request.getRequestDispatcher("salesAssign.jsp").forward(request, response);		
		 
	}

}