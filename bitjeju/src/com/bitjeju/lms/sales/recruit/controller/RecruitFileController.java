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
		//**********************************���� ���� ������**********************************
		
		int lecture_num = Integer.parseInt(request.getParameter("lecture_num"));
		
		LectureDao dao = new LectureDao();
		LectureDto bean = null;
		
		try {
			bean = dao.selectOne(lecture_num); //���������޾Ƽ�.
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

		//****************************************���� ���ε�****************************************
		//""+System.currentTimeMillis()
		//������ �Ķ���� (request, Directory, int maxPostSize)
		//������ �Ķ���� (request, Directory, int maxPostSize, File rename)
		//������ �Ķ���� (request, Directory, int maxPostSize, encoding , File rename)
		
				//1byte 1kb 1mb 1gb
	
		//String rename=""+System.currentTimeMillis();
		DefaultFileRenamePolicy frp = new DefaultFileRenamePolicy();//���ϸ��� ������ rename���ش�.	
		
		MultipartRequest mpReq = new MultipartRequest(request, path, fsize, "utf-8" ,frp);// ���ε��ϴ� ���� �޴� ��ü	
													//���� ��û, ���, ����ũ��, ���ڵ� ����, rename��ü
		
		
		Enumeration en = mpReq.getParameterNames();
		
		String lecture_name = null;
		
		while(en.hasMoreElements()) {
			String lecture = (String)en.nextElement();//�����̸�
			lecture_name = mpReq.getParameter(lecture);
		}
		
		String thumbnail_name = mpReq.getFilesystemName("thumbnail");//��������ϸ�
		String file_name = mpReq.getFilesystemName("recruitfile");//��������ϸ�
		
		System.out.println(lecture_name); //�������� ����
		System.out.println(thumbnail_name); //��Ͽ��� ���̴� ����� �̹���
		System.out.println(file_name);//�������� �̹�������
		
		RecruitDao dao = new RecruitDao();
		
		try {
		//*************************DB�� �������� ���� ����********************************
			
			dao.recruitUpload(lecture_name,file_name,thumbnail_name);//���¸����� ���¹�ȣã��, ���ϸ�,����ϸ� ����
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.getRequestDispatcher("lmssalesrecruitlist.bit").forward(request, response);//���������������޴��� �̵�.
		
	}

}
