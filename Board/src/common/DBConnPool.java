package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.eclipse.jdt.internal.compiler.ast.TrueLiteral;

public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	// 기본생성자
	public DBConnPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");

			// 커넥션 풀을 통해 연결 얻기
			con = source.getConnection();

			System.out.println("DB 커넥션 풀 연결 성공");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}

	// 연결해제
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();

			System.out.println("DB 커넥션 풀 지원 반납");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
