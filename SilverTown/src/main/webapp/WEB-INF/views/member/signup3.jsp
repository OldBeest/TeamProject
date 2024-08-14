<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>단체 기업 회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <script>
        const hypenTel = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        }
        
        function validateForm() {
            var id = document.getElementById("id").value;
            var pw = document.getElementsByName("pw")[0].value;
            var email = document.getElementsByName("email")[0].value;
            var name = document.getElementsByName("name")[0].value;
            var address = document.getElementsByName("address")[0].value;
            var phone = document.getElementsByName("phone")[0].value;
            var birthdate = document.getElementsByName("birthdate")[0].value;

            if (!id || !pw || !email || !name || !address || !phone || !birthdate) {
                alert("모든 입력란을 채워주세요.");
                return false;
            }
            return true;
        }      
        
        function checkId() {
            var id = document.getElementById("id").value;
            if (!id) {
                alert("아이디를 입력하세요.");
                return;
            }
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "/member/checkId?id=" + encodeURIComponent(id), true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.isDuplicated) {
                        alert("이미 사용 중인 아이디입니다.");
                    } else {
                        alert("사용 가능한 아이디입니다.");
                    }
                }
            };
            xhr.send();
        }
    </script>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('/images/signup3.jpg');
            background-size: cover;
            background-position: center;
        }
        .wrap {
            background: white;
            padding: 20px 40px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 400px;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            position: relative;
            z-index: 2;
            -webkit-backdrop-filter: blur(10px);
            backdrop-filter: blur(10px);
            background-color: rgba(255, 255, 255, .25);
            border-radius: 30px;
            box-shadow: 0 6px 20px -15px #000;
            border-color: #fff;
            border-style: solid;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #4CAF50;
        }
        .login div {
            margin-bottom: 15px;
        }
        .login h4 {
            margin: 0 0 5px;
            font-size: 14px;
            color: #333;
        }
        .login input[type="text"],
        .login input[type="password"],
        .login input[type="email"],
        .login input[type="date"] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .login_etc {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .login_etc .checkbox {
            display: flex;
            align-items: center;
        }
        .login_etc .forgot_pw a {
            font-size: 14px;
            color: #4CAF50;
            text-decoration: none;
        }
        .searchBox {
            margin-top: 15px;
        }
        .searchBox h4 {
            text-align: center;
            font-size: 16px;
            margin-bottom: 10px;
            color: #333;
        }
        .searchBox p {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
            font-size: 14px;
            margin: 0;
        }
        .searchBox input[type="checkbox"] {
            margin-right: 5px;
        }
        .submit {
            text-align: center;
            margin-top: 20px;
        }
        .submit input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="wrap">
        <div class="login">
            <h2>단체‧기업</h2>
         <form action="/member/signup3" method="post" name="memberFrm" onsubmit="return validateForm();">
            <div class="login_id">
                <h4>아이디</h4>
                <input type="text" id="id" name="id" placeholder="ID" />
                <button type="button" onclick="checkId()">중복 체크</button>
            </div>
            <div class="login_pw">
                <h4>비밀번호</h4>
                <input type="password" name="pw" placeholder="PW" />
            </div>
            <div class="login_id">
                <h4>이메일</h4>
                <input type="email" name="email" placeholder="E-MAIL" />
            </div>
            <div class="login_id">
                <h4>대표자 이름</h4>
                <input type="text" name="name" placeholder="NAME" />
            </div>
            <div class="login_id">
                <h4>대표번호</h4>
                <input type="text" name="phone" oninput="hypenTel(this)" maxlength="13" placeholder="전화번호" />
            </div>
            <div class="login_id">
                <h4>설립일</h4>
                <input type="date" name="birth_date" class="info" placeholder="설립일" />
            </div>
            
            </div>
            <div class="submit">
             	<button type="button" onclick="submitBtn()">확인</button>
            </div>
             </form>
        </div>
     <script>
        function submitBtn() {
            alert("회원가입이 완료됐습니다.");
            memberFrm.submit();
        }
    </script>
</body>
</html>