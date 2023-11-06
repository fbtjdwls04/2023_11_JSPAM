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
	<h1>회원 가입</h1>
	<script>
		const joinFormSubmit = (e) => {
			
			const loginId = e.loginId.value.trim();
			const loginPw = e.loginPw.value.trim();
			const loginPwChk = e.loginPwChk.value.trim();
			const userName = e.userName.value.trim();
			
			if(loginId.length == 0){
				alert('아이디를 입력해주세요');
				e.loginId.focus();
				return;
			}
	
			if(loginPw.length == 0){
				alert('비밀번호를 입력해주세요');
				e.loginPw.focus();
				return;
			}
			
			if(loginPw != loginPwChk){
				alert('비밀번호가 일치하지 않습니다');
				e.loginPwChk.focus();
				return;
			}
			
			if(userName.length == 0){
				alert('이름을 입력해주세요');
				e.userName.focus();
				return;
			}
			
			e.submit();
		} 
	</script>	
	<form action="doJoin" method="post" onsubmit="joinFormSubmit(this); return false;">
		<div>
			아이디 : <input name="loginId" type="text" autocomplete="off"/>
		</div>
		<div>
			비밀번호 : <input name="loginPw" type="password"/>
		</div>
		<div>
			비밀번호 확인 : <input name="loginPwChk" type="password"/>
		</div>
		<div>
			이름 : <input name="userName" type="text"/>
		</div>
		
		<button>확인</button>
	</form>
	<a href="../home/main">홈으로</a>
</body>
</html>