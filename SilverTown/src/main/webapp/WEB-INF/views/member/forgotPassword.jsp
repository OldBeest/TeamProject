<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>비밀번호 찾기</title>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const message = "${message}";
            if (message) {
                alert(message);
            }
        });
    </script>
</head>
<body>
    <h1>비밀번호 찾기</h1>
    <form action="/member/forgotPassword" method="post">
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" required>
        <button type="submit">비밀번호 찾기</button>
    </form>
</body>
</html>