<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String, Object> todo = (Map<String, Object>) request.getAttribute("articleMap");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="border: 2px solid black; width: 500px; height: 500px;">
		<div>번호 : <%= (int) todo.get("id") %></div>
		<div>작성일 : <%= (LocalDateTime) todo.get("regDate") %></div>
		<div>수정일 : <%= (LocalDateTime) todo.get("updateDate") %></div>
		<div>제 목 : <%= (String) todo.get("title") %></div>
		<div>내 용 : <%= (String )todo.get("body") %></div>
	</div>
	<a href="list">게시물 목록</a>
	<a href="delete?id=<%=(int)todo.get("id")%>">게시물 삭제</a>
</body>
</html>