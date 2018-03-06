<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsenui.css">
<link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsen-css-components.min.css">
<script src="https://unpkg.com/onsenui/js/onsenui.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<ons-page>
		<ons-toolbar>
			<div class="left">
				<ons-toolbar-button>
		  			<ons-icon icon="md-home" onclick="location.href='/crud/list/1'"></ons-icon>
		  		</ons-toolbar-button>
			</div>
		  	<div class="center">Free Board</div>
		  	<div class="right">
		  		<ons-toolbar-button>
		  			<ons-icon icon="ion-compose,material:" onclick="location.href='/crud/write'"></ons-icon>
		  		</ons-toolbar-button>
		  	</div>
		</ons-toolbar>
		
		<c:forEach items="${updateView}" var="view">
		<form action="updatePost" method="post">
			<ons-card>
				<div class="title">제목 : <input type="text" name="title" value="${view.title}" style="width:50%;" required></div>
				<div class="content">
					<ons-list>
						<ons-list-header>
							글쓴이 : ${view.writer}<input type="hidden" name="writer" value="${view.writer}">
						</ons-list-header>
						<ons-list-item>
							내용<br />
							<TEXTAREA id="txtAreaContent" NAME="content" style="resize: none;width:100%;min-height: 100px;" required>${view.content}</TEXTAREA>
						</ons-list-item>
						<ons-list-foot>
							<ons-row><ons-col align="middle">
								<input type="submit" value="수정">&nbsp;
								<input type="button" value="취소" onclick="location.href='/crud/list/1'">
							</ons-col></ons-row>
						</ons-list-foot>
					</ons-list>
				</div>
			
			</ons-card>
			<input type="hidden" name="ref" value="${view.ref}"><input type="hidden" name="step" value="${view.step}"><input type="hidden" name="viewNo" value="${view.viewNo}">
		</form>
		<script>
			while(true){
				var text = document.getElementById("txtAreaContent").value;
				if(text.indexOf("<br />") == -1) break;
				document.getElementById("txtAreaContent").value = text.replace("<br />","\r\n");
			}
		</script>
		</c:forEach>
		
	</ons-page>

</body>
</html>