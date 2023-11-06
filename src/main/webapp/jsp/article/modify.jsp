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
<link rel="stylesheet" href="../css/style.css" />
<title>Insert title here</title>
</head>
<body>
	<h1>게시물 수정</h1>
	
	<form action="doModify" method="post" style="border: 2px solid black; width: 500px; height: 500px;">
		<input name="id" type="hidden" value="<%= (int) todo.get("id") %>"/>
		<div>번호 : <%= (int) todo.get("id") %></div>
		<div>작성일 : <%= (LocalDateTime) todo.get("regDate") %></div>
		<div>수정일 : <%= (LocalDateTime) todo.get("updateDate") %></div>
		<div>제 목 : <input name="title" type="text" value="<%= (String) todo.get("title") %>" /></div>
		<div>내 용 : <textarea name="body" id="" cols="30" rows="10"><%= (String )todo.get("body") %></textarea></div>
		<button>수정 완료</button>
		<a href="detail?id=<%=(int)todo.get("id")%>">취소</a>
	</form>
	<a href="list">게시물 목록</a>
</body>
</html>