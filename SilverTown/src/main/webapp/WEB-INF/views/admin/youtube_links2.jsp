<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>유튜브 링크 관리</title>
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

form {
	margin: 0;
}

input[type="text"] {
	width: 80%;
	padding: 8px;
	margin: 4px 0;
	box-sizing: border-box;
}

button {
	padding: 8px 12px;
	margin: 4px 2px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<h1>유튜브 링크 관리</h1>

	<!-- 기존 유튜브 링크 목록 -->
	<table>
		<thead>
			<tr>
				<th>유튜브 링크</th>
			
			</tr>
		</thead>
		<tbody>
			<c:forEach var="video" items="${videos}">
				<tr>
					<td>
						<form action="/admin/updateYoutubeLink" method="post">
							<input type="hidden" name="oldVideoUrl"
								value="${video.video_url}"> <input type="text"
								name="newVideoUrl" value="${video.video_url}" required>
							<button type="submit">수정</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>
