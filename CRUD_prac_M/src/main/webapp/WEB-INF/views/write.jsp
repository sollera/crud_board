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
	<form action="/crud/writePost" method="post">
		<table class="table table-board">
			<colgroup>
				<col width="20%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr><td>제목</td> <td><input type="text" name="title" size="98" required></td></tr>
				<tr><td>글쓴이</td> <td><input type="text" name="writer" required></td></tr>
				<tr><td>내용</td> <td><TEXTAREA NAME=content COLS=100 ROWS=10 style="resize: none;" required></TEXTAREA></td></tr>
				<tr><td colspan="2" align="center">
					<input class="btn btn-normal" type="submit" value="글쓰기">
					<input class="btn btn-normal" type="button" value="취소" onclick="location.href='/crud/list/1'">
				</td></tr>
			</tbody>
		</table>
		<input type="hidden" name="ref" value="${ref}">
		<input type="hidden" name="textlvl" value="${textlvl}">
		<input type="hidden" name="step" value="${step}">
		<input type="hidden" name="parentsno" value="${parentsno}">
	</form>
</div>
</body>
</html>