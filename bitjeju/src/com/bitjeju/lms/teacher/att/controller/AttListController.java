package com.bitjeju.lms.teacher.att.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitjeju.lms.teacher.att.model.AttendanceDao;
import com.bitjeju.lms.teacher.att.model.AttendanceDto;
import com.bitjeju.member.MemberDto;

@WebServlet("/lmsteacherattlist.bit")
public class AttListController extends HttpServlet {
	HttpSession session;
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   session=request.getSession(false);
	   request.setCharacterEncoding("utf-8");
	   MemberDto bean2=(MemberDto) session.getAttribute("login");
	   int num=bean2.getNum();
	   System.out.print("AttListController,num: "+num);
	   int pageNum;
	   int totalList=-1;
	   int classStu=-1;
	   if (request.getParameter("pageNum") != null) {
			System.out.println("pageNum:"+request.getParameter("pageNum"));
			pageNum = Integer.parseInt(request.getParameter("pageNum").trim());
	   }else {
			pageNum=1;
			System.out.println("pageNum :"+pageNum);
		}
	   ArrayList<AttendanceDto> list=null;
	   AttendanceDao dao=null;
	   try {
         dao=new AttendanceDao();
         list=dao.selectAll(pageNum,num);
         dao=new AttendanceDao();
         totalList=dao.totalList(num);
         dao=new AttendanceDao();
         classStu=dao.classStu(num);
      } catch (SQLException e) {
         e.printStackTrace();
      }
	   request.setAttribute("classStu", classStu);
	  request.setAttribute("pageNum", pageNum);
	  request.setAttribute("totalList", totalList);
	  request.setAttribute("list", list);
	  request.setAttribute("login", bean2);
      request.getRequestDispatcher("teacherAttList.jsp").forward(request, response);
      
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      Date nalja =null;
      int num=-1;
      String state=null;
      req.setCharacterEncoding("utf-8");
      
      Enumeration<String> en = req.getParameterNames();   
      while(en.hasMoreElements()) {
         
         String pa1 = en.nextElement();
         String pa2 = en.nextElement();
         String pa3 = en.nextElement();
      
         num = Integer.parseInt(req.getParameter(pa1).trim());
         nalja = Date.valueOf(req.getParameter(pa2).trim());
         state = req.getParameter(pa3).trim();
         try {
            AttendanceDao dao=new AttendanceDao();
            dao.insertAll(nalja, num, state);
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }//while
    
      resp.sendRedirect("lmsteacherattlist.bit");   
   }

}