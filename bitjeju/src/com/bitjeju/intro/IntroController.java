package com.bitjeju.intro;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/intro.bit")
public class IntroController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		int aTag=-1;
		
		try {
			aTag = Integer.parseInt(req.getParameter("a"));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
		}
		
		req.setAttribute("a", aTag);
		req.getRequestDispatcher("intro.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
