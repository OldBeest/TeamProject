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
    <title>이용약관</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('/images/signup1.jpg');
            background-size: cover;
            background-position: center;
        }
        .wrap {
            background: white;
            padding: 60px 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 420px;
            height: 870px;
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
            transition: border-color 0.3s ease;
        }
        .wrap.active {
            border-color: green;
        }
        .joinArea {
            width: 98%;
        }
        h2 {
            margin-bottom: 50px;
            color: white;
            font-size: 25px;
            font-weight: 400;
            letter-spacing: -0.02em;
        }
        .termBox {
            margin: 10px 0;
            display: block;
            width: 100%;
            height: 200px;
            border: 1px solid #dadada;
            border-radius: 10px;
            padding: 2%;
            font-size: 12px;
            color: #333;
            line-height: 20px;
            background-color: #f8f8f8;
        }
        .dotTitle {
            background: url(/assets/images/common/dot3.png) left center no-repeat;
            padding-left: 13px;
            font-size: 15px;
            font-weight: 800;
            color: #222;
            margin-bottom: 10px;
        }
        .agree {
            display: inline-block;
            position: relative;
            padding: 8px 15px;
            text-align: center;
            padding-left: 10%;
        }
        .submit {
            text-align: center;
            width: 100%;
            height: 100px;
            margin-top: -100px;
        }
        .submit a.disabled {
            pointer-events: none;
            opacity: 0.5;
        }
        #main {
            font-size: 25px;
        }
        button {
            margin: 20px;
        }
        .w-btn-yellow-outline:hover {
            background-color: #99ff99;
            color: #6e6e6e;
        }
        .w-btn-outline {
            position: relative;
            padding: 20px 40px;
            border-radius: 5px;
            font-family: "paybooc-Light", sans-serif;
            box-shadow: -3px -3px 7px #ffffff73, 3px 3px 5px rgba(94, 104, 121, .288);
            text-decoration: none;
            font-weight: 600;
            transition: 0.25s;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            background: #dde1e7;
        }
        * {
            user-select: none;
            -webkit-tap-highlight-color: transparent;
        }
        *:focus {
            outline: none;
        }
        #app-cover {
            display: table;
            width: 600px;
            margin: 80px auto;
            counter-reset: button-counter;
        }
        .row {
            display: table-row;
        }
        .toggle-button-cover {
            display: table-cell;
            position: relative;
            width: 200px;
            height: 140px;
            box-sizing: border-box;
        }
        .button-cover,
        .knobs,
        .layer {
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            text-align: center;
        }
        .button {
            position: relative;
            top: 50%;
            width: 94px;
            height: 50px;
            margin: -10px auto 0 auto;
            overflow: hidden;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
        .button.r,
        .button.r .layer {
            border-radius: 100px;
        }
        .button.b2 {
            border-radius: 2px;
            transition: border-color 0.3s ease;
        }
        .button.b2.active {
            border-color: green;
        }
        .checkbox {
            position: relative;
            width: 100%;
            height: 100%;
            padding: 0;
            margin: 0;
            opacity: 0;
            cursor: pointer;
            z-index: 3;
        }
        .knobs {
            z-index: 2;
        }
        .layer {
            width: 100%;
            background-color: #ebf7fc;
            transition: 0.3s ease all;
            z-index: 1;
        }
        /* Button 10 */
        #button-10 .knobs:before,
        #button-10 .knobs:after,
        #button-10 .knobs span {
            position: absolute;
            top: 7px;
            width: 35px;
            height: 15px;
            font-size: 12px;
            font-weight: bold;
            text-align: center;
            line-height: 1;
            padding: 9px 6px;
            border-radius: 2px;
            transition: 0.3s ease all;
        }
        #button-10 .knobs:before {
            content: "";
            left: 4px;
            background-color: red;
        }
        #button-10 .knobs:after {
            content: "동의";
            right: 4px;
            color: black;
        }
        #button-10 .knobs span {
            display: inline-block;
            left: 4px;
            color: #fff;
            z-index: 1;
        }
        #button-10 .checkbox:checked + .knobs span {
            color: #4e4e4e;
        }
        #button-10 .checkbox:checked + .knobs:before {
            left: 45px;
            background-color: #4CAF50;
        }
        #button-10 .checkbox:checked + .knobs:after {
            color: #fff;
        }
        #button-10 .checkbox:checked ~ .layer {
            background-color: #fcebeb;
        }
    </style>
</head>
<body>
    <div class="wrap">
        <h2 id="main"><marquee behavior="alternate">♡실버타운 가입을 환영합니다♡</marquee></h2>
        <div class="joinArea">
            <h4 class="dotTitle">이용약관</h4>
            <div class="termBox">
                <textarea aria-invalid="false" style="width: 100%; height: 100%; border: none; background: transparent; text-align: left;">
                제 1 조 (목적)
                약관은 실버타운(이하 "회사"라 합니다)이 운영, 제공하는 위치기반서비스(이하 "서비스"라 합니다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항에 따른 이용조건 및 절차 등 기본적인 사항을 규정함을
                목적으로 합니다. 위치기반서비스(이하 "서비스"라 합니다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항에 따른 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.
                제 11 조 (목적)
                약관은 실버타운(이하 "회사"라 합니다)이 운영, 제공하는 위치기반서비스(이하 "서비스"라 합니다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항에 따른 이용조건 및 절차 등 기본적인 사항을 규정함을
                목적으로 합니다. 위치기반서비스(이하 "서비스"라 합니다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항에 따른 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.
                </textarea>
            </div>
            <h4 class="dotTitle">개인정보 수집 및 이용</h4>
            <div class="termBox">
                <textarea aria-invalid="false" style="width: 100%; height: 100%; border: none; background: transparent; text-align: left;">
                제 2 조 (목적)
                약관은 실버타운(이하 "회사"라 합니다)이 운영, 제공하는 위치기반서비스(이하 "서비스"라 합니다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항에 따른 이용조건 및 절차 등 기본적인 사항을 규정함을
                목적으로 합니다. 위치기반서비스(이하 "서비스"라 합니다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항에 따른 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.
                제 12 조 (목적)
                약관은 실버타운(이하 "회사"라 합니다)이 운영, 제공하는 위치기반서비스(이하 "서비스"라 합니다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항에 따른 이용조건 및 절차 등 기본적인 사항을 규정함을
                목적으로 합니다. 위치기반서비스(이하 "서비스"라 합니다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항에 따른 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.
                </textarea>
            </div>
            <div class="agree">
                <p>이용약관 및 개인정보수집 이용에 동의합니다.</p>
                <aside>
                    <br>
                    <label for="registeragree">
                        <div class="row">
                            <div class="toggle-button-cover">
                                <div class="button-cover">
                                    <div class="button b2" id="button-10">
                                        <input type="checkbox" class="checkbox" id="terms-checkbox" />
                                        <div class="knobs">
                                            <span>비동의</span>
                                        </div>
                                        <div class="layer"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </label>
                </aside>
            </div>
            <div class="submit">
                <a href="/member/signup2" class="disabled" id="personal-signup">
                    <button class="w-btn-outline w-btn-yellow-outline" type="button">가입하기</button>
                </a>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('terms-checkbox').addEventListener('change', function() {
            const wrapElement = document.querySelector('.wrap');
            const personalSignupLink = document.getElementById('personal-signup');
            const groupSignupLink = document.getElementById('group-signup');
            if (this.checked) {
                wrapElement.classList.add('active');
                personalSignupLink.classList.remove('disabled');
                groupSignupLink.classList.remove('disabled');
            } else {
                wrapElement.classList.remove('active');
                personalSignupLink.classList.add('disabled');
                groupSignupLink.classList.add('disabled');
            }
        });
    </script>
</body>
</html>
