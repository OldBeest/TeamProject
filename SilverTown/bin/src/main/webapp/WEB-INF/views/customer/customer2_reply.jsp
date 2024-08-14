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
  <title>글수정</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="/css/customer/customer2_style.css">
  <link rel="stylesheet" href="/css/customer/customer2_write.css">
</head>
<body>
<section>
    <h1>게시글 답글달기</h1>
    <hr>

    <form action="/customer/doReply" name="reply" method="post" enctype="multipart/form-data">
      <table>
      <input type="hidden" name="post_no" value="${customer2Dto.post_no}">
      <input type="hidden" name="post_group" value="${customer2Dto.post_group}">
      <input type="hidden" name="post_step" value="${customer2Dto.post_step}">
      <input type="hidden" name="post_indent" value="${customer2Dto.post_indent}">
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="id">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="post_title" value="${customer2Dto.post_title}">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
<textarea name="post_content" cols="50" rows="10">
</textarea>
          </td>
        </tr>
        <tr>
          <th>첨부파일</th>
          <td>
            <input type="file" name="files" id="file">
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="submit" class="write">답변완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='customer2_list'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>