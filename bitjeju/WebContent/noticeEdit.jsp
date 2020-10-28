<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf" %>
<style rel="stylesheet" type="text/css">
	#header .grid3 {
		margin-top: 40px;
		position: relative;
	}

	.lmscontent {
		width: 600px;
		display: block;
		margin: auto;
	}
	.lmscontent:last-child {
		margin-bottom:300px;
	}
	#drtable{
		margin: 20px auto;
		border-collapse:collapse;
		margin-top:40px;
		border-top:3px solid #000069;
	}
	#drtable th{
		height: 30px;
		text-align:center;
		width: 130px;
		color:#1E3269;
		padding:10px;
		border-right:1px solid #e4e4e4;
		border-bottom:1px solid #e4e4e4;
	}
	#drtable td{
		border-bottom:1px solid #e4e4e4;
		padding:15px;
	}
	#drtable textarea{
		border:1px solid #e4e4e4;
		width:600px;
	}
	.drTitle{
		border:1px solid #e4e4e4;
		width:450px;
		margin:0px;
	}
	#drtable input[type="file"] {
		border:1px solid #e4e4e4;
		position: absolute;
		width: 0;
		height:0;
		padding: 0;
		overflow: hidden;
	}
	.upload-name { /* form input */
		width: 330px;
		height: 20px;
		margin: 7px;
		border-radius: 5px;
		border: 1px solid #969696;
		text-align: center;
		vertical-align: middle;
	}
	textarea{
		resize: none;
		height: 400px;
	}
	#drtable label {
		display: inline-block;
		padding: 10px;
		color: gray;
		vertical-align: middle;
		background-color: #fdfdfd;
		cursor: pointer;
		border: 1px solid gray;
		border-radius: 5px;
		line-height:4px;
	}
	#drtable label:hover {
		background-color:#000069;
		color:white;
		cursor: pointer;
	}
	.btn{
		text-align:center;
		text-decoration: none;
		background-color: #000069;
		border: 1px solid #000069;
		color: white;
		width: 60px;
		margin: 5px;
		margin-top:30px;
		line-height: 30px;
		border-radius:5px;
		float:right;
	}
	.btn:hover{
		border: 1px solid #000069;
		background-color: white;
		color: #000069;
		cursor:pointer;	
	}
</style>
<script type="text/javascript">
$(function() {
	var fileTarget = $('#fileName');
	fileTarget.on('change', function() { // 값이 변경되면
		var cur = $("#drtable input[type='file']").val();
		$(".upload-name").val(cur);
	});
		var str = document.getElementById("textarea").value;//줄바꿈을 <br/>로
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		document.getElementById("textarea").value = str;
		
		var str2 = document.getElementById("textarea").value;//<br>을 줄바꿈으로
		str2 = str2.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
		document.getElementById("textarea").value = str2;

});
</script>
<title>BITCAMP JEJU: 공지사항 작성페이지</title>
</head>
<body>
<%@ include file="template/header.jspf" %>
<%@ include file="template/menu.jspf" %>
   <div id="contents">
   <!--*****************lms메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>고객센터</p>
				<ul>
					<li class="bigletter"><a href="customercenter.bit">공지사항</a></li>
					<li class="bigletter"><a href="faq.bit">FAQ</a></li>
					<li></li>
				</ul>
			</div>
		</div>
        <!--*****************lms메뉴******************-->
       <div  id="content" class="grid6">&nbsp;
       <!--*************content start****************-->
       <div class="lmscontent">
       <h2>공지사항</h2>
	       <div>
	       <form method="post" action="noticeedit.bit" enctype="multipart/form-data">
	       <c:set value="${bean }" var="bean"></c:set>
	       	<table id="drtable">
	       		<tr>
	       			<th>제목</th>
	       			<td><input type="text" name="notiTitle" maxlength="200" class="drTitle" value="${bean.title }"/></td>
	       		</tr>
	       		<tr>
	       			<td colspan="2"><textarea maxlength="2048" name="notiContent" id="textarea">${bean.content }</textarea></td>
	       		</tr>
	       		<tr>
	       			<th>첨부파일</th>
	       			<td>
	       				<input class="upload-name" value="${bean.filename }" placeholder="파일선택" />
						<label for="fileName">업로드</label>
						<input type="file" id="fileName" value="notice/${bean.filename }" name = "fileName"/>
					</td>
	       		</tr>
	       	</table>
	       	<button type="submit" class="btn">수정</button>
	       	</form>
	       </div>
       </div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>