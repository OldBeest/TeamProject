<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1 문의</title>
    <style>
            @font-face {
            font-family: 'Pretendard-Regular';
            src:
                url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
                format('woff');
            font-weight: 400;
            font-style: normal;
        }
        body {
            font-family: 'Pretendard-Regular', sans-serif;
            margin: 0 auto;
            padding: 20px;
            width:70%
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th {
            background-color: #F2F2F2;
            text-align: left;
            padding: 10px;
            border: 1px solid #ddd;
        }
        td {
            padding: 8px;
            border: 1px solid #ddd;
        }
        select, input[type="text"], textarea {
            width: 50%;
            padding: 5px;
        }
        .editor-toolbar {
            background-color: #F2F2F2;
            padding: 5px;
            margin-bottom: 5px;
        }
        .editor-toolbar button {
            margin-right: 5px;
        }
        .file-upload {
            margin-top: 10px;
        }
        .submit-buttons {
            text-align: center;
            margin-top: 20px;
        }
        .submit-buttons button {
            padding: 5px 20px;
            margin: 0 5px;
        }
        .editor-container {
            border: 1px solid #ccc;
            margin-top: 5px;
        }
        .editor-toolbar {
            background-color: #F1F1F1;
            padding: 5px;
            border-bottom: 1px solid #ccc;
        }
        .editor-toolbar select, .editor-toolbar button {
            margin-right: 2px;
            padding: 2px 5px;
            background-color: #fff;
            border: 1px solid #ccc;
        }
        .editor-content {
            min-height: 200px;
            padding: 10px;
        }
        .file-upload {
            background-color: #F9F9F9;
            border: 1px solid #ccc;
            padding: 10px;
            margin-top: 5px;
            font-size: 0.9em;
        }
        .file-upload button {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 2px 5px;
            font-size: 0.9em;
        }
        .editor-mode {
            text-align: right;
            margin-top: 5px;
        }
        .editor-mode button {
            background-color: #F1F1F1;
            border: 1px solid #ccc;
            padding: 2px 10px;
            font-size: 0.9em;
        }
    </style>
            <script>
        function send(){
            const title = document.querySelector(".title").value;
            const content = document.querySelector(".editor-content").innerText;
            
            document.querySelector("#c_title").value = title;
            document.querySelector("#c_content").value = content;
            
            console.log("Title:", title);
            console.log("Content:", content);
            
            if (title.trim() !== "" && content.trim() !== "") {
                alert("작성이 완료되었습니다. 답변은 기대하지마세요!");
                document.querySelector("#send").submit();
            } else {
                alert("작성이 되지 않았어요! 작성좀 하세요 제발!");
            }
        }
        
        function cancel(){
            if(confirm("작성을 취소하시겠습니까?")){
                location.href = "/index";
            }
        }
    </script>
</head>
<body>
	<form action="/customer/customer3_send" id="send" method="post">
	<input type="hidden" name="id" value="${mDto.id }">
	<input type="hidden" name="email" value="${mDto.email }">
	<input type="hidden" name="phone" value="${mDto.phone }">
	<input type="hidden" name="c_title" id="c_title" value="">
	<input type="hidden" name="c_content" id="c_content" value="">

    <h2>1:1 문의하기</h2>
    <table>
        <tr>
            <th>분류</th>
            <td>
                <select>
                    <option>선택하세요</option>
                    <option selected="selected">회원</option>
                    <option>비회원</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><input type="text" value="${mDto.email }" readonly> <input type="checkbox" value="abc1234@naver.com"> 답변받기</td>
        </tr>
        <tr>
            <th>휴대폰</th>
            <td><input type="text" value="${mDto.phone }" readonly></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><input class="title" type="text"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <div class="editor-container">
                    <div class="editor-toolbar">
                        <select><option>글꼴</option></select>
                        <select><option>3pt</option></select><br>
                        <button>가</button>
                        <button><i>가</i></button>
                        <button><u>가</u></button>
                        <button>가</button>
                        <button>가</button>
                        <button>■</button>
                        <button>1.</button>
                        <button>가</button>
                        <button>A</button>
                        <button>T</button>
                        <button>[]</button>
                        <button>"</button>
                        <button>URL</button>
                        <button>그림</button>
                        <button>표</button>
                        <button>시간</button>
                    </div>
                    <div class="editor-content" contenteditable="true"></div>
                </div>
                <div class="editor-mode">
                    <button>Editor</button>
                    <button>HTML</button>
                    <button>TEXT</button>
                </div>
            </td>
        </tr>
    </table>
    </form>
    <div class="submit-buttons">
        <button style="background-color: #F19EC8; color: white;" onclick="send()">작성완료</button>
        <button onclick="cancel()">취소</button>
    </div>

</body>
</html>