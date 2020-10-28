package com.bitjeju.lms.sales.recruit.model;

import java.sql.*;
import java.util.ArrayList;

public class RecruitDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public RecruitDao() {
		// TODO Auto-generated constructor stub
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // catch

	}// constructor

	// ***********************업로드한 파일명과 모집공고 정보 DB에 입력**************************

	/*
	 * create table recruit (--모집공고게시판>>select * from lecture;>>모집공고 업로드하는 form>>
	 * 입력>>리쿠르트테이블에 insert recruit_name varchar2(150) not null, recruit_file_name
	 * varchar2(200), recruit_state varchar2(20), --공고없음, 모집전 ,모집중, 모집마감??
	 * recruit_num number primary key, foreign key(recruit_num) references
	 * lectures(lecture_num) );
	 * 
	 * 
	 */
	public void recruitUpload(String lecture_name, String file_name, String thumbnail) throws SQLException {

		String sql2 = "select lecture_num from lectures where lecture_name = ?";
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, lecture_name);
		rs = pstmt.executeQuery();
		System.out.println(sql2);
		int lecture_num = -1;
		if (rs.next()) {
			lecture_num = rs.getInt("lecture_num");
		}
		if (pstmt != null)
			pstmt.close();

		String sql = "insert into recruit values (?,?,?)";
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, file_name);
		pstmt.setInt(2, lecture_num);
		pstmt.setString(3, thumbnail);
		pstmt.executeQuery();

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

	}// recruitupload

	public void updateRecruit(String lecture_name, String file_name, String thumbnail) throws SQLException {
		String sql2 = "select lecture_num from lectures where lecture_name = ?";
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, lecture_name);
		rs = pstmt.executeQuery();
		System.out.println(sql2);
		int lecture_num = -1;
		if (rs.next()) {
			lecture_num = rs.getInt("lecture_num");
		}
		if (pstmt != null)
			pstmt.close();

		String sql = "update recruit set recruit_file_name=?, thumbnail=? where recruit_num=? ";
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, file_name);
		pstmt.setString(2, thumbnail);
		pstmt.setInt(3, lecture_num);
		pstmt.executeQuery();

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}// update

	public ArrayList<RecruitDto> selectAll() throws SQLException {

//		create table recruit (--모집공고게시판>>select * from lecture;>>모집공고 업로드하는 form>> 입력>>리쿠르트테이블에 insert
//		recruit_file_name varchar2(200),
//		recruit_num number primary key,	
//		foreign key(recruit_num) references lectures(lecture_num)
//	);
		RecruitDto bean = null;
		ArrayList<RecruitDto> recruitList = new ArrayList<RecruitDto>();
		String sql = "select * from recruit";
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			bean = new RecruitDto();
			bean.setRecruit_file_name(rs.getString("recruit_file_name"));
			bean.setRecruit_num(rs.getInt("recruit_num"));
			recruitList.add(bean);
		}
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

		return recruitList;
	}// selectAll

	public RecruitDto selectOne(int recruit_num) {
		RecruitDto bean = null;

		String sql = "select * from recruit where recruit_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recruit_num);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new RecruitDto();
				bean.setRecruit_file_name(rs.getString("recruit_file_name"));
				bean.setRecruit_num(recruit_num);
				bean.setThumbnail(rs.getString("thumbnail"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bean;
	}// selectone

	public ArrayList<RecruitDto> curriculumList() {

		ArrayList<RecruitDto> list = new ArrayList<RecruitDto>();
		String sql = "select * from recruit natural join lectures where recruit_num=lecture_num";
		RecruitDto bean = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new RecruitDto();
				bean.setRecruit_file_name(rs.getString("recruit_file_name"));
				bean.setRecruit_num(rs.getInt("recruit_num"));
				bean.setRecruit_name(rs.getString("lecture_name"));
				bean.setEnd_day(rs.getDate("end_day"));
				bean.setStart_day(rs.getDate("start_day"));
				bean.setThumbnail(rs.getString("thumbnail"));
				list.add(bean);
				System.out.println(bean.toString());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public RecruitDto selectCurriculum(int recruit_num) {
		RecruitDto bean = null;
		String sql = "select * from (select * from recruit natural join lectures "
				+ "where recruit_num=lecture_num) where recruit_num = ?";		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recruit_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new RecruitDto();
				bean.setRecruit_file_name(rs.getString("recruit_file_name"));
				bean.setRecruit_num(rs.getInt("recruit_num"));
				bean.setRecruit_name(rs.getString("lecture_name"));
				bean.setEnd_day(rs.getDate("end_day"));
				bean.setStart_day(rs.getDate("start_day"));
				bean.setThumbnail(rs.getString("thumbnail"));
				System.out.println(bean.toString());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bean;
	}
	public void deleteOne(int recruit_num) {

		String sql = "delete from recruit where recruit_num = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recruit_num);
			pstmt.executeQuery();
			System.out.println(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} // finally

	}// delete

}
