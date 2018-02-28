<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 - 글 쓰기</title>
<br /><center><h1>게시판</h1></center><br />
</head>
<body>
<div class="container">
	<c:forEach items="${updateView}" var="view">
	<form action="updatePost" method="post">
	<table class="table table-board">
		<colgroup>
			<col width="20%">
			<col width="*">
		</colgroup>
		<tbody>
			<tr><td>제목</td> <td><input type="text" name="title" value="${view.title}" size="98" required></td></tr>
			<tr><td>글쓴이</td> <td>${view.writer}<input type="hidden" name="writer" value="${view.writer}"></td></tr>
			<tr><td>내용</td> <td><TEXTAREA id="txtAreaContent" NAME="content" COLS=100 ROWS=10 style="resize: none;" required>${view.content}</TEXTAREA></td></tr>
			<tr><td colspan="2" align="center">
			<input type="hidden" name="ref" value="${view.ref}"><input type="hidden" name="step" value="${view.step}"><input type="hidden" name="viewNo" value="${view.viewNo}">
			<input class="btn btn-normal" type="submit" value="수정">&nbsp;&nbsp;
			<input class="btn btn-normal" type="button" value="취소" onclick="location.href='/crud/list/1'">
			</td></tr>
		</tbody>
	</table>
	</form>
	<script>
		while(true){
			var text = document.getElementById("txtAreaContent").value;
			if(text.indexOf("<br />") == -1) break;
			document.getElementById("txtAreaContent").value = text.replace("<br />","\r\n");
		}
	</script>
	</c:forEach>
</div>
</body>
</html>