package com.bitjeju.customer.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Logger;

public class NoticeDao {

	java.util.logging.Logger log = Logger.getGlobal();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	SimpleDateFormat sdf1;
	SimpleDateFormat sdf2;

	public NoticeDao() {
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public NoticeDao(int int1, String string, String string2) {
		// TODO Auto-generated constructor stub
	}

	public ArrayList<NoticeDto> selectAll(int pageNum, String word) {
		int startNum = 1 + (pageNum - 1) * 5;
		int endNum = 5 + (pageNum - 1) * 5;
		String sql = "select * from notice order by ntnum desc"; // 최신글을 위로
		ArrayList<NoticeDto> list = new ArrayList<NoticeDto>();
		String sql2 = "select * from (select rownum as rwn,ntnum,title,num,wtime,content,read_cnt from (select * from notice "
				+ "where title like '%" + word + "%' order by ntnum desc)) where rwn between " + startNum + " and "
				+ endNum;
		try {
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeDto bean = new NoticeDto();

				Date wtime = rs.getDate("wtime");
				java.util.Date today = new java.util.Date();
				sdf1 = new SimpleDateFormat("YYYY-MM-dd");
				sdf2 = new SimpleDateFormat("HH:mm");
				String stToday = sdf1.format(today);
				if (sdf1.format(wtime).equals(stToday)) {
					bean.setWtimeStamp(sdf2.format(rs.getTimestamp("wtime")));
				}
				bean.setNtnum(rs.getInt("ntnum"));
				bean.setTitle(rs.getString("title"));
				bean.setNum(rs.getInt("num"));
				bean.setWtime(rs.getDate("wtime"));
				bean.setRead_cnt(rs.getInt("read_cnt"));
				list.add(bean);

				System.out.println(bean.toString());
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

		return list;
	}

	public int totalList() {
		String sql = "select count(*) as total from notice";
		int totalList = -1;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				totalList = rs.getInt("total");
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

		return totalList;
	}

	/*
	 * 
	 * int num, read_cnt; String title, writer, content, filename; Date wtime;
	 * 
	 * 
	 * 
	 * ntnum number primary key, title varchar2(100) not null, num number, wtime
	 * date, content varchar2(3000), read_cnt number,
	 */
	public void insertOne(String title, int num, String content, String fileName) {
		String sql = "insert into notice values (notice_seq.nextval,?,?,sysdate,?,null,?)";
		// ntnum title writer wtime content read_cnt
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setInt(2, num); // 회원번호로 저장함
			pstmt.setString(3, content);
			pstmt.setString(4, fileName);
			pstmt.executeUpdate();
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
			}
		} // finally
	}

	public NoticeDto selectOne(int ntnum) {
		String sql = "select * from notice where ntnum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ntnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Date wtime = rs.getDate("wtime");
				java.util.Date today = new java.util.Date();
				sdf1 = new SimpleDateFormat("YYYY-MM-dd");
				sdf2 = new SimpleDateFormat("HH:mm");
				String stToday = sdf1.format(today);

				System.out.println(sdf1.format(wtime));
				System.out.println(stToday);
				NoticeDto bean = new NoticeDto();
				if (sdf1.format(wtime).equals(stToday)) {
					bean.setWtimeStamp(sdf2.format(rs.getTimestamp("wtime")));
				}
				bean.setContent(rs.getString("content"));
				bean.setFilename(rs.getString("filename"));
				bean.setNtnum(rs.getInt("ntnum"));
				bean.setTitle(rs.getString("title"));
				bean.setRead_cnt(rs.getInt("read_cnt"));
				bean.setWtime(rs.getDate("wtime"));

				return bean;
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

		} // finally
		return null;
	}

	public void readCountUp(int ntnum) {
		int readCnt = 0;
		String sql1 = "select read_cnt from notice where ntnum = ?";
		String sql2 = "update notice set read_cnt=? where ntnum = ?";

		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, ntnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				readCnt = 1 + rs.getInt("read_cnt"); // 기존조회수 +1
				System.out.println(readCnt);
				System.out.println(rs.getInt("read_cnt"));
			}
			if (pstmt != null) {
				pstmt.close();
			}
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, readCnt);
			pstmt.setInt(2, ntnum);
			pstmt.executeQuery(); // 조회수 업뎃
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

	}

	public void updateOne(int ntnum, String title, int num, String content, String filename) {
		String sql = "update notice set title=?,num=?,content=?,wtime=sysdate,filename=? where ntnum=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setInt(2, num);
			pstmt.setString(3, content);
			pstmt.setString(4, filename);
			pstmt.setInt(5, ntnum);
			pstmt.executeUpdate();
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
	}// updaetone

	public void deleteOne(int ntnum) {

		String sql = "delete from notice where ntnum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ntnum);
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

	}// deleteone

}
