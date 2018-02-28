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
	       var output = "<table border='0' width='1000px' align='center' style='background:#F6F6F6;border-bottom:solid 1px #D2D2D2;'>";
	       for(var i in result){
	           output += "<tr style='border-top:solid 1px #D2D2D2;'>";
	           if(result[i].textlvl == 1) output += "<td colspan='6' width='97%' valign='top'>";
	           else if(result[i].textlvl == 2) output += "<td width='2%' align='right' valign='top'></td><td colspan='5' width='98%' valign='top'>";
	           else if(result[i].textlvl == 3) output += "<td colspan='2' width='4%' align='right' valign='top'></td><td colspan='4' width='96%' valign='top'>";
	           else if(result[i].textlvl == 4) output += "<td colspan='3' width='6%' align='right' valign='top'></td><td colspan='3' width='94%' valign='top'>";
	           else if(result[i].textlvl == 5) output += "<td colspan='4' width='8%' align='right' valign='top'></td><td colspan='2' width='92%' valign='top'>";
	           else if(result[i].textlvl >= 6) output += "<td colspan='5' width='10%' align='right' valign='top'></td><td width='90%' valign='top'>";
	           var dt = result[i].enroll_dt;
	           output += "<strong>"+result[i].writer+"</strong>&nbsp; &nbsp;<font size='1'>"+result[i].enroll_dt+"</font>&nbsp; &nbsp;";
	           output += "<img src='https://github.com/sollera/crud_board/blob/master/img/reply.gif?raw=true' onclick='fn_btnReply("+i+")' style='width:10px; height:10px;'>&nbsp;";
	           output += "<img src='https://github.com/sollera/crud_board/blob/master/img/change.png?raw=true' onclick='fn_btnMod("+i+")' style='width:10px; height:10px;'>&nbsp;";
	           output += "<img src='https://github.com/sollera/crud_board/blob/master/img/del.png?raw=true' onclick='fn_btnDel("+i+")' style='width:10px; height:10px;'>&nbsp;";
	           output += fn_DelF(i,result[i].viewNo,result[i].title);
	           output += "<br />";
	           output += result[i].content+"</td>";
	           output += "</tr>";
	           output += "<tr style='border:0px;'><td colspan='7' width='100%' align='center'>"+fn_inputF(i,result[i].ref,result[i].textlvl,result[i].step,result[i].viewNo)+"</td></tr>";
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
function fn_inputF(i,refA,textlvlA,stepA,viewNoA){
	var tb_inputF = "<table id='tb_reply"+i+"' align='center' border='0' style='display:none;'>"
						+"<tr><td>"
						+"<input type='text' id='writer"+i+"' placeholder='작성자'>&nbsp; &nbsp;<input type='password' id='title"+i+"' placeholder='비밀번호'>"
						+"<input type='button' value='등록' onclick='fn_saveReply("+i+")'><br />"
						+"<textarea rows='3' cols='138' id='content"+i+"' placeholder='내용' style='margin-top:2px;resize:none;'></textarea>"
						+"<input type='hidden' id='ref"+i+"' value='"+refA+"'>"
						+"<input type='hidden' id='textlvl"+i+"' value='"+(textlvlA+1)+"'>"
						+"<input type='hidden' id='step"+i+"' value='"+(stepA+1)+"'>"
						+"<input type='hidden' id='parentsno"+i+"' value='"+viewNoA+"'>"
					+"</td></tr>"
					+"</table>";
	return tb_inputF;
}

var vno;
//댓글 저장
function fn_saveReply(i){
	var title; var writer; var content;
	var refS; var textlvlS; var stepS; var viewNoS;
	if(i == 'Main'){
		title = $("#titleM").val();
		writer = $("#writerM").val();
		content = $("#contentM").val();
		refS = $("#refM").val();
		textlvlS = $("#textlvlM").val();
		stepS = $("#stepM").val();
		viewNoS = $("#parentsnoM").val();
	}else{
		title = $("#title"+i).val();
		writer = $("#writer"+i).val();
		content = $("#content"+i).val();
		refS = $("#ref"+i).val();
		textlvlS = $("#textlvl"+i).val();
		stepS = $("#step"+i).val();
		viewNoS = $("#parentsno"+i).val();
	}
	var param = "title="+title+"&writer="+writer+"&content="+content+"&ref="+refS+"&textlvl="+textlvlS+"&step="+stepS+"&viewNo="+viewNoS;
	$.ajax({                
        type: "post",
        url: "/crud/insert.do",
        data: param,
        success: function(){
            alert("댓글이 등록되었습니다.");
            listReply();
            //댓글 입력창 호출 & value clear
        },
        error: function() {
            alert("댓글 등록 실패");
        }
    });
}

function fn_btnMod(i){
	
}

//댓글 삭제 확인 폼 호출
function fn_btnDel(pos){
	var i = 0;
	for(i;i<9999;i++){
		var objPT = document.getElementById("delPassword"+i);
		var objPBY = document.getElementById("delBtnY"+i);
		var objPBN = document.getElementById("delBtnN"+i);
		if(objPT == null) break;
		if(i == pos){
			if(objPT.type=='hidden') objPT.type='password';
			else objPT.type='hidden';
			if(objPBY.type=='hidden') objPBY.type='button';
			else objPBY.type='hidden';
			if(objPBN.type=='hidden') objPBN.type='button';
			else objPBN.type='hidden';
		}else{
			objPT.type='hidden';
			objPBY.type='hidden';
			objPBN.type='hidden';
		}
	}
}
function fn_btnDelCancel(i){
	document.getElementById("delPassword"+i).type = 'hidden';
	document.getElementById("delBtnY"+i).type = 'hidden';
	document.getElementById("delBtnN"+i).type = 'hidden';
}
//댓글 삭제 확인 폼
function fn_DelF(i,vno,pw){
	var tb_DelF = "&nbsp;<input type='hidden' id='delPassword"+i+"' placeholder='password' style='width:70px;height:20px;vertical-align:middle;'>&nbsp;"
					+"<input type='hidden' id='delBtnY"+i+"' value='삭제' style='padding:0;text-size:12px;height:20px;vertical-align:middle;' onclick='fn_Del("+i+","+vno+",&#39;"+pw+"&#39;)'>&nbsp;"
					+"<input type='hidden' id='delBtnN"+i+"' value='취소' style='padding:0;text-size:12px;height:20px;vertical-align:middle;' onclick='fn_btnDelCancel("+i+")'>";
	return tb_DelF;
}
//댓글 삭제 처리
function fn_Del(i,vno,pw){
	var objPW = document.getElementById("delPassword"+i);
	if(pw == objPW.value){
		$.ajax({                
	        type: "get",
	        url: "/crud/delete.do/"+vno,
	        success: function(){
	            alert("댓글을 삭제했습니다.");
	            listReply();
	        },
	        error: function() {
	            alert("댓글 삭제 실패");
	        }
	    });
	}
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
		<script>
			vno = ${view.viewNo}
			var refO=${view.ref}; var textlvlO = ${view.textlvl}; var stepO = ${view.step}; var parentsnoO = ${view.viewNo}
		</script>
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
		<input type='text' id='writerM' placeholder='작성자'>&nbsp; &nbsp;<input type='password' id='titleM' placeholder='비밀번호'>
		<input type='button' value='등록' onclick='fn_saveReply("Main")'><br />
		<textarea rows='3' cols='138' id='contentM' placeholder='내용' style='margin-top:2px;resize:none;'></textarea>
		<script>
			document.write("<input type='hidden' id='refM' value='"+refO+"'>");
			document.write("<input type='hidden' id='textlvlM' value='"+(textlvlO+1)+"'>");
			document.write("<input type='hidden' id='stepM' value='"+(stepO+1)+"'>");
			document.write("<input type='hidden' id='parentsnoM' value='"+parentsnoO+"'>");
		</script>
	</td></tr>
</table>
</body>
</html>