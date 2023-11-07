<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<script>
		const loginFormSubmit = (e) => {
			
			const loginId = e.loginId.value.trim();
			const loginPw = e.loginPw.value.trim();
			
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
			
			e.submit();
		} 
	</script>	
	<form action="doLogin" method="post" onsubmit="loginFormSubmit(this); return false;">
		<div>
			아이디 : <input name="loginId" type="text" autocomplete="off"/>
		</div>
		<div>
			비밀번호 : <input name="loginPw" type="password"/>
		</div>
		
		<button>확인</button>
	</form>
	<a href="../home/main">홈으로</a>
</body>
</html>