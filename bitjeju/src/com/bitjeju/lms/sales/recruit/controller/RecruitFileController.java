package com.bitjeju.lms.sales.recruit.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.sales.recruit.model.RecruitDao;
import com.bitjeju.lms.staff.lecture.model.LectureDao;
import com.bitjeju.lms.staff.lecture.model.LectureDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class RecruitFileController
 */			
@WebServlet("/lmssalesrecruitfile.bit")
public class RecruitFileController extends HttpServlet {



	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//**********************************파일 선택 페이지**********************************
		
		int lecture_num = Integer.parseInt(request.getParameter("lecture_num"));
		
		LectureDao dao = new LectureDao();
		LectureDto bean = null;
		
		try {
			bean = dao.selectOne(lecture_num); //강좌정보받아서.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("lecture", bean);
		request.getRequestDispatcher("salesRecruitFile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = request.getRealPath("./recruit");
		File file = new File(path);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		int fsize = 10*1024*1024;

		//****************************************파일 업로드****************************************
		//""+System.currentTimeMillis()
		//생성자 파라미터 (request, Directory, int maxPostSize)
		//생성자 파라미터 (request, Directory, int maxPostSize, File rename)
		//생성자 파라미터 (request, Directory, int maxPostSize, encoding , File rename)
		
				//1byte 1kb 1mb 1gb
	
		//String rename=""+System.currentTimeMillis();
		DefaultFileRenamePolicy frp = new DefaultFileRenamePolicy();//파일명이 같으면 rename해준다.	
		
		MultipartRequest mpReq = new MultipartRequest(request, path, fsize, "utf-8" ,frp);// 업로드하는 파일 받는 객체	
													//서블릿 요청, 경로, 파일크기, 엔코딩 설정, rename객체
		
		
		Enumeration en = mpReq.getParameterNames();
		
		String lecture_name = null;
		
		while(en.hasMoreElements()) {
			String lecture = (String)en.nextElement();//강좌이름
			lecture_name = mpReq.getParameter(lecture);
		}
		
		String thumbnail_name = mpReq.getFilesystemName("thumbnail");//저장된파일명
		String file_name = mpReq.getFilesystemName("recruitfile");//저장된파일명
		
		System.out.println(lecture_name); //모집공고 강좌
		System.out.println(thumbnail_name); //목록에서 보이는 썸네일 이미지
		System.out.println(file_name);//모집공고 이미지파일
		
		RecruitDao dao = new RecruitDao();
		
		try {
		//*************************DB에 모집공고 정보 저장********************************
			
			dao.recruitUpload(lecture_name,file_name,thumbnail_name);//강좌명으로 강좌번호찾기, 파일명,썸네일명 저장
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.getRequestDispatcher("lmssalesrecruitlist.bit").forward(request, response);//모집공고강좌정보메뉴로 이동.
		
	}

}
