<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>doSignin</title>
	</head>
	<body>
		
		<script>
			if(${chkSignIn} == 1){
				alert("로그인 성공");
				location.href="/index";
			}else if(${chkSignIn}==0){
				alert("아이디 또는 패스워드가 일치하지 않습니다.");
				location.href="/member/signin";
			}else{
				alert("로그아웃 되었습니다.");
				
				location.href="/index";
			}
		</script>
	</body>
</html>