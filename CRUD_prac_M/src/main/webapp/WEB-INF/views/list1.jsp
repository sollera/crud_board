<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsenui.css">
<link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsen-css-components.min.css">
<script src="https://unpkg.com/onsenui/js/onsenui.min.js"></script>

	<script>
		ons.ready(function() {
			var pullHook = document.getElementById('pull-hook');
			
			pullHook.addEventListener('changestate', function(event) {
			  var message = '';
			
			  switch (event.state) {
			    case 'initial':
			      message = 'Pull to refresh';
			      break;
			    case 'preaction':
			      message = 'Release';
			      break;
			    case 'action':
			      message = 'Loading...';
			      break;
			  }
			
			  pullHook.innerHTML = message;
			});
			
			pullHook.onAction = function(done) {
			  setTimeout(done, 1000);
			};
		});
		
	</script>

</head>
<body>
	
	<ons-page>
		<ons-toolbar>
		  	<div class="center">Free Board</div>
		  	<div class="right">
		  		<ons-toolbar-button>
		  			<ons-icon icon="ion-compose,material:" onclick="location.href='/crud/write'"></ons-icon>
		  		</ons-toolbar-button>
		  	</div>
		</ons-toolbar>
				
		<ons-pull-hook id="pull-hook">
		  Pull to refresh
		</ons-pull-hook>
		
		<ons-list>
			<c:forEach items="${postList}" var="list">
				<ons-list-item tappable onclick="location.href='/crud/postView/viewNo=${list.viewNo}'">
					<div class="center">
						<span class="list-item__title">
							${list.title}
							&nbsp;
							<c:choose>
								<c:when test="${list.rCnt <= 100}">
									<c:choose>
										<c:when test="${list.rCnt == 1}"></c:when>
										<c:otherwise><span class="notification">${list.rCnt - 1}</span></c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise><span class="notification">100+</span></c:otherwise>
							</c:choose>
						</span><span class="list-item__subtitle">${list.writer}</span>
					</div>
					<div class="right" id="en_dt">${list.enroll_dt1}</div>
				</ons-list-item>			
			</c:forEach>
		</ons-list>
		
		<ons-bottom-toolbar>
	  		<!-- 페이징 처리 -->
	<div align="center">
		<ul class="pagination">
			<c:choose>
				<c:when test="${firstP >= 6}">	<!-- 이전 페이징 존재 -->
					<li class="page-item"><a class="page-link" href="/crud/list/${firstP-5}">&laquo;</a></li>
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
					<li class="page-item"><a class="page-link" href="/crud/list/${firstP+5}">&raquo;</a></li>	<!-- 다음 페이징 -->
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
		</ons-bottom-toolbar>
		
	</ons-page>  	
	
</body>
</html>