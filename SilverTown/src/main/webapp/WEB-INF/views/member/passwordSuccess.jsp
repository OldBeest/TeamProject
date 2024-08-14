<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>비밀번호 찾기 성공</title>
</head>
<body>
    <h1>비밀번호 찾기</h1>
    <p>${message}</p>
    <button onclick="window.location.href='/index'">메인 화면으로</button>
</body>
</html>