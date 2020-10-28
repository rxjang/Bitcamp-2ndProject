<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>BITCAMP JEJU: 마이페이지</title>


<script type="text/javascript">
	$(function() {
		$('#accountfindform').on('submit',function(){
			if($('.findphone').val() == ''|| $('.findname').val() == ''){
				alert('모든 정보를 입력해주세요.');
				return false;
			}
		});
		

	});
</script>
<style type="text/css">
#header .grid3{
	margin-top:40px;
	position:relative;
	
}
#content{
	height:650px;
}
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	/* border-bottom: 1px solid #e4e4e4; */
}

.lmscontent:last-child { /*푸터와 거리두기  */
	margin-bottom: 400px;
}
#lock-icon{
	vertical-align:text-bottom;
	width:32px;
	height:32px;
}
.title_small {
	margin-top: 10px;
	margin-bottom: 50px;
	width: 600px;
	height: 40px;
	border-bottom: 1px solid #e4e4e4;
	color: #999;
}

#accounttable {
	margin:auto;
	width:430px;
	border-collapse: collapse;
}

#accounttable tr {
	
}

#accounttable th {
	color: #1E3269;
	padding: 30px;
	/* border-right: 1px solid #e4e4e4; */
	text-align: right;
}

#accounttable td {
	padding: 10px;
	text-align: left;
}

#idfindbtn {
	float: right;
	background-color: #5cb85c;
	border: 1px solid #5cb85c;
	color: white;
	margin: 7px;
	width: 50px;
	height: 30px;
	line-height:30px;
	border-radius:5px;
}

#idfindbtn:hover {
	background-color: #4cae4c;
	color: white;
	cursor: pointer;
}

#idfind, #pwfind {
	background-color: #000069;
	border: 1px solid #000069;
	color: white;
	display:block;
	margin-left: auto;
	margin-right: auto;
	width: 200px;
	height: 50px;
	border-radius: 5px;
}

#idfind:hover, #pwfind:hover {
	background-color: white;
	color: #000069;
	cursor: pointer;
}

.findname, .findphone { /*비밀번호 input  */
	width: 280px;
	height: 25px;
	margin: 7px;
	border-radius: 5px;
	border: 1px solid #969696;
	font-size: 90%;
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<%@ include file="template/header.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*****************lms메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>계정관리</p>
				<ul>
					<li class="bigletter">계정관리</li>
					<li><a href="accountfind.bit">계정찾기</a></li>

					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<form action="findid.bit" method="post" id="accountfindform">
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2><img id="lock-icon" src="img/lock-icon.png"> 아이디 찾기</h2>
				<div class="title_small">
				<small>이름과 가입할 때 사용한 전화번호를 입력해주세요<br/></small>
				</div>


				<table id="accounttable">
					<tr>
						<th>이름</th>
						<td><input type=text name="findname" class="findname" placeholder="이름을 입력해주세요."/></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="tel" name="findphone" class="findphone" placeholder="전화번호를 입력해주세요."/></td>
					</tr>
					<tr>
						<th></th>
						<td><button id="idfindbtn" type="submit">확인</button></td>
					</tr>
				</table>


			</div>
			<div class="lmscontent">
				

			</div>
			</form>
			<!--*************content end******************-->
			<%@ include file="template/footer.jspf"%>
</body>
</html>
<!-- 
-1번라인의 charset, pageEncoding 5번라인의 charset모두 utf-8로 맞춰주세요.
-2번의 doctype도 다지우고 위처럼 html만 남겨주세요.
-content내부에 content와 sidebar로 나눔 ->content에 작업하면됩니다.
-sidebar에서 사용하고 있는 id: #signin #emailid #pw #login #createccount #gotolms #campus #campusinfo #classinfo #open
-footer에서 사용하고있는 id: #footercon
위의 아이디들은 작업시 사용하지 마세요 이름바꾸고 싶으면 저와 의논바람
 -->