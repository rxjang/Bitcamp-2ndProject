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


var fail ="${mypageChk}";

$(function(){
		if(fail=='fail'){
			alert('비밀번호를 확인해주세요.');
			fail='';
		}
		
		$('#mypageForm').on('submit',function(){//회원번호(PK)이용해서 삭제. 
			if($('#mypagepw').val()==''){
				alert('비밀번호를 입력해주세요.');
				return false;
			
			}

		});//비밀번호 입력 버튼 누르면 mypage.bit 컨트롤러 dopost로 이동함.
});
</script>
<style type="text/css">
#header .grid3{
	margin-top:40px;
	position:relative;
	
}
.title_small {
	margin-top: 10px;
	margin-bottom: 50px;
	width: 600px;
	height: 30px;
	/* border-bottom: 1px solid #e4e4e4; */
	color: #999;
}
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	margin-bottom:40px;
	/* border-bottom:1px solid #e4e4e4; */
}
.lmscontent:last-child{/*푸터와 거리두기  */
	margin-bottom:400px;
}

#lock-icon{
	vertical-align:text-bottom;
	width:32px;
	height:32px;
}
#beforemypagetable{
	border-collapse:collapse;
	width:400px;
	display:block;
	margin:auto;
	margin-top:80px;
	border-top:1px solid #e4e4e4;
	border-bottom:1px solid #e4e4e4;
}
#beforemypagetable tr{
}
#beforemypagetable th{
	color:#1E3269;
	padding:30px;
/* 	border-right:1px solid #e4e4e4; */
	text-align:right;
}
#beforemypagetable td{
	padding:25px;
	text-align:left;
}
#mypagepw{
	width:200px;
	height:25px;
	border-radius: 5px;
	font-size:130%;
	text-align:center;
}

#mypagesubmit,#mypageback{
	float:right;
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 50px;
    height: 30px;
    line-height: 30px;
    border-radius: 5px;
}
#mypageback{
	margin-right:140px;
}
#mypagesubmit:hover,#mypageback:hover{
	background-color:white;
	color:#000069;
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
				<p>내 정보</p>
				<ul>
					<li class="bigletter">계정관리</li>
					<li><a href="mypage.bit">회원정보</a></li>

				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
		<form action="mypage.bit" method="post" id="mypageForm">
			<div class="lmscontent">
				<h2><img id="lock-icon" src="img/lock-icon.png"> 본인확인</h2>
			 	<div class="title_small">
				<small>비밀번호를 입력해주세요.</small>
				</div>
					<c:set value="${login }" var="bean" />
				<table id="beforemypagetable">
					<tr>
						<th>아이디</th>
						<td>${bean.id_email }<input type="hidden" name="mypageid" value="${login.id_email }"/></td> <!--세션에 저장된 memberDto login에서 id을 get함  -->
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="mypagepw" id="mypagepw"/></td>
					</tr>
					
				</table>


			</div>
			<div class="lmscontent">
			<button id="mypageback" type="button" onclick="window.history.go(-1)">뒤로</button>			
			<button id="mypagesubmit" type="submit">확인</button>			
<!-- 			<button id="accountedit">수정</button>

수강생관리에서 수강생 삭제기능만 넣기. 개인정보는 각자 로그인했을 때 변경. 	 -->		
			</div>
			</form>
			<!--*************content end******************-->
			<%@ include file="template/footer.jspf"%>
</body>
</html>
