package com.bitjeju.member;

import java.sql.*;
import java.util.ArrayList;

public class MemberDao {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;

	public MemberDao() {
		// TODO Auto-generated constructor stub
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} // tryCatch

	}// constructor

	public MemberDto loginValidation(String id, String password) throws SQLException {

		String sql = "select num,id_email,name,dept,lvl,password,phone,lecture from member natural join bitjejudept where id_email=? and password=?";
		// id와 pw 일치하는 회원의 정보를 모두 가져온다.
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		System.out.println(sql);
		rs = pstmt.executeQuery();

		MemberDto bean = null;
		if (rs.next()) {
			bean = new MemberDto();
			bean.setNum(rs.getInt("num"));
			bean.setId_email(rs.getString("id_email"));
			bean.setName(rs.getString("name"));
			bean.setDept(rs.getString("dept"));
			bean.setLvl(rs.getInt("lvl"));
			bean.setPassword(rs.getString("password"));
			bean.setPhone(rs.getString("phone"));
			bean.setLecture(rs.getString("lecture"));

		} else {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			return new MemberDto("fail"); // 객체생성후 id_email에 실패라고 저장하고 반환.
		}
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		// if
		return bean; // 로그인 성공하면 회원정보를 담은 bean을 반환
	}// login검증

	public ArrayList<MemberDto> selectAll(int pageNum, String key, String word) throws SQLException {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();

		int startNum = 1 + (pageNum - 1) * 5;
		int endNum = 5 + (pageNum - 1) * 5;// 페이지당 게시글 수
		// 게시글 컬럼명 제목 or 글쓴이
		// 게시글 검색어
//		if (key == null)
//			key = "title";
//		if (word == null)
//			word = "";

		String sql = "select * from (select num,id_email, name, dept, lvl, phone, lecture, rownum as rwn from ";
		sql += "(select * from member natural join bitjejudept where " + key + " like '%" + word + "%')) ";
		sql += "where rwn between " + startNum + " and " + endNum;
		System.out.println(sql);

		MemberDto bean = null;

		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			bean = new MemberDto();
			bean.setNum(rs.getInt("num"));
			bean.setId_email(rs.getString("id_email"));
			bean.setName(rs.getString("name"));
			bean.setDept(rs.getString("dept"));
			bean.setLvl(rs.getInt("lvl"));
			bean.setPhone(rs.getString("phone"));
			bean.setLecture(rs.getString("lecture"));
			list.add(bean);

		} // while

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

		return list;
	}// selectAll

	public int totalMember(String key, String word) throws SQLException {// 검색할때도 조건에 맞는 모든 row수를 세서 반환.
		String sql = "select count(*) as total from (select rownum as rwn from ";
		sql += "(select * from member natural join bitjejudept where " + key + " like '%" + word + "%')) ";
		// String sql = "select count(*) as total from member";
		int totalMember = -1;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next())
			totalMember = rs.getInt("total");

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		return totalMember;
	}

	public int totalStudent(String key, String word) throws SQLException {

		String sql = "select count(*) as total from (select rownum as rwn from ";
		sql += "(select * from member natural join bitjejudept where " + key + " like '%" + word
				+ "%' and dept ='수강생')) ";
		// String sql = "select count(*) as total from member where lvl=2";
		int totalStudent = -1;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next())
			totalStudent = rs.getInt("total");

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		return totalStudent;
	}

	public ArrayList<MemberDto> stuSelectAll(int pageNum, String key, String word) throws SQLException {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		// String sql ="select * from member where dept='수강생'";
		MemberDto bean = null;

		int startNum = 1 + (pageNum - 1) * 5;
		int endNum = 5 + (pageNum - 1) * 5;// 페이지당 게시글 수

		String sql = "select * from (select num,id_email, name, dept, lvl, phone, lecture, rownum as rwn from ";
		sql += "(select * from member natural join bitjejudept where " + key + " like '%" + word
				+ "%' and dept ='수강생')) ";
		sql += "where rwn between " + startNum + " and " + endNum;
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			bean = new MemberDto();
			bean.setNum(rs.getInt("num"));
			bean.setId_email(rs.getString("id_email"));
			bean.setName(rs.getString("name"));
			bean.setDept(rs.getString("dept"));
			bean.setLvl(rs.getInt("lvl"));
			bean.setPhone(rs.getString("phone"));
			bean.setLecture(rs.getString("lecture"));
			list.add(bean);

		} // while

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

		return list;
	}// stselectAll()

	public MemberDto selectOne(int num) {
		// String sql = "select * from member where num=?";
		String sql = "select num, id_email, name, dept, lvl, phone, "
				+ "lecture from member natural join bitjejudept where num=?";
		MemberDto bean = null;
//.........
		/*
		 * String sqldept = "select dept from bitjejudept where lvl=?";
		 * 
		 * select num, id_email, name, dept, lvl, phone, lecture from member natural
		 * join bitjeju
		 * 
		 */
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new MemberDto();
				bean.setNum(rs.getInt("num"));
				bean.setId_email(rs.getString("id_email"));
				bean.setName(rs.getString("name"));
				bean.setDept(rs.getString("dept"));
				bean.setLvl(rs.getInt("lvl"));
				bean.setPhone(rs.getString("phone"));
				bean.setLecture(rs.getString("lecture"));

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
		}//finally

		return bean;
	}// selectOne

	public void deleteOne(int num, String email) throws SQLException {
		String sql = "delete from member where num=? and id_email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, email);
		System.out.println(sql);
		pstmt.executeQuery();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}// delete

	public void insertOne(String emailid, String name, String dept, String pw, int phone) throws SQLException {
		// 직원등록할때,
		int lvl = -1;
		if (dept.equals("강사")) {
			lvl = 3;
		} else if (dept.equals("영업")) {
			lvl = 4;
		} else if (dept.equals("행정")) {
			lvl = 5;
		} else if (dept.equals("회계")) {
			lvl = 4;
		} else if (dept.equals("취업")) {
			lvl = 3;
		} else if (dept.equals("관리자")) { // 부서에 따라 레벨 자동부여
			lvl = 6;
		}
		String sql = "insert into member values (member_seq.nextval,";
		sql += "?,?,?,?,?,null)";
//이메일 이름 부서 레벨 비번 전화번호 강좌명 

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, emailid);
		pstmt.setString(2, name);
		pstmt.setInt(3, lvl);
		pstmt.setString(4, pw);
		pstmt.setInt(5, phone);
		System.out.println(sql);
		rs = pstmt.executeQuery();

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

	}// insert

	public int signUp(String id_email, String name, String password, String phone) throws SQLException {

		// insert into member values
		// (member_seq.nextval||member_seq.currval,'teacher6@email.com',
		// '정민재','강사',3,'password'
		// ,01012341235,null);

		String sql2 = "select id_email from member where id_email = ?";
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, id_email);
		System.out.println(sql2);
		rs = pstmt.executeQuery();
		if (rs.next()) {

			return -1;
		}

		if (pstmt != null)
			pstmt.close();

		String sql = "insert into member values (member_seq.nextval" + ",?,?,0,?,?,null)";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id_email);
		pstmt.setString(2, name);
		pstmt.setString(3, password);
		pstmt.setString(4, phone);
		System.out.println(sql);
		pstmt.executeQuery();

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		return 1;

	}// signUp

	public int signUp(String id_email) throws SQLException {

		String sql = "select * from member where id_email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id_email);
		rs = pstmt.executeQuery();
		if (rs.next()) {

			return -1;
		}

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

		return 1;
	}// singUp

	public void passwordUpdate(String password, String id_email) throws SQLException {
		String sql = "update member set password=? where id_email=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, password);
		pstmt.setString(2, id_email);
		pstmt.executeQuery();

		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

	}

	public void phoneUpdate(String phone, String id_email) throws SQLException {
		String sql = "update member set phone=? where id_email=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone);
		pstmt.setString(2, id_email);
		pstmt.executeQuery();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

	}// updatePhone

	public void updateLevel(int deptLevel, int num) throws SQLException {
		String sql = "update member set lvl = ? where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, deptLevel);
		pstmt.setInt(2, num);
		pstmt.executeQuery();
		System.out.println(sql);
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();

	}// updatelvl

	public void enrolment(String lecture, int num) {
		String sql = "update member set lecture = ? where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lecture);
			pstmt.setInt(2, num);
			pstmt.executeQuery();

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
	}// enrolment

	public int deleteMeValidation(int num, String password) {

		String sql = "select password from member where num = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			System.out.println(sql);
			String pw = null;

			if (rs.next()) {
				pw = rs.getString("password");
				System.out.println("pw from DB = "+pw);
				System.out.println("password = "+password);
				System.out.println(pw==password);
				if (pw.equals(password)) {

					pstmt.close();
					String sql2 = "delete from member where num = ?";
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, num);
					pstmt.executeQuery();
					System.out.println(sql2);

					result = 1;
				} else if (pw != password) {
					result = 2;
				}
			} // if

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
//비번이 일치하면 1 틀리면 2 
		System.out.println("result = "+result);
		return result;
	}// 탈퇴검증
	

	public void deleteMe(int num) throws SQLException {
		String sql = "delete from member where num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		System.out.println(sql);
		pstmt.executeQuery();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	} // deleteMe 탈퇴
	
	
	
}// classEnd
