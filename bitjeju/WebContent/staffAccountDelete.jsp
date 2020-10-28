<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>BITCAMP JEJU: LMS행정-회원강퇴</title>

<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
}
#deleteform{
	margin-bottom:500px;/*푸터와 거리두기  */
}
#accounttable{
	width:600px;
	border-bottom:1px solid #e4e4e4;
	border-collapse:collapse;
	margin-bottom: 40px;
}
#accounttable tr{
}
#accounttable th{
	color:#1E3269;
	padding:30px;
	border-right:1px solid #e4e4e4;
	text-align:right;
}
#accounttable td{
	width:400px;
	padding:25px;
	text-align:left;
}
#accountedit,#accountdelete,#accountback{
	float:right;
    background-color: #000069;
    border:1px solid #000069;
    border-radius:5px;
    color:white;
    margin: 7px;
    width: 50px;
    height: 30px;
    line-height:30px;
}
#accountedit:hover,#accountdelete:hover,#accountback:hover{
		background-color:white;
		color:#000069;
		cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="template/lmsheader.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*****************lms메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>행정</p>
				<ul>
					<li class="bigletter">계정관리</li>
					<li><a href="lmsstaffaccountlist.bit">회원정보</a></li>
					<li class="bigletter">강의관리</li>
					<li><a href="lmsstafflectureadd.bit">강좌개설</a></li>
					<li><a href="lmsstafflecturelist.bit">강좌정보</a></li>
					<li class="bigletter">수강생관리</li>
					<li><a href="lmsstaffstudentlist.bit">수강생정보</a></li>
					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<form id="deleteform" action="lmsstaffaccountdelete.bit" method="post">
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2>계정관리</h2>
				<h4>회원강퇴</h4>


					<c:set value="${emailid }" var="emailid" />
				<table id="accounttable">
					<tr>
						<th>이메일</th>
						<td>${emailid}</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>삭제하시겠습니까?</td>
					</tr>
				</table>


			</div>
			<div class="lmscontent">
			<button type="button" id="accountback" onclick="window.history.go(-1)">뒤로</button>			
			<button type="submit" id="accountdelete">삭제</button>			
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