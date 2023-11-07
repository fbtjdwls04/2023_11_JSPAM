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
	<script>
		function writeFormSubmit(e) {
			if(e.title.value.trim().length == 0){
				alert('제목을 입력해주세요');
				e.title.focus();
				return;
			}
			
			if(e.body.value.trim().length == 0){
				alert('내용을 입력해주세요');
				e.body.focus();
				return;
			}
			e.submit();
		}
	</script>
	<form action="doWrite" method="post" onsubmit="writeFormSubmit(this); return false;">
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