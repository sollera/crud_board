<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<body>
<Table border=0>
	<tr>
		<td>아이디</td><td>책이름</td><td>글쓴이</td><td>가격</td><td>장르</td><td>출판사</td>
	</tr>
	<tr>
		<td>${id1}</td><td>${bname1}</td><td>${aName1}</td><td>${price1}</td><td>${genre1}</td><td>${pub1}</td>
	</tr>
	<tr>
		<td>${id2}</td><td>${bname2}</td><td>${aName2}</td><td>${price2}</td><td>${genre2}</td><td>${pub2}</td>
	</tr>
</Table>
</body>
</html>
