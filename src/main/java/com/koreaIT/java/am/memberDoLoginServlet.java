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
import jakarta.servlet.http.HttpSession;

@WebServlet("/member/doLogin")
public class memberDoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8;");
		
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		
		
		Connection conn = null;
		
		try {
			Class.forName(Config.getDriverName());
			String url = Config.getDBUrl();
			conn = DriverManager.getConnection(url, Config.getDBUser(), Config.getDBPassWd());
			
			SecSql sql = new SecSql();
			sql.append("SELECT * FROM members");
			sql.append("WHERE loginId = ?",loginId);
			sql.append("AND loginPw = ?",loginPw);
			
			Map<String,Object> memberMap = DBUtil.selectRow(conn, sql);
			
			if(memberMap.isEmpty()) {
				response.getWriter().append("<script>alert('아이디와 비밀번호를 확인해주세요'); location.replace('login');</script>");
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("loginedMemberId", memberMap.get("id"));
			session.setAttribute("loginedMember", memberMap);
			
			response.getWriter().append(String.format("<script>alert('%s님 환영합니다!'); location.replace('../home/main'); </script>",(String) memberMap.get("name"), loginId));
			
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
