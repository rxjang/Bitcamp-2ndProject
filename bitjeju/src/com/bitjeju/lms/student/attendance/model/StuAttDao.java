package com.bitjeju.lms.student.attendance.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StuAttDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public StuAttDao() throws SQLException {
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
	
	public StuAttDto selectAll(int num) throws SQLException{
		String sql="select * from attendance where num=?";
		StuAttDto bean=new StuAttDto();
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		ArrayList<String> attList=new ArrayList<String>();
		while(rs.next()){
			attList.add(rs.getString("state"));
		}
		bean.setAttList(attList);
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		
		return bean;
	}
	
	public ArrayList<StuAttDto> selectState(int num,String state) throws SQLException{
		ArrayList<StuAttDto> list=new ArrayList<StuAttDto>();
		String sql="select * from attendance where num=? and state=?";
		String status=null;
		if(state.equals("late")){
			status="지각";
		}else if(state.equals("leave")){
			status="조퇴";
		}else if(state.equals("absent")){
			status="결석";
		}
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, status);
			System.out.println(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				list.add(new StuAttDto(rs.getDate("nalja"),rs.getString("state")));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}
	
	
	
}