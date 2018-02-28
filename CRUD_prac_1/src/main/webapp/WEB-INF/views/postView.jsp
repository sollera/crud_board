<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 - 글 상세</title>
<br /><center><h1>게시판</h1></center><br>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
function deletePost(no){
	var r = confirm("정말 삭제하시겠습니까?");
	if(r == true) window.location="/crud/delete/"+no;
	else return;
}

//RestController방식 (Json)
//**댓글 목록2 (json)
function listReply(){
	$.ajax({
	   type: "get",
	   //contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
	   url: "/crud/listJson.do/"+vno,
	   success: function(result){
	       console.log(result);
	       var output = "<table border='0' width='1000px' align='center' style='background:#F6F6F6;border-bottom:solid 1px;'>";
	       for(var i in result){
	           output += "<tr style='border-top:solid 1px;'>";
	           if(result[i].textlvl == 1) output += "<td colspan='6' width='8%'>";
	           else if(result[i].textlvl == 2) output += "<td width='2%' align='right' valign='top'>ㄴ</td><td colspan='5' width='8%'>";
	           else if(result[i].textlvl == 3) output += "<td colspan='2' width='4%' align='right' valign='top'>ㄴ</td><td colspan='4' width='8%'>";
	           else if(result[i].textlvl == 4) output += "<td colspan='3' width='6%' align='right' valign='top'>ㄴ</td><td colspan='3' width='8%'>";
	           else if(result[i].textlvl == 5) output += "<td colspan='4' width='8%' align='right' valign='top'>ㄴ</td><td colspan='2' width='8%'>";
	           else if(result[i].textlvl >= 6) output += "<td colspan='5' width='10%' align='right' valign='top'>ㄴ</td><td width='8%'>";
	           output += result[i].writer+"</td>";
	           output += "<td style='border-left:solid 1px;padding-left:1px;'>"+result[i].content+"</td>";
	           output += "<td width='3%' align='center' onclick='fn_btnReply("+i+")'>re</td>";
	           output += "</tr>";
	           output += "<tr style='border:0px;'><td colspan='8' width='100%' align='center'>"+fn_inputF(i)+"</td></tr>";
	       }
	       output += "</table>";
	       $("#listReply").html(output);
	   }
	});
}

function fn_btnReply(pos){
	var objMain = document.getElementById("tb_replyMain");
	var i = 0;
	for(i;i<9999;i++){
		var obj = document.getElementById("tb_reply"+i);
		if(obj == null) break;
		if(pos == i){
			if(obj.style.display == '') {
				obj.style.display = 'none';
				objMain.style.display = '';
			}
			else{
				obj.style.display = '';
				objMain.style.display = 'none';
			}
		}else{
			obj.style.display = 'none';
		}
	}
}

//댓글 입력 창
function fn_inputF(i){
	var tb_inputF = "<table id='tb_reply"+i+"' align='center' border='0' style='display:none;'>"
						+"<tr><td>"
						+"<input type='text' placeholder='작성자'>&nbsp; &nbsp;<input type='password' placeholder='비밀번호'><br />"
						+"<textarea rows='3' cols='138' placeholder='내용'></textarea>"
					+"</td></tr>"
					+"</table>";
	return tb_inputF;
}
</script>
</head>
<body>
<div class="container">
	<c:forEach items="${postView}" var="view">
		<table class="table table-board">
			<colgroup>
				<col width="20%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr><td>Date</td><td>${view.enroll_dt}</td></tr>
				<tr><td>글쓴이</td><td>${view.writer}</td></tr>
				<tr><td>제목</td><td>${view.title}</td></tr>
				<tr><td>내용</td><td>${view.content}</td></tr>
			</tbody>
		</table>
		<div align="center">
			<button class="btn btn-normal" type="button" onclick="location.href='/crud/update/viewNo=${view.viewNo}'">수정</button>&nbsp;&nbsp;
			<button class="btn btn-normal" type="button" onclick="deletePost(${view.viewNo})">삭제</button>&nbsp;&nbsp;
			<button class="btn btn-normal" type="button" onclick="location.href='/crud/list/${curP}'">목록</button>
		</div>
		<script>var vno = ${view.viewNo}</script>
	</c:forEach>
</div>
<!-- **댓글 목록 출력할 위치 -->
<br />
<div id="listReply"></div>
<script>
listReply();
</script>
<br>
<table id='tb_replyMain' align='center' border='0'>
	<tr><td>
	<input type='text' placeholder='작성자'>&nbsp; &nbsp;<input type='password' placeholder='비밀번호'><br />
	<textarea rows='3' cols='138' placeholder='내용'></textarea>
</td></tr>
</table>
</body>
</html>