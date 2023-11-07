<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int loginedMemberId = (int) request.getAttribute("loginedMemberId");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/mainStyle.css" />
<title>Insert title here</title>
</head>
<body>
	<nav>
		<h1>메인 페이지</h1>
		<ul>
			<% if(loginedMemberId == -1) {%>
				<li><a href="../member/join">회원 가입</a></li>
				<li><a href="../member/login">로그인</a></li>
			<%} %>
			<% if(loginedMemberId != -1) {%>
				<li><a href="../member/doLogout">로그 아웃</a></li>
			<%} %>
			<li><a href="../article/list">게시물 목록</a></li>
			<li><a href="../article/write">게시물 작성</a></li>
		</ul>
	</nav>
</body>
</html>