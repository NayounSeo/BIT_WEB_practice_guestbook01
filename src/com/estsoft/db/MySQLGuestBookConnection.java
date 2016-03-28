package com.estsoft.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLGuestBookConnection implements DBConnection {
	//인터페이스를 임플리먼트!! 이걸 만들면서 해결해 준 것은??
	
	//아 여기서는 table이 아니라 DB...!!!!
	public Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			// 1. 드라이버 로드
			Class.forName("com.mysql.jdbc.Driver");
			// 2. Connection 얻기
			String url = "jdbc:mysql://localhost/webdb";
			conn = DriverManager.getConnection(url, "guestbook", "guestbook");
		} catch (ClassNotFoundException ex) {
			System.out.println("드라이버를 찾을 수 없습니다 : " + ex);
		}
		return conn;
	}

}
