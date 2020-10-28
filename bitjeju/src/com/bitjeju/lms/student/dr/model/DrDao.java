package com.bitjeju.lms.student.dr.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bitjeju.lms.teacher.dr.model.DrDto;



public class DrDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DrDao() {
		String dirver="oracle.jdbc.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		try {
			Class.forName(dirver);
			conn=DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<DrDto> getList(int pageNum, String lecture) throws SQLException{
		int startNum = 1 + (pageNum - 1) * 5;
		int endNum = 5 + (pageNum - 1) * 5;
		String sql="select * from (select rownum as rwn,drNum,drTitle,name,drdate,fileName,drContent from "
				+ "(select * from dataroom,member where member.num=dataroom.num and dataroom.num="
				+ "(select num from member where lecture=? and lvl=3) order by drNum desc))"
				+ " where rwn between "+startNum+" and "+endNum;
		System.out.println(sql);
		ArrayList<DrDto> list=new ArrayList<DrDto>();
		DrDto bean=null;
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, lecture);
		rs=pstmt.executeQuery();
		try{
			while(rs.next()){
				bean=new DrDto();
				bean.setDrNum(rs.getInt("drNum"));
				bean.setDrTitle(rs.getString("drTitle"));
				bean.setName(rs.getString("Name"));
				bean.setDrDate(rs.getDate("drDate"));
				bean.setFileName(rs.getString("fileName"));
				bean.setDrContent(rs.getString("drContent"));
				list.add(bean);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}
	
	public int totalList(String lecture) throws SQLException {
		String sql = "select count(*) as total from (select rownum from dataroom, member"
				+ " where member.num=dataroom.num and dataroom.num=(select num from member where lecture=? and lvl=3))";
		int totalList = -1;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lecture);
		rs = pstmt.executeQuery();
		if (rs.next())
			totalList = rs.getInt("total");
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		return totalList;
	}
	
	public DrDto selectOne(int drNum) throws SQLException{
		DrDto bean=null;
		String sql="select drNum,drTitle,name,drdate,fileName,drContent from dataroom, member "
				+ "where member.num=dataroom.num and drNum=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, drNum);
		rs=pstmt.executeQuery();
		try{
			if(rs.next()){
				bean=new DrDto();
				bean.setDrNum(rs.getInt("drNum"));
				bean.setDrTitle(rs.getString("drTitle"));
				bean.setName(rs.getString("Name"));
				bean.setDrDate(rs.getDate("drDate"));
				bean.setFileName(rs.getString("fileName"));
				bean.setDrContent(rs.getString("drContent"));
			}
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return bean;
	}
}
