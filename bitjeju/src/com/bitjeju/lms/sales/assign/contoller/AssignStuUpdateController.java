package com.bitjeju.lms.sales.assign.contoller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.sales.assign.model.AssignDao;



@WebServlet("/lmssalesassignupdate.bit")
public class AssignStuUpdateController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 AssignDao dao=null; 
		int num=Integer.parseInt(request.getParameter("num").trim());
		  System.out.println("num"+num);
		  	try {
				dao=new AssignDao();
				dao.updateLvl(num);
				dao=new AssignDao();
				dao.insertNum(num);
			} catch (SQLException e) {
				e.printStackTrace();
			} 
//		  	request.getRequestDispatcher("lmssalesassign.bit").forward(request, response);
		  	response.sendRedirect("lmssalesassign.bit");
	}

}