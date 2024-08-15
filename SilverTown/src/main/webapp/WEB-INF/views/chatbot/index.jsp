<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatbot test</title>
        <!-- 폰트어썸 불러오기 -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
        integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <!-- css 불러오기 -->
        <link rel="stylesheet" href="/css/topbar.css">

        <!-- 제이쿼리 불러오기 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- js 불러오기 -->
        <script src="/js/topbar.js"></script>
        <script src="/js/sidebar_motion.js"></script>

        <!-- 아울 캐러셀 불러오기 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.theme.default.min.css">
<style>

    @import url('https://fonts.googleapis.com/css2?family=Jua&family=Nunito:ital,wght@0,200..1000;1,200..1000&family=Sunflower:wght@300&display=swap');

    .box-wrapper{
        font-family: "Sunflower", sans-serif;
        font-weight: 300;
        font-style: normal;
    }
    .conversation-box{
        width : 500px;
        height : 800px;
        background : url("/images/back1.jpg");
        background-size : cover;
        border: 2px solid black;
        margin: auto;
        position: relative;
        font-size: 13px;
    }
    .box-top{
        height: 5%;
        text-align: center;
        
    }
    .conversation-text{
        height: 90%;
        overflow-y: scroll;
    }
    .conversation-input{
        width: 100%;
        height: 5%;
        bottom: 0px;
        display: flex;
        position: absolute;
        text-align: right;
    }
    .talkbox{
    }
    .bot-said{
        display: flex;
        text-align: left;
        justify-content: left;
    }
    .bot-text{
        position:relative; 
        margin: 10px; 
        padding: 20px; 
        width:200px; 
        height:auto;
        color: #000; 
        border-radius: 10px; 
        background-color: #FFF;}
    
    .bot-text:after {
        content:""; 
        position: absolute; 
        top: 20px; 
        left: -20px; 
        border-right: 20px solid #fff; 
        border-top: 10px solid transparent; 
        border-bottom: 10px solid transparent;
    }
    .human-said{
        text-align: left;
        display: flex;
        justify-content: right;
    }
    .human-text{
        position:relative;
        margin: 10px; 
        padding: 20px; 
        width:200px; 
        height:auto; 
        color: #000; 
        border-radius: 10px; 
        background-color: #FFF;}
    
    .human-text:after {
        content:""; 
        position: absolute; 
        top: 20px; 
        right: -20px; 
        border-left: 20px solid #fff; 
        border-top: 10px solid transparent; 
        border-bottom: 10px solid transparent;
    }
    .text-input{
        font-family: "Sunflower", sans-serif;
        font-weight: 300;
        font-style: normal;
        font-size: 20px;
        width: 80%;
        height: 88%;
    }
    #submit-text{
        font-family: "Sunflower", sans-serif;
        font-weight: 300;
        font-style: normal;
        font-size: 20px;
    }
    .icon{
        position: relative;
        top: -20%;
        height: 75px;
        width: 75px;
    }
    button{
        width: 20%;
        height: 100%;
        background-color: white;
    }

</style>
<script>
    $(function(){
        $("#submit-text").on("click", function(){
            let text = $(".text-input").val();
            console.log(text);
            let htmldata = `<div class="talkbox human-said">
                    <div class="human-text">` + text + `</div>
                    <img class="icon" src="/images/human_icon2.png">
                </div>
                <div class="talkbox bot-said">
                    <img class="icon" src="/images/chatbot_icon3.png">
                    <div class="bot-text">단어사전
                    {'<PAD>': 0, '<SOS>': 1, '<EOS>': 2, '알츠하이머병의': 3, '원인': 4, '중에서': 5, '노화': 6, '외에': 7, '다른': 8, '요인도': 9, '알려주세요.': 10}</div>
                </div>
                `;
            $(".conversation-text").append(htmldata);
            
            //페이지 스크롤
            $(".conversation-text").scrollTop($(".conversation-text").prop('scrollHeight'));

            //입력내용 초기화
            $(".text-input").val("");
            $(".text-input").focus();
        });
    });
</script>
</head>
<body>
    <div class="box-wrapper">
        <div class="conversation-box">
            <div class="box-top">
                =Chatbot ${test1 }=
            </div>
            <div class="conversation-text">
                <div class="talkbox bot-said">
                    <img class="icon" src="/images/chatbot_icon3.png">
                    <div class="bot-text">안녕하세요? 저는 깜빡이에요~! 무엇을 도와 드릴까요?<br><br>---원하시는 내용을 선택해보세요---<br><br>1. 알츠하이머 정보<br><br>2. 치매 관련 정보<br></div>
                </div>
                <!--
                    <div class="talkbox human-said">
                        <div class="human-text">반가워 몇 가지 물어볼게 있어.</div>
                        <img class="icon" src="human_icon2.png">
                    </div>
                -->
            </div>
            <div class="conversation-input">
                <input class="text-input" type="text" placeholder="상담받을 내용을 입력하세요.">
                <button type="submit" id="submit-text">입력</button>
            </div>
            </div>
        </div>
        
    </div>
</body>
</html>



