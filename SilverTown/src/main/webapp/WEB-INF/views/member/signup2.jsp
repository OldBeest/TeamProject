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
    <title>회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function hypenTel(target) {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        }

        function checkId(id, callback) {
            $.ajax({
                url: '/member/checkId',
                type: 'GET',
                data: { id: id },
                success: function(response) {
                    if (response.isDuplicated) {
                        alert("이미 사용 중인 아이디입니다.");
                        callback(false);
                    } else {
                        callback(true);
                    }
                },
                error: function() {
                    alert("아이디 중복 체크에 실패했습니다. 다시 시도해주세요.");
                    callback(false);
                }
            });
        }

        function openAddressPopup() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var address = data.roadAddress ? data.roadAddress : data.jibunAddress;
                    document.querySelector("input[name='basic_address']").value = address;
                }
            }).open();
        }

        function validateForm(event) {
            event.preventDefault(); // 폼 제출 막기
            var pw = $("input[name='pw']").val();
            var pwConfirm = $("input[name='pw_confirm']").val();
            var errorElement = $("#pwMismatchError");

            // 비밀번호와 비밀번호 확인이 일치하지 않는 경우 폼을 제출하지 않음
            if (pw !== pwConfirm) {
            	alert("비밀번호가 일치하지 않습니다.")
                return false;
            }

            // 나머지 필드 검증 및 폼 제출 로직...
            var id = $("#id").val();
            var email = $("input[name='email']").val();
            var name = $("input[name='name']").val();
            var basicAddress = $("input[name='basic_address']").val();
            var detailAddress = $("input[name='detail_address']").val();
            var phone = $("input[name='phone']").val();
            var birthdate = $("input[name='birth_date']").val();
            var gender = $("input[name='gender']:checked").val();
            var diseases = $("input[name='disease']:checked").map(function() { return this.value; }).get().join(",");
            var features = $("input[name='feature']:checked").map(function() { return this.value; }).get().join(",");

            if (!id || !pw || !email || !name || !basicAddress || !phone || !birthdate || !gender || !diseases || !features) {
                alert("필수 입력란을 채워주세요.(*필수입력)");
                return false;
            }

            var fullAddress = basicAddress + " " + detailAddress;

            checkId(id, function(isValid) {
                if (isValid) {
                    $.ajax({
                        url: "/member/signup2",
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify({
                            id: id,
                            pw: pw,
                            email: email,
                            name: name,
                            address: fullAddress,
                            phone: phone,
                            birth_date: birthdate,
                            gender: gender,
                            disease: diseases,
                            feature: features
                        }),
                        success: function(response) {
                            if (response.status === "success") {
                                alert("회원가입이 완료되었습니다!");
                                window.location.href = "/member/signin";
                            } else {
                                alert("회원가입에 실패했습니다: " + response.error);
                            }
                        },
                        error: function(xhr, status, error) {
                            alert("회원가입에 실패했습니다. 다시 시도해주세요. " + error);
                        }
                    });
                }
            });
        }

        $(document).ready(function() {
            $("form").on("submit", validateForm);

            $("#checkIdButton").on("click", function() {
                var id = $("#id").val();
                if (id) {
                    checkId(id, function(isValid) {
                        if (isValid) {
                            alert("사용 가능한 아이디입니다.");
                        }
                    });
                } else {
                    alert("아이디를 입력하세요.");
                }
            });

            $("input[name='pw_confirm']").on("input", function() {
                var pw = $("input[name='pw']").val();
                var pwConfirm = $(this).val();
                var errorElement = $("#pwMismatchError");

                if (pw !== pwConfirm) {
                    errorElement.text("비밀번호가 일치하지 않습니다.");
                } else {
                    errorElement.text(""); // 오류 메시지 제거
                }
            });

            window.addEventListener('message', function(event) {
                if (event.data && event.data.address) {
                    document.querySelector("input[name='basic_address']").value = event.data.address;
                }
            });
        });
    </script>
    <style>
        /* 기존 스타일 유지 */
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            position: relative;
            overflow: hidden;
            background-image: url('/images/signup2.jpg');
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
            overflow-y: auto;
            max-height: 90vh;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: white;
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
        .login_pw_confirm {
            position: relative;
            margin-bottom: 40px; /* 메시지가 더 아래에 뜨도록 추가적인 마진 */
        }
        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 30px; /* 메시지가 더 아래에 뜨도록 마진 추가 */
            position: absolute;
            bottom: -30px; /* 메시지를 입력창에서 더 아래로 이동 */
            left: 0;
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
            <h2>회원가입</h2>
            <form id="signupForm">
                <div class="login_id">
                    <h4>*아이디</h4>
                    <input type="text" id="id" name="id" placeholder="ID" />
                    <button type="button" id="checkIdButton">중복 체크</button>
                </div>
                <div class="login_pw">
                    <h4>*비밀번호</h4>
                    <input type="password" name="pw" placeholder="PW" />
                </div>
                <div class="login_pw_confirm">
                    <h4>*비밀번호 확인</h4>
                    <input type="password" name="pw_confirm" placeholder="비밀번호 확인" />
                    <div class="error-message" id="pwMismatchError"></div>
                </div>
                <div class="login_id">
                    <h4>*이메일</h4>
                    <input type="email" name="email" placeholder="E-MAIL" />
                </div>
                <div class="login_id">
                    <h4>*이름</h4>
                    <input type="text" name="name" placeholder="NAME" />
                </div>
                <div class="login_id">
                    <h4>*기본주소</h4>
                    <input type="text" name="basic_address" placeholder="기본 주소" readonly/>
                    <button type="button" onclick="openAddressPopup()">입력</button>
                </div>
                <div class="login_id">
                    <h4>상세주소</h4>
                    <input type="text" name="detail_address" placeholder="상세 주소" />
                </div>
                <div class="login_id">
                    <h4>*핸드폰번호</h4>
                    <input type="text" oninput="hypenTel(this)" maxlength="13" name="phone" placeholder="휴대 전화번호" />
                </div>
                <div class="login_id">
                    <h4>*생년월일</h4>
                    <input type="date" name="birth_date" class="info" placeholder="생년월일" />
                </div>
                <div class="login_id">
                    <h4>*성별</h4>
                    <input type="radio" id="male" name="gender" value="남성" />
                    <label for="male">남성</label>
                    <input type="radio" id="female" name="gender" value="여성" />
                    <label for="female">여성</label>
                </div>
                <div class="searchBox">
                    <h4>*질환여부</h4>
                    <p>
                        <input type="checkbox" name="disease" value="암" /> 암
                        <input type="checkbox" name="disease" value="뇌혈관질환" /> 뇌혈관질환
                        <input type="checkbox" name="disease" value="중추신경계질환" /> 중추신경계질환
                        <input type="checkbox" name="disease" value="근골격계질환" /> 근골격계질환
                        <input type="checkbox" name="disease" value="심폐질환" /> 심폐질환
                        <input type="checkbox" name="disease" value="치매" /> 치매
                    </p>
                </div>
                <div class="searchBox">
                    <h4>*특성별</h4>
                    <p>
                        <input type="checkbox" name="feature" value="도심위치" /> 도심위치
                        <input type="checkbox" name="feature" value="최신시설" /> 최신시설
                        <input type="checkbox" name="feature" value="대형병원인접" /> 대형병원인접
                        <input type="checkbox" name="feature" value="암특화치료" /> 암특화치료
                        <input type="checkbox" name="feature" value="여성전용" /> 여성전용
                        <input type="checkbox" name="feature" value="치매전문" /> 치매전문
                    </p>
                </div>
                <div class="submit">
                    <input type="submit" value="회원가입"/>
                </div>
            </form>
        </div>
    </div>
</body>
</html>