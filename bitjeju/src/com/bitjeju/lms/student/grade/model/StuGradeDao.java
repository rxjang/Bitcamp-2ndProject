package com.bitjeju.lms.student.grade.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StuGradeDao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public StuGradeDao() throws SQLException {
		String driver="oracle.jdbc.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		conn=DriverManager.getConnection(url, user, password);
	}
	
	public StuGradeDto selectGrade(int num) throws SQLException{
		StuGradeDto bean=null;
		String sql="select * from grade where num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		try{
			if(rs.next()){
				bean=new StuGradeDto();
				bean.setNum(rs.getInt("num"));
				bean.setExam1(rs.getInt("exam1"));
				bean.setExam2(rs.getInt("exam2"));
				bean.setExam3(rs.getInt("exam3"));
			}
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}	
		return bean;
	}
}