package com.bitjeju.lms.sales.recruit.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitjeju.lms.sales.recruit.model.RecruitDao;
import com.bitjeju.lms.sales.recruit.model.RecruitDto;
import com.bitjeju.lms.staff.lecture.model.LectureDao;
import com.bitjeju.lms.staff.lecture.model.LectureDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class RecruitEditController
 */
@WebServlet("/lmssalesrecruitedit.bit")
public class RecruitEditController extends HttpServlet {
	private int recruit_num;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
		this.recruit_num = recruit_num;
		LectureDao dao = new LectureDao();

		LectureDto bean = null;
		try {
			bean = dao.selectOne(recruit_num); // 강좌테이블, 멤머테이블 조인한 정보를 모두 가져온다.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("lecture", bean);
		request.getRequestDispatcher("salesRecruitEdit.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));

		String path = request.getRealPath("./recruit");
		
		
		RecruitDao dao = new RecruitDao();
		RecruitDto bean = dao.selectOne(recruit_num);
		File file = new File(path+"/"+bean.getRecruit_file_name());		
		File thumbnail = new File(path+"/"+bean.getThumbnail());		
		System.out.println(bean.getRecruit_file_name());
		
		if (file.delete()) {
			System.out.println("deleted~~ ");
		}
		if (thumbnail.delete()) {
			System.out.println("deleted~~ ");
		}
		
		
		
		file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}

		int fsize = 10 * 1024 * 1024;

		// ****************************************파일
		// 업로드****************************************
		// ""+System.currentTimeMillis()
		// 생성자 파라미터 (request, Directory, int maxPostSize)
		// 생성자 파라미터 (request, Directory, int maxPostSize, File rename)
		// 생성자 파라미터 (request, Directory, int maxPostSize, encoding , File rename)

		// 1byte 1kb 1mb 1gb

		// String rename=""+System.currentTimeMillis();
		DefaultFileRenamePolicy frp = new DefaultFileRenamePolicy();// 파일명이 같으면 rename해준다.

		MultipartRequest mpReq = new MultipartRequest(request, path, fsize, "utf-8", frp);// 업로드하는 파일 받는 객체
		// 서블릿 요청, 경로, 파일크기, 엔코딩 설정, rename객체

		Enumeration en = mpReq.getParameterNames();

		String lecture_name = null;

		while (en.hasMoreElements()) {
			String lecture = (String) en.nextElement();// 강좌이름
			lecture_name = mpReq.getParameter(lecture);
		}

		String file_name = mpReq.getFilesystemName("recruitfile");// 저장된파일명
		String thumbnail_name = mpReq.getFilesystemName("thumbnail");//저장된파일명
		
		System.out.println(lecture_name);
		System.out.println(file_name);

		dao = new RecruitDao();
		try {
			// *************************DB에 모집공고 정보 저장********************************

			dao.updateRecruit(lecture_name, file_name, thumbnail_name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("lmssalesrecruitlist.bit");
	}

}
