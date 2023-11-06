<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css" />
<title>Insert title here</title>
</head>
<body>
	<h1>게시물 작성</h1>
	
	<form action="doWrite" method="get">
		<div>
			제목 : <input name="title" type="text" placeholder="제목을 작성해주세요"/>
		</div>
		<div>
			내용 : <textarea name="body" id="" cols="30" rows="10"></textarea>
		</div>
		
		<button>작성</button>
	</form>
</body>
</html>