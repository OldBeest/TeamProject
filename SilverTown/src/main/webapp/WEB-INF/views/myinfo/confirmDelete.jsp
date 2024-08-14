<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 확인</title>
</head>
<body>
    <h2>회원 탈퇴 확인</h2>
    <p>회원 탈퇴에 동의하십니까? 이 작업은 되돌릴 수 없습니다.</p>
    <form id="confirmDeleteForm" action="/myinfo/deleteAccount" method="post">
        <input type="checkbox" id="confirm" name="confirm" value="yes" required>
        <label for="confirm">동의합니다</label><br><br>
        <button type="submit">회원 탈퇴</button>
    </form>
</body>
</html>