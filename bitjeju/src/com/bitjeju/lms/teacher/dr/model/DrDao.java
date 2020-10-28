package com.bitjeju.lms.teacher.dr.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DrDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DrDao() {
		String driver="oracle.jdbc.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<DrDto> getList(int pageNum, int num) throws SQLException{
		int post = 5;
		int startNum = 1 + (pageNum - 1) * post;
		int endNum = post + (pageNum - 1) * post;
		String sql="select * from (select rownum as rwn,drNum,drTitle,name,drdate,fileName,drContent from (select * from dataroom,member "
				+ "where member.num=dataroom.num and dataroom.num=? order by drNum desc)) where rwn between "+startNum+" and "+endNum;
		System.out.println(sql);
		ArrayList<DrDto> list=new ArrayList<DrDto>();
		DrDto bean=null;
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
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
	
	public int totalList(int num) throws SQLException {
		String sql = "select count(*) as total from (select rownum from dataroom, member"
				+ " where member.num=dataroom.num and dataroom.num=?)";
		int totalList = -1;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
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
	
	public int writeDr(String drTitle,int num,String fileName,String drContent) throws SQLException{
		String sql="insert into dataroom values(dataroom_seq.nextval,?,?,sysdate,?,?)";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,drTitle);
			pstmt.setInt(2, num);
			pstmt.setString(3, fileName);
			pstmt.setString(4, drContent);
			return pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}

	public int updateDr(int drNum,String drTitle,String fileName,String drContent) throws SQLException{
		String sql="update dataroom set drTitle=?,fileName=?,drContent=? where drNum=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, drTitle);
			pstmt.setString(2, fileName);
			pstmt.setString(3, drContent);
			pstmt.setInt(4, drNum);
			return pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	
	public int deleteDr(int drNum) throws SQLException{
		String sql="delete from dataroom where drNum=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, drNum);
			return pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	
}