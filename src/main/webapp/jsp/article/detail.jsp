<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String, Object> todo = (Map<String, Object>) request.getAttribute("articleMap");
	int loginedMemberId = (int) request.getAttribute("loginedMemberId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css" />
<title>Insert title here</title>
</head>
<body>
	<div style="border: 2px solid black; height: 500px;">
		<div>번호 : <%= (int) todo.get("id") %></div>
		<div>작성일 : <%= (LocalDateTime) todo.get("regDate") %></div>
		<div>수정일 : <%= (LocalDateTime) todo.get("updateDate") %></div>
		<div>작성자 : <%= (String) todo.get("name") %></div>
		<div>제 목 : <%= (String) todo.get("title") %></div>
		<div style="white-space: pre-wrap;">내 용 : <%= (String )todo.get("body") %></div>
	</div>
	<%if(loginedMemberId != -1 && loginedMemberId == (int) todo.get("memberId")) {%>
		<a href="modify?id=<%=(int)todo.get("id")%>">게시물 수정</a>
		<a href="delete?id=<%=(int)todo.get("id")%>" onclick="return confirm('게시물을 삭제하시겠습니까?')">게시물 삭제</a>
	<%} %>
	<br />
	<br />
	<a href="list">게시물 목록</a>
</body>
</html>