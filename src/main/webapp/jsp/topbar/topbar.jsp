<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	int loginedMemberId = (int) request.getAttribute("loginedMemberId");
%>

<% if(loginedMemberId == -1) {%>
	<li><a href="../member/join">회원 가입</a></li>
	<li><a href="../member/login">로그인</a></li>
<%} %>
<% if(loginedMemberId != -1) {%>
	<li><a href="../member/doLogout">로그 아웃</a></li>
	<li><a href="../article/write">게시물 작성</a></li>
<%} %>