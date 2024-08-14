<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글쓰기</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="/css/customer/customer2_style.css">
  <link rel="stylesheet" href="/css/customer/customer2_read.css">
    <script>
    function deleteBtn(post_no){
    	if(confirm("게시글을 삭제하시겠습니까?")){
    		location.href="/customer/delete2?post_no="+post_no;
    	}
    }
    
  </script>
</head>
<body>
<section>
    <h1>질문 게시판</h1>

    <table>
      <colgroup>
        <col width="80%">
        <col width="10%">
        <col width="10%">
        
      </colgroup>
      <tr>
        <th colspan="3">제목</th>
      </tr>
      <tr>
        <td colspan="3"><strong>${map.customer2Dto.post_title}</strong></td>
      </tr>
      <tr>
        <td>${map.customer2Dto.id}</td>
        <td>조회수</td>
        <td>${map.customer2Dto.post_hit}</td>
      </tr>
      <tr>
        <td colspan="3" class="article">${map.customer2Dto.post_content}</td>
      </tr>
     <tr>
        <td colspan="3"><strong>파일첨부</strong></td>
      </tr>
      <tr>
        <c:if test="${map.customer2Dto.post_file != null}">
        	<td colspan="3" class="article">
        	  <img style="width:50%;" src="/upload/${map.customer2Dto.post_file}">
        	</td>
        </c:if>
        <c:if test="${map.customer2Dto.post_file == null}">
        	<td colspan="3" class="article">첨부파일 없음</td>
        </c:if>
      </tr>
      
      <tr>
        <td colspan="3"><strong>다음글</strong> <span class="separator">|</span>
        <c:if test="${map.prevDto.post_no != null }">
       	 <a href="/customer/customer2_view?post_no=${map.prevDto.post_no}&page=${page}"> [게시글] ${map.prevDto.post_title}</a>
      	</c:if>
      	  <c:if test="${map.prevDto.post_no == null}">
      	  다음글이 없습니다.
      	</c:if>
      	</td>
      </tr>
      <tr>
        <td colspan="3"><strong>이전글</strong><span class="separator">|</span>
       <c:if test="${map.nextDto.post_no != null }">
       	<a href="/customer/customer2_view?post_no=${map.nextDto.post_no}&page=${page}"> [게시글] ${map.nextDto.post_title}</a>
     </c:if>
       <c:if test="${map.nextDto.post_no == null}">
      	  이전글이 없습니다.
      	</c:if>
      	</td>
      </tr>
    </table>


    <a href="/customer/customer2_list?page=${page}&category=${category}&sWord=${sWord}"><div class="list">목록</div></a>
     <!-- 로그인한 회원만 수정,삭제 가능 / 본인이 쓴 게시글만 권한부여 -->
    <c:if test="${sessionId == map.customer2Dto.id}">
	    <div class="list" onclick="deleteBtn(${map.customer2Dto.post_no})">삭제</div>
	    <a href="/customer/update2?post_no=${map.customer2Dto.post_no}"><div class="list">수정</div></a>
    </c:if>
    
    <!-- 답변달기는 자유 -->
	  	<a href="/customer/customer2_reply?post_no=${map.customer2Dto.post_no}"><div class="list">답변달기</div></a>
  </section>
</body>
</html>