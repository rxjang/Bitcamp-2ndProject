package com.bitjeju.lms.sales.assign.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AssignDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public AssignDao() throws SQLException {
		String driver="oracle.jdbc.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<AssignDto> selectLecture() throws SQLException{
		ArrayList<AssignDto> list=new ArrayList<AssignDto>();
		String sql="select lecture_name,lecture_num from lectures where start_day>sysdate";
		//현재 개강 전의 강의만 선택할 수 있도록 함
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				list.add(new AssignDto(rs.getString("lecture_name"),rs.getInt("lecture_num")));
			}
		}finally{
			if(rs!=null)rs.close(); 
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}
	
	public ArrayList<AssignDto> selectAll(int pageNum, String word) throws SQLException{
		ArrayList<AssignDto> list=new ArrayList<AssignDto>();
		
		int startNum=1+(pageNum-1)*5;
		int endNum =5+(pageNum-1)*5;
		
		String sql ="select * from (select num,lecture_name,name,start_day,lvl, rownum as rwn from (select m.num, name,"
				+ "lecture_name,start_day,lvl from member m inner join lectures l on m.lecture=l.lecture_name where "
				+ "lvl<3 and m.lecture is not null and name like '%"+word+"%')) where rwn between "+startNum+" and "+endNum +" order by lvl asc";
		
		System.out.println(sql);

		AssignDto bean = null;

		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			bean = new AssignDto();
			bean.setLvl(rs.getInt("lvl"));
			bean.setNum(rs.getInt("num"));
			bean.setLecture_name(rs.getString("lecture_name"));
			bean.setName(rs.getString("name"));
			bean.setStart_day(rs.getDate("start_day"));
			list.add(bean);

		} 
		
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
		
		return list;
	}
	
	public int totalStudent(String word) throws SQLException{
		int totalStudent=-1;
		String sql="select count(*) as total from member where lvl<3";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next())totalStudent=rs.getInt("total");
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();

		return totalStudent;
	}
	
	public ArrayList<AssignDto> selecOnetLecture(int lecture_num) throws SQLException{
		ArrayList<AssignDto> list=new ArrayList<AssignDto>();
		String sql="select member.num, name,lecture_name,start_day,lvl from member, lectures where "
				+ "member.lecture=lectures.lecture_name and lvl<3 and lecture_num=? order by lvl asc";
		System.out.println(sql);
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, lecture_num);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			list.add(new AssignDto(rs.getInt("num"),rs.getInt("lvl"),rs.getString("lecture_name"),rs.getString("name"),rs.getDate("start_day")));
		}
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
		
		return list;
	}
	
	public int updateLvl(int num) throws SQLException{
		String sql="update member set lvl=2 where num=?";
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}//등급 업데이트
	
	public int insertNum(int num) throws SQLException{
		String sql="insert into grade (num) values (?)";
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}//성적테이블에 학번 추가
	
}