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
			if($('.findemail').val() == ''|| $('.findname').val() == ''){
				alert('이메일을 입력해주세요.');
				return false;
			}
			$('#waiting').css('display','block');
			$('#waiting').append('<span id="waitingMsg">메일 전송 중...</span>');
			//전송 중이라는 메세지 띄움
			
			
			var param = 'findemail='+$('.findemail').val()+'&findname='+$('.findname').val();
			//입력한 패스워드, 이름. 파라미터 변수에 저장.
			$.ajax('findpw.bit',{
				'method':'post',
				'data':param
			});//ajax
			//비동기로 메일전송을 시켜둔다.
			//메일 전송이 느려서 전송컨트로러에 파라미터 전송 후 페이지 이동은 따로 시켜줌.
			
			location.href='findpw.bit';
			//메일전송은 비동기로 시켜두고 일단 메일전송했다는 페이지로 이동시킴.
		
			return false;//폼태그 서브밋 방지
		});//submit
		
		
		
		
	});
</script>
<style type="text/css">
#header .grid3{
	margin-top:40px;
	position:relative;
	
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
	height: 55px;
	border-bottom: 1px solid #e4e4e4;
	color: #999;
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

#pwfindbtn {
	float: right;
	background-color: #5cb85c;
	border: 1px solid #5cb85c;
	color: white;
	margin: 7px;
	width: 70px;
	height: 30px;
	line-height:30px;
	border-radius:5px;
}

#pwfindbtn:hover {
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

.findname, .findemail { /*비밀번호 input  */
	width: 280px;
	height: 25px;
	margin: 7px;
	border-radius: 5px;
	border: 1px solid #969696;
	font-size: 90%;
	text-align: center;
}
#waiting{
	width:200px;
	height:30px;
	display:none;
	margin:auto;
	margin-top:40px;
	text-align:center;
	border:1px solid #000069;
	background-color:white;
	position:absolute;
	top:25%;
	left:40%;
	z-index: 10;
	vertical-align:middle;
}
#waitingMsg{
	vertical-align:middle;
	color:#000069;
	font-weight:bold;
	font-size:110%;
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
		<form action="findpw.bit" method="post" id="accountfindform">
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2><img id="lock-icon" src="img/lock-icon.png"> 비밀번호 찾기</h2>
				<div class="title_small">
				<small>비트캠프의 아이디는 이메일입니다.<br/>
				가입했던 이메일 주소를 아래의 란에 입력하시면 비밀번호가 이메일로 보내집니다.</small>
				</div>


				<table id="accounttable">
					<tr>
						<th>이메일</th>
						<td><input type="email" name="findemail" class="findemail" placeholder="이메일을 입력해주세요."/></td>
					</tr>
					<tr>
						<th></th>
						<td><button id="pwfindbtn" type="submit">보내기</button></td>
					</tr>
				</table>


			
			</div>
			<div class="lmscontent">

			</div>
			</form>
			<div id="waiting"></div>
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