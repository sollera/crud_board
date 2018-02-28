<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	<!-- 한글 출력 위한 줄 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<body>
<Table border=0>
	<tr>
		<td>아이디</td><td>이름</td><td>비밀번호</td><td>이메일</td><td>전화번호</td>
	</tr>
	<tr>
		<td>${id1}</td><td>${pw1}</td><td>${name1}</td><td>${email1}</td><td>${telnum1}</td>
	</tr>
	<tr>
		<td>${id2}</td><td>${pw2}</td><td>${name2}</td><td>${email2}</td><td>${telnum2}</td>
	</tr>
	<tr>
		<td>${id3}</td><td>${pw3}</td><td>${name3}</td><td>${email3}</td><td>${telnum3}</td>
	</tr>
</Table>
</body>
</html>
