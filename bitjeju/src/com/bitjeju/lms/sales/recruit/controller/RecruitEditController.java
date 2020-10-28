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
			bean = dao.selectOne(recruit_num); // �������̺�, ������̺� ������ ������ ��� �����´�.
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

		// ****************************************����
		// ���ε�****************************************
		// ""+System.currentTimeMillis()
		// ������ �Ķ���� (request, Directory, int maxPostSize)
		// ������ �Ķ���� (request, Directory, int maxPostSize, File rename)
		// ������ �Ķ���� (request, Directory, int maxPostSize, encoding , File rename)

		// 1byte 1kb 1mb 1gb

		// String rename=""+System.currentTimeMillis();
		DefaultFileRenamePolicy frp = new DefaultFileRenamePolicy();// ���ϸ��� ������ rename���ش�.

		MultipartRequest mpReq = new MultipartRequest(request, path, fsize, "utf-8", frp);// ���ε��ϴ� ���� �޴� ��ü
		// ���� ��û, ���, ����ũ��, ���ڵ� ����, rename��ü

		Enumeration en = mpReq.getParameterNames();

		String lecture_name = null;

		while (en.hasMoreElements()) {
			String lecture = (String) en.nextElement();// �����̸�
			lecture_name = mpReq.getParameter(lecture);
		}

		String file_name = mpReq.getFilesystemName("recruitfile");// ��������ϸ�
		String thumbnail_name = mpReq.getFilesystemName("thumbnail");//��������ϸ�
		
		System.out.println(lecture_name);
		System.out.println(file_name);

		dao = new RecruitDao();
		try {
			// *************************DB�� �������� ���� ����********************************

			dao.updateRecruit(lecture_name, file_name, thumbnail_name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("lmssalesrecruitlist.bit");
	}

}
