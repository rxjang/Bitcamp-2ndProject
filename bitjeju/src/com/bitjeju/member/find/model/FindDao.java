package com.bitjeju.member.find.model;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.*;



//javamail.jar ���̺귯�� ���� �ޱ�. 
//534-5.7.14 ������ �߻��ϴ� ��쿡��  https://www.google.com/settings/security/lesssecureapps
//���� ������ ���� ���� �������� ������� ����
public class FindDao {
	private final String user = "bitjeju164@gmail.com"; // �߽����� �̸��� ���̵� �Է�
	private final String password = "bitcamp164!!";
	Properties prop;
	Session session;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	
	
	public FindDao(){
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
		}
		
		
	}// constructor

	public String findEmail(String name, String phone) {
		System.out.println(name+phone);
		String sql = "select id_email from member where name =? and phone =?";
		String id_email = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id_email = rs.getString("id_email");
			}//if
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}//finally
		return id_email;
	}//findEmail
	
	
	public void sendEmail(String id_email) {
		String user_password = null;
		
		
		
		String sql = "select password from member where id_email=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id_email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user_password = rs.getString("password");
			}
			System.out.println(id_email);
			System.out.println(user_password);
			
			prop = new Properties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", 465);
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.ssl.enable", "true");
			prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});// session
			
			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			// �����ڸ����ּ�
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(id_email));
			// Subject
			message.setSubject("bitjeju ��й�ȣ �Դϴ�."); // ���� ������ �Է�
			// Text
			message.setText(user_password); // ���� ������ �Է�
			// send the message
			Transport.send(message); //// ����
			System.out.println("message sent successfully...");
/*
 * <table><tr><td><small>���� ��й�ȣ�Դϴ�.</small></td></tr><tr><td></td></tr></table>
 * 			
 */
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}//sendPW
	
}// class
