<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>BITCAMP JEJU: 회원가입</title>

<script type="text/javascript">


$(function(){
	


});//ready

</script>

<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	border-bottom:1px solid #e4e4e4;
}

#signup{
	margin-bottom:400px;
}
#signuptable{
	border-collapse:collapse;
}
#signuptable tr{
}
#signuptable th{
	color:#1E3269;
	padding:30px;
	border-right:1px solid #e4e4e4;
	text-align:right;
}
#signuptable td{
	padding:25px;
	text-align:left;
}

#signupemailid,#deptselect,#name,#phone,#signuppw{
    width: 330px;
    height: 43px;
    margin: 7px;
    border-radius: 5px;
    border: 1px solid #969696;
    font-size:120%;
    text-align:center;
}

#signupbtn,#signupreset,#signupback{
	float:right;
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 50px;
    height: 20px;
}
#header .grid3{
	margin-top:40px;
	position:relative;
	
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
				<p>비트캠프</p>
				<ul>
					<li class="bigletter">환영합니다♡</li>

					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			
			<form action="signup.bit" method="post" id="signup">
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2>회원가입</h2>
				<h4>가입실패</h4>
<!-- 
--회원테이블
	num number primary key, 				--회원번호
	id_email varchar2(50) unique not null,  --이메일을 아이디로씀
	name varchar2(15),						--회원이름
	dept varchar2(20) default '일반회원',		
	lvl number(1) default 1,				--등급
	password varchar2(15) not null, 		--비밀번호 영문+숫자조합
	phone number,							--전화번호
	lecture varchar2(30),					--강좌명 
 -->


				<table id="signuptable">
					<tr>
						<th></th>
						<td>이미 가입된 이메일입니다.</td>
					</tr>


					<tr>
						<th></th>
						<td></td>
					</tr>
				</table>
				
			</div>
			<div class="lmscontent">
			<button id="signupback" type="button" onclick="location.href='main.bit'">뒤로</button>			
			</div>
			<!--*************content end******************-->
			</form>
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