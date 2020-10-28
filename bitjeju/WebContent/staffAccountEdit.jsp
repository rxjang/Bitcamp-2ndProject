<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>

<title>BITCAMP JEJU: LMS행정-회원정보</title>

<script type="text/javascript">
var editnum="${bean.num}";//회원번호
var editemail="${bean.id_email}";
var beanlvl = "${bean.lvl}";

$(function(){
/* 	$('#accountedit').on('click',function(){//수정페이지 이동. 
		location.href='lmsstaffaccounteidt.bit?num='+editnum+'&emailid='+editemail;
	}); */
	$('#selectlvl option').each(function(){
		if($(this).val()==beanlvl){ 
			//select의 옵션들과 현재 회원의 lvl을 비교해서 같은거를 selected로 둔다.
			$(this).prop('selected', true);
		}//if
	});
	//each
	
	$('select option').each(function(){
		var textLength = $(this).text().length;
		var space = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
			+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		if(textLength==2){ 
			$(this).html(space+$(this).text());
		}
		else if(textLength==3){ 
			space = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
			+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			$(this).html(space+$(this).text());
		}
		else if(textLength==4){ 
			space = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
			+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			$(this).html(space+$(this).text());
		}
	});//each
	
});//ready
</script>
<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
}
.lmscontent:last-child{/*푸터와 거리두기  */
	margin-bottom:200px;
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

#selectlvl{
	border-radius:5px;
	width:200px;
	height:40px;
	text-align:center;
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
			<!--*************content start****************-->
			<form action="lmsstaffaccountedit.bit" method="post">
			<div class="lmscontent">
				<h2>계정관리</h2>
				<h4>회원정보</h4>


					<c:set value="${bean }" var="bean" />
				<table id="accounttable">
					<tr>
						<th>회원번호</th>
						<td>${bean.num }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${bean.name }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${bean.id_email }</td>
					</tr>
					<tr>
						<th>구분</th>
						<td>
						<select name="accounteditlvl" id="selectlvl">
							<option value="5">행정</option>
							<option value="4">영업</option>
							<option value="3">강사</option>
							<option value="2">수강생</option>
							<option value="1">수료생</option>
							<option value="0">일반회원</option>
						</select>
						<input type="hidden" name="num" id="accounteditnum" value="${bean.num }"/>
						</td>
					</tr>
					<tr>
						<th>권한레벨</th>
						<td>${bean.lvl }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${bean.phone }</td>
					</tr>
				</table>


			</div>
			<div class="lmscontent">
			<button id="accountback" type="button" onclick="window.history.go(-1)">뒤로</button>			
			<button id="accountedit" type="submit">수정</button>	
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