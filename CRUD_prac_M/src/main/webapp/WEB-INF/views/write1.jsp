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
		
		<ons-card>
			<form action="/crud/writePost" method="post">
				<div class="title"><input type="text" name="title" placeholder="제목" style="width:100%;" required></div>
				<div class="content">
				<ons-list>
					<ons-list-header><input type="text" name="writer" placeholder="글쓴이" style="width:50%;" required></ons-list-header>
					<ons-list-item><TEXTAREA NAME=content style="resize: none;width:100%;min-height: 100px;" placeholder="내용" required></TEXTAREA></ons-list-item>
					<ons-list-foot>
						<ons-row><ons-col align="middle">
							<input type="submit" value="글쓰기">&nbsp;
							<input type="button" value="취소" onclick="location.href='/crud/list/1'">
						</ons-col></ons-row>
					</ons-list-foot>
				<input type="hidden" name="ref" value="${ref}">
				<input type="hidden" name="textlvl" value="${textlvl}">
				<input type="hidden" name="step" value="${step}">
				<input type="hidden" name="parentsno" value="${parentsno}">
			</form>
		</ons-card>
	
	</ons-page>

</body>
</html>