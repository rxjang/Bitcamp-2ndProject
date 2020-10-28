<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>


<script type="text/javascript">
	var loginLvl = "${login.lvl}";
	var lecture = "${recruit.recruit_name }";
	var start_day = new Date("${bean.start_day}"); 
	var end_day = new Date("${bean.end_day}");
	var today = new Date();
	var dateDiff = Math.ceil((start_day.getTime()-today.getTime())/(1000*3600*24));
	//개강날짜 - 오늘날짜 <= 0 : 0이하이면 수강신청 불가.  
	
	$(function() {

		$('#enrolment').on('click', function() {
			if (loginLvl == '') {
				alert('로그인이 필요합니다.');
			} else if (loginLvl == 2) {
				alert('이미 수강중인 강좌가 있습니다.');
			} else if (loginLvl >= 3) {
				alert('신청대상이 아닙니다.');
			}else if (dateDiff <= 0) {
				alert('모집이 마감된 강좌입니다.');
			}else {
				var param = 'lecture=' + lecture;
				$.ajax('enrolment.bit', {
					'method' : 'post',
					'data' : param,
					'success' : function() {
						alert('수강신청이 완료되었습니다.');
					}//success
				});//ajax
			}//else
		});//click

	});
</script>
<style type="text/css">
#header .grid3 {
	margin-top: 40px;
	position: relative;
}

.lmscontent {
	width: 800px;
	display: block;
	margin: auto;
	border-bottom: 1px solid #e4e4e4;
}

.lmscontent:last-child {
	margin-bottom: 300px;
}

.currintro {
	margin-top: 40px; width : 800px;
	height: 250px;
	width: 800px;
	border:0px;
}

.currintro div {
	margin-left:20px;
	float: left;	
}
#currintro-table{
	margin-bottom:20px;
	width:500px;
}
#currintro-table td{
	color:rgb(51, 51, 51);
}
#currintro-table .b{
	font-size:125%;
}
.graycolor{
	color:#3c3c3c;
}
.orange{
	color: #E56D29;
}

#thumbnail-img{
	width:200px;
	height: 200px;
}
#enrolment { /* 수강신청버튼 */
	background-color: #E56D29;
	border: 1px solid #E56D29;
	color: white;
	margin: 5px;
	width: 150px;
	height: 35px;
	border-radius: 5px;
}

#enrolment:hover {
	color: #E56D29;
	background-color: white;
	cursor: pointer;
}

#recruittable {
	font-size: 140%;
	border-collapse: collapse;
}

#recruittable tr {
	
}

#recruittable th {
	color: #1E3269;
	padding: 10px;
	text-align: center;
	border-bottom: 1px solid #e4e4e4;
}

#recruittable th+th+th {
	text-align: right;
}

#recruittable td {
	padding: 25px;
	text-align: left;
}

#recruit_name, .upload-name { /* form input */
	width: 330px;
	height: 43px;
	margin: 7px;
	border-radius: 5px;
	border: 1px solid #969696;
	font-size: 120%;
	text-align: center;
	vertical-align: middle;
}

#recruitback {
	float: right;
	background-color: #000069;
	border: 1px solid #000069;
	color: white;
	margin: 7px;
	width: 50px;
	height: 30px;
	line-height:30px;
	border-radius: 5px;
}

#recruitback:hover {
	color: #1E3269;
	background-color: white;
	cursor: pointer;
}

#recruittable input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

#recruittable label {
	display: inline-block;
	padding: 10px;
	color: gray;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid gray;
	border-radius: 5px;
}

#recruit_img {
	width: 700px;
}

#footer {
	/* margin-top:400px; */
	
}
</style>
<title>BITCAMP JEJU: 교육과정</title>
</head>
<body>
	<%@ include file="template/header.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*****************lms메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>교육과정</p>
				<ul>
					<li class="bigletter">강좌정보</li>
					<!-- 	<li><a href="lmsteacherattendance.bit">모집공고</a></li> -->

					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<c:set value="${recruit }" var="bean"></c:set>
			<div class="lmscontent currintro">


				<div>
					<img id="thumbnail-img" alt="" src="recruit/${bean.thumbnail }" /><!--썸네일이미지  -->
				</div>
				<div>
					<table id="currintro-table">
						<tr>
							<td colspan="2"><span class="b graycolor">제주센터</span></td>
						</tr>
						<tr>
							<td colspan="2"><strong><span class="b">${bean.recruit_name }</span></strong></td>
						</tr>
						<tr>
							<td><b>개강일</b></td>
							<td>&#124; <span class="orange"><strong>${bean.start_day }</strong></span></td>
						</tr>
						<tr>
							<td><b>교육기간</b></td>
							<td>&#124; ${bean.start_day }~${bean.end_day } (월 ~ 금 9:30 ~ 18:10)</td>
						</tr>
						<tr>
							<td><b>지원자격</b></td>
							<td>&#124; 고용보험에 가입되어 있지 않은 취업 준비생 또는 실업자</td>
						</tr>
					</table>
				</div>
				<div>
					<button id="enrolment">수강신청</button>
				</div>


			</div>

			<div class="lmscontent">





				<table id="recruittable">
					
					<tr>
						<th colspan="2">&nbsp;</th>
					</tr>
					<%-- 					<tr>
						<th>개강일</th>
						<td><strong>${bean.start_day }</strong></td>
					</tr>
					<tr>
						<th>교육기간</th>
						<td>${bean.start_day } ~ ${bean.end_day }</td>
					</tr>
					<tr>
						<th>지원자격</th>
						<td>고용보험에 가입되어 있지 않은 취업 준비생 또는 실업자</td>
					</tr> --%>

					<tr>

						<td colspan="2"><img id="recruit_img" alt=""
							src="recruit/${bean.recruit_file_name }"></td>
					</tr>

					<tr>
						<th></th>
						<td></td>
					</tr>
				</table>


			</div>
			<div class="lmscontent">
				<button id="recruitback" onclick="window.history.go(-1)">뒤로</button>
			</div>




			<!--*************content end******************-->
			<%@ include file="template/footer.jspf"%>
</body>
</html>
<!--
-#lmsmenu사용중
-.bigletter는 글씨크기조절용입니다 .logo는 lmslogo사이즈 조절용이예요.
-1번라인의 charset, pageEncoding 7번라인의 charset모두 utf-8로 맞춰주세요.
-3번의 doctype도 다지우고 위처럼 html만 남겨주세요.
-content내부에 content와 sidebar로 나눔 ->content에 작업하면됩니다.
-sidebar에서 사용하고 있는 id: #signin #emailid #pw #login #createccount #campus #campusinfo #classinfo #open
-footer에서 사용하고있는 id: #footercon .gotolms
위의 아이디들은 작업시 사용하지 마세요 이름바꾸고 싶으면 저와 의논바람
 -->