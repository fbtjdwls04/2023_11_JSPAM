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

@WebServlet("/article/modify")
public class ArticleModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8;");
		
		String inputId = request.getParameter("id");
		int id = Integer.parseInt(inputId);
		
		HttpSession session = request.getSession();
		
		int loginedMemberId = -1;
		
		if(session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int)session.getAttribute("loginedMemberId");
		}
		
		Connection conn = null;
		
		try {
			Class.forName(Config.getDriverName());
			String url = Config.getDBUrl();
			conn = DriverManager.getConnection(url, Config.getDBUser(), Config.getDBPassWd());
			
			SecSql sql = new SecSql();
			sql.append("SELECT * FROM article");
			sql.append("WHERE id = ?",id);
			
			Map<String, Object> articleMap = DBUtil.selectRow(conn, sql);
			
			int writerId = (int) articleMap.get("memberId");
			
			if(writerId != loginedMemberId) {
				response.getWriter().append(String.format("<script>alert('권한이 없습니다'); location.replace('detail?id=%d')</script>",id));
				return;
			}
			
			request.setAttribute("articleMap", articleMap);
			
			request.getRequestDispatcher("/jsp/article/modify.jsp").forward(request, response);
			
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
	
}
