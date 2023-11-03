<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int from = (int)request.getAttribute("from");
	int end = (int)request.getAttribute("end");
	int cPage = (int)request.getAttribute("page");
	int totalPage = (int) request.getAttribute("totalPage");
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
		.paging > .red {
			color: red;
			font-size: 1.5rem;
			font-weight: bold;
		}
	</style>
<title>Article List</title>
</head>
<body>
	<div>게시물 리스트</div>
	<table border="1">
		<colgroup>
			<col />
			<col width="200"/>
		</colgroup>
		<tr>
			<th>번호</th>
			<th>날짜</th>
			<th>제목</th>
		</tr>
		<% for(Map<String,Object> articleMap : articleListMap) { %> 
			<tr>
				<td><%=articleMap.get("id") %></td>
				<td><%=articleMap.get("regDate") %></td>
				<td><a href="detail?id=<%=articleMap.get("id") %>"><%=articleMap.get("title") %></a></td>
			</tr>
		<% } %>
	</table>
	
	
	
	<div class="paging" style="margin-top: 20px; margin-left: 20px; ">
		<%if(cPage > 1) {%>
			<a href="list?page=1">처음으로</a>
		<%} %>
			
		<% for(int i = from; i <= end; i++) { %>
			<a class="<%=cPage == i ? "red" : "" %>" href="list?page=<%=i%>"><%=i%></a>&nbsp;
		<%} %>
		<%if(cPage < totalPage) {%>
			<a href="list?page=<%=totalPage%>">끝으로</a>
		<%} %>
	</div>
	
	<br />
	
	<a href="../home/main">메인 페이지</a>
</body>
</html>