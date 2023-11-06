package com.koreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.koreaIT.java.am.config.Config;
import com.koreaIT.java.am.util.DBUtil;
import com.koreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/member/doJoin")
public class memberDoJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8;");
		
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		String userName = request.getParameter("userName");
		
		
		Connection conn = null;
		
		try {
			Class.forName(Config.getDriverName());
			String url = Config.getDBUrl();
			conn = DriverManager.getConnection(url, Config.getDBUser(), Config.getDBPassWd());
			
			SecSql sql = new SecSql();
			sql.append("SELECT COUNT(*) > 0 FROM members");
			sql.append("WHERE loginId = ?",loginId);
			
			boolean userIdCheck = DBUtil.selectRowBooleanValue(conn, sql);
			if(userIdCheck) {
				response.getWriter().append(String.format("<script>alert('%s 는 이미 존재하는 아이디입니다.'); location.replace('join');</script>", loginId));
			}
			
			
			sql = new SecSql();
			sql.append("INSERT INTO members");
			sql.append("SET regDate = NOW(),");
			sql.append("updateDate = NOW(),");
			sql.append("loginId = ?,",loginId);
			sql.append("loginPw = ?,",loginPw);
			sql.append("`name` = ?", userName);
			
			DBUtil.insert(conn, sql);
			
			response.getWriter().append(String.format("<script>alert('%s님 가입 환영합니다.'); location.replace('../home/main');</script>", userName));
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("에러 : " + e);
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
