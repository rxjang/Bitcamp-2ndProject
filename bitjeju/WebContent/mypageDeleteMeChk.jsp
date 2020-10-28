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
var num = "${bean.num }";
	$(function() {
		$('#withdrawalform').on('submit',function(){
			if($('#deletemepw').val() == ''){
				alert('비밀번호를 입력해주세요.');
				return false;
			}
			
				//var param = 'idx='+num
				var param = 'idx=' + num + '&pw=' + $('#deletemepw').val();
				$.ajax('deleteme.bit', {
					'method' : 'post',
					'data' : param,
					'success' : function(data) { //여기서 data는 controller에서 받은 결과
						var result = $(data).find('result').text();
						if (result == 1) {
							alert('회원정보가 삭제되었습니다')
							location.href = 'logout.bit';
						} else {
							alert('비밀번호를 확인해주세요');
						}
					},//success
					'error' : function(data) {
						alert('error');
					}//error
				});//ajax
		
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
	width:450px;
	border-collapse: collapse;
}

#accounttable tr {
	
}

#accounttable th {
	color: #1E3269;
	padding: 30px;
	/* border-right: 1px solid #e4e4e4; */
	text-align: right;
	width:135px;
}

#accounttable td {
	padding: 10px;
	text-align: left;
}

#deleteMeOk {
	float: right;
	background-color: #d90b0b;
	border: 1px solid #d90b0b;
	color: white;
	margin: 7px;
	width: 70px;
	height: 30px;
	line-height:30px;
	border-radius:5px;
}

#deleteMeOk:hover {
	background-color: white;
	color: #d90b0b;
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

#deletemepw{ /*비밀번호 input  */
	width: 280px;
	height: 25px;
	margin: 7px;
	border-radius: 5px;
	border: 1px solid #969696;
	font-size: 90%;
	text-align: center;
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
				<p>내 정보</p>
				<ul>
					<li class="bigletter">계정관리</li>
					<li><a href="mypage.bit">회원정보</a></li>

					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<form action="#" method="post" id="withdrawalform">
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2><img id="lock-icon" src="img/lock-icon.png"> 회원탈퇴</h2>
				<div class="title_small">
				<small>주의해주세요!<br/>
				회원탈퇴시 해당 아이디는 곧바로 이용이 중지됩니다.</small>
				</div>


				<table id="accounttable">
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="deletemepw" id="deletemepw" placeholder="비밀번호를 입력해주세요."/></td>
					</tr>
					<tr>
						<th></th>
						<td><button id="deleteMeOk" type="submit">탈퇴하기</button></td>
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