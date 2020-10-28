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

		$('#idfind').on('click', function() { //이메일 아이디 찾기로 이동
			location.href = 'idform.bit';
		});
		$('#pwfind').on('click', function() { //비밀번호 찾기로 이동
			location.href = 'pwform.bit';
		});

	});
</script>
<style type="text/css">
#header .grid3{
	margin-top:40px;
	position:relative;
	
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
.lmscontent h2{
	color:rgb(51, 51, 51);
	margin-bottom:40px;
}
#lock-icon{
	vertical-align:text-bottom;
	width:32px;
	height:32px;
}

#accounttable {
	width:400px;
	border-collapse: collapse;
	border:1px solid #e4e4e4;
	border-radius:5px;
	margin:auto;
}

#accounttable tr {
	
}

#accounttable th {
	color: #1E3269;
	padding: 30px;
	border-right: 1px solid #e4e4e4;
	text-align: right;
}

#accounttable td {
	padding: 10px;
	text-align: left;
}

#mypageedit, #accountback {
	float: right;
	background-color: #000069;
	border: 1px solid #000069;
	color: white;
	margin: 7px;
	width: 50px;
	height: 20px;
	line-height:20px;
}

#mypageedit:hover, #accountback:hover {
	background-color: white;
	color: #000069;
	cursor: pointer;
}

#idfind, #pwfind {
	background-color: white;
	border: 1px solid #ddd;
	color: gray;
	display:block;
	margin-left: auto;
	margin-right: auto;
	width: 200px;
	height: 50px;
	border-radius: 5px;
	box-shadow: #ddd 1px 1px 2px;
	font-weight: bold;
}

#idfind:hover, #pwfind:hover {
	background-color: #e4e4e4;
	color: #1E3269;
	cursor: pointer;
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
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2><img id="lock-icon" src="img/lock-icon.png"> 아이디/비밀번호 찾기</h2>
				<h4>&nbsp;</h4>


				<table id="accounttable">
					<tr>
						<td><button id="idfind">아이디 찾기</button></td>
					</tr>
					<tr>
						<td><button id="pwfind">비밀번호 찾기</button></td>
					</tr>
				</table>


			</div>
			<div class="lmscontent">
				<!-- <button id="accountback" onclick="window.history.go(-1)">뒤로</button> -->

			</div>
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