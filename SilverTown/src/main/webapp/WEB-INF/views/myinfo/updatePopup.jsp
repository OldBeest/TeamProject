<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update ${field}</title>
    <script>
        function closePopup() {
            window.opener.location.reload(); // 부모 창 새로고침
            window.close(); // 팝업창 닫기
        }

        function submitForm() {
            const form = document.getElementById("updateForm");
            const formData = new FormData(form);
            fetch("/myinfo/updateField", {
                method: "POST",
                body: formData
            }).then(response => {
                if (response.ok) {
                    closePopup();
                } else {
                    alert("Update failed. Please try again.");
                }
            }).catch(error => {
                console.error("Error:", error);
                alert("An error occurred. Please try again.");
            });
        }
    </script>
</head>
<body>
    <h2>Update ${field}</h2>
    <form id="updateForm">
        <input type="hidden" name="field" value="${field}">
        <div>
            <label>${field}:</label>
            <c:choose>
                <c:when test="${field == 'disease'}">
                    <div class="searchBox">
                        <h4>질환여부</h4>
                        <p>
                            <input type="checkbox" name="value" value="암" ${fn:contains(value, '암') ? 'checked' : ''}/> 암
                            <input type="checkbox" name="value" value="뇌혈관질환" ${fn:contains(value, '뇌혈관질환') ? 'checked' : ''}/> 뇌혈관질환
                            <input type="checkbox" name="value" value="중추신경계질환" ${fn:contains(value, '중추신경계질환') ? 'checked' : ''}/> 중추신경계질환
                            <input type="checkbox" name="value" value="근골격계질환" ${fn:contains(value, '근골격계질환') ? 'checked' : ''}/> 근골격계질환
                            <input type="checkbox" name="value" value="심폐질환" ${fn:contains(value, '심폐질환') ? 'checked' : ''}/> 심폐질환
                            <input type="checkbox" name="value" value="치매" ${fn:contains(value, '치매') ? 'checked' : ''}/> 치매
                        </p>
                    </div>
                </c:when>
                <c:when test="${field == 'feature'}">
                    <div class="searchBox">
                        <h4>특성별</h4>
                        <p>
                            <input type="checkbox" name="value" value="도심위치" ${fn:contains(value, '도심위치') ? 'checked' : ''}/> 도심위치
                            <input type="checkbox" name="value" value="최신시설" ${fn:contains(value, '최신시설') ? 'checked' : ''}/> 최신시설
                            <input type="checkbox" name="value" value="자연/전원환경" ${fn:contains(value, '자연/전원환경') ? 'checked' : ''}/> 자연/전원환경
                            <input type="checkbox" name="value" value="대형병원인접" ${fn:contains(value, '대형병원인접') ? 'checked' : ''}/> 대형병원인접
                            <input type="checkbox" name="value" value="암특화치료" ${fn:contains(value, '암특화치료') ? 'checked' : ''}/> 암특화치료
                            <input type="checkbox" name="value" value="여성전용" ${fn:contains(value, '여성전용') ? 'checked' : ''}/> 여성전용
                            <input type="checkbox" name="value" value="치매전문" ${fn:contains(value, '치매전문') ? 'checked' : ''}/> 치매전문
                        </p>
                    </div>
                </c:when>
                <c:otherwise>
                    <input type="text" name="value" value="${value}">
                </c:otherwise>
            </c:choose>
        </div>
        <button type="button" onclick="submitForm()">수정</button>
        <button type="button" onclick="window.close()">취소</button>
    </form>
</body>
</html>