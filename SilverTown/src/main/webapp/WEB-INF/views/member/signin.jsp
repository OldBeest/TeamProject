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
    <title>로그인</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <script>
        const hypenTel = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, $1-$2-$3);
        }
    </script>
     <script>
    		$(function(){
    			$("#sBtn").click(function(){
    				alert("로그인 진행");
    				
    				if($("#id").val() == ""){
    					alert("아이디를 입력해주세요.");
    					$("#id").focus();
    					return false;
    				}// 아이디 입력안했을시
    				
    				if($("#pw").val() == ""){
    					alert("비밀번호를 입력해주세요.");
    					$("#pw").focus();
    					return false;
    				}// 비밀번호 입력안했을시
    				
    				loginFrm.submit();
    				
    			});//sBtn
    			
    		});//제이쿼리
    	</script>
    <style>
		    @font-face {
		    font-family: 'neon';
		    src: url('/css/Jalnan2.otf') format('truetype');
		}
    
       body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('/images/signin.jpg');
            background-size: cover;
            background-position: center;
            flter:blur(10px);
        }
        .wrap {
            
            padding: 20px 40px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 450px;
            height: 600px;
            position: relative;
            z-index: 2;
            -webkit-backdrop-filter: blur(10px);
		    backdrop-filter: blur(10px);
		    background-color: rgba(255, 255, 255, .25); /* 밝게 보이도록 배경색 추가 */
		    border-radius: 30px; /* 둥근 테두리 */
		    box-shadow: 0 6px 20px -15px #000; /* 그림자 효과 */
		    border-width: 1px 1px 0 0; /* 입체감 흰색 테두리 */
		    border-color: #fff;
		    border-style: solid;
            
        }
        h2 {
        font-family: 'neon';
            text-align: center;
            margin-bottom: 20px;
            color: #03C75A;
            font-style: normal;
            font-weight: 400;
            font-size: 100px;
            line-height: 120%;
            letter-spacing: -0.02em;
            text-shadow: 4px 4px 0px #1565C0, 8px 8px 0px #42A5F5, 12px 12px 0px #E3F2FD;
             animation: blink 1.5s infinite; /* 깜빡이는 효과 적용 */
        
        }
        @keyframes blink {
            0%, 100% {
                opacity: 1;
            }
            50% {
                opacity: 0;
            }
        }
        .login div {
            margin-bottom: 15px;
        }
        .login h4 {
            margin: 0 0 5px;
            font-size: 16px;
            color: #333;
        }
        .login input[type="text"],
        .login input[type="password"],
        .login input[type="email"],
        .login input[type="date"] {
            width: 80%;
            padding: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        .login_etc {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .login_etc .checkbox {
            display: flex;
            align-items: center;
        }
        .login_etc .forgot_pw a {
            font-size: 14px;
            color: #white;
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
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .submit input[type="submit"] {
            width: 85%;
            height: 44px;
            background-color: #03C75A;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            padding-right: 15px;
        }
        #kakao_login {
            width: 70%;
            height: 44px;
            cursor: pointer;
            padding-left: 15px;
        }
        #login_id {
            justify-content: center;
            display: flex;
            align-items: center;
        }
        .login_id,
        .login_pw {
            padding-left: 70px;
        }
        
    </style>
</head>
<body>

    <div class="wrap">
        <div class="login">
    		<form action="/member/signin" name="loginFrm" method="post">
            <h2>요양어뗘.</h2>
         
            <div class="login_id">
            <br>
                <h4>아이디</h4>
                <input type="text" name="id" placeholder="ID" value="${rememberedId != null ? rememberedId : ''}" />
            </div>
            <div class="login_pw">
                <h4>비밀번호</h4>
                <input type="password" name="pw" placeholder="PW" />
            </div>
            
            <div class="login_etc">
                <div class="checkbox">
                    <input type="checkbox" name="rememberId" id="rememberId" value="remember" ${rememberedId != null ? 'checked' : ''} />
                    <label for="remember">아이디 저장</label>
                    <br>
                </div>
                <br> <br>
                <div class="checkbox">
                    <input type="checkbox" name="autoLogin" id="autoLogin" value="autoLogin"/>
                    <label for="autoLogin">자동 로그인</label>
                    <br>
                </div>
                <br> <br>
                <div class="forgot_pw">
                    <a href="/member/forgotPassword">비밀번호 잊으셨나요?</a>
                </div>
            </div>
            
            <div class="submit">
            <br>
                <a id="kakao_login" href="/dosignin"> 
                <input type="submit" class="sBtn" value="로그인"  />
               </a> 
               <a id="kakao_login"  href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=19855f07670ed426b71b6c31e02bb899&redirect_uri=http://localhost:8181/kakao/oauth">
                <input type="image" src="/images/kakao_login_medium_narrow2.png" alt="카카오 로그인" />
               </a> 
            </div>
            </form>
        </div>
    </div>
</body>
</html>