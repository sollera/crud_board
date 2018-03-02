<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 - 글 목록</title>
<br /><center><h1>게시판</h1></center><br>
<script>
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
if(dd<10) {
    dd='0'+dd
} 
if(mm<10) {
    mm='0'+mm
} 
today = yyyy+'-'+mm+'-'+dd;
</script>
</head>
<body>
<div class="container">
	<table class="table table-hover">
		<colgroup>
			<col width="7%">	<!-- 글 번호 -->
			<col width="*">		<!--  제목   -->
			<col width="15%">	<!-- 작성자 -->
			<col width="10%">	<!-- 작성일 -->
			<col width="7%">	<!-- 조회수 -->
		</colgroup>
		<thead>
			<tr>
				<th style="text-align:center;">글번호</th>
				<th style="text-align:center;">제목</th>
				<th style="text-align:center;">작성자</th>
				<th style="text-align:center;">작성일시</th>
				<th style="text-align:center;">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${postList}" var="list">
				<tr>
					<td style="text-align:center;">${list.viewNo}</td>
					<td>
					<c:forEach begin="2" end="${list.textlvl}">&nbsp;&nbsp; </c:forEach>
					<c:if test="${list.textlvl >= 1}">ㄴ</c:if>
					<a href="/crud/postView/viewNo=${list.viewNo}">${list.title}</a></td>
					<!-- <c:if test=" list.rCnt  > 1">&#40; list.rCnt-1 &#41;</c:if> {$}없으면  -->
					<td style="text-align:center;">${list.writer}</td>
					<td style="text-align:center;"><input type="text" id="wDate${list.viewNo}" value="${list.enroll_dt}" style="border:none; width:100px; text-align:center;" readonly ></td>
					<td style="text-align:center;">${list.viewcnt}</td>
				</tr>
				<script>
					var wDate = document.getElementById("wDate"+${list.viewNo}).value;
					if(wDate.indexOf(today) !== -1) document.getElementById("wDate"+${list.viewNo}).value = wDate.substring(11);
					else document.getElementById("wDate"+${list.viewNo}).value = wDate.substring(0,10);
				</script>
			</c:forEach>
		</tbody>
	</table>
	<div class="huge-top">
		<button class="btn btn-normal pull-right" type="button" onclick="location.href='/crud/write'">글 쓰기</button>
	</div>
	<!-- 페이징 처리 -->
	<div align="center">
		<ul class="pagination">
			<c:choose>
				<c:when test="${firstP >= 11}">	<!-- 이전 페이징 존재 -->
					<li class="page-item"><a class="page-link" href="/crud/list/${firstP-10}">&laquo;</a></li>
				</c:when>
				<c:otherwise>	<!-- 이전 페이징 없음 -->
					<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${(firstP+9) < pageCnt}">	<!-- 페이징 10개 모두 표시 -->
					<c:forEach begin="${firstP}" end="${firstP+9}" var="pgN">
						<c:choose>
							<c:when test="${pgN eq curP}"><li class="page-item active"><a class="page-link">${pgN}<span class="sr-only">(current)</span></a></li></c:when>
							<c:otherwise><li class="page-item"><a class="page-link" href="/crud/list/${pgN}">${pgN}</a></li></c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="page-item"><a class="page-link" href="/crud/list/${firstP+9}">&raquo;</a></li>	<!-- 다음 페이징 -->
				</c:when>
				<c:otherwise>							<!-- 페이징 10개 안될 때 -->
					<c:forEach begin="${firstP}" end="${pageCnt}" var="pgN">
						<c:choose>
							<c:when test="${pgN eq curP}"><li class="page-item active"><a class="page-link">${pgN}<span class="sr-only">(current)</span></a></li></c:when>
							<c:otherwise><li class="page-item"><a class="page-link" href="/crud/list/${pgN}">${pgN}</a></li></c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="page-item disabled"><a class="page-link">&raquo;</a></li>	<!-- 더이상 다음 페이징이 없음 -->
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
</body>
</html>