<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>BITCAMP JEJU: LMS강사-수강생 상세정보</title>
<script type="text/javascript">
	var attRate = "${bean.attRate()}"; //출석률
	var classRate = "${bean.classProgress()}"; //수업진행률
	$(function() {
		$('#cl-progress').progressbar({value : Math.floor(classRate)});
		$('#cl-progress').css('height','23px').css('vertical-align','text-bottom');
		$('#cl-progress').find(".ui-progressbar-value").css({"background":"#e4e4e4"}).css('height','100%');
	 //프로그래스 바
		$('#ar-progress').progressbar({value : Math.floor(attRate)});
		//$('#ar-progress').progressbar({value : 88});
		$('#ar-progress').css('height','23px').css('vertical-align','text-bottom');
		$('#ar-progress').find(".ui-progressbar-value").css({"background":"#e4e4e4"}).css('height','100%');
		
		
	});
</script>
<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	border-bottom: 1px solid #e4e4e4;
}

.lmscontent:last-child {
	border-bottom: 0px solid #e4e4e4;
	margin-bottom: 200px;
}

#lecname {
	color: #787878;
	font-size: 14px;
	font-weight: bold;
	line-height: 15px;
}

#lecturetable {
	border-collapse: collapse;
	font-size: 110%;
}

#lecturetable tr {
	
}

#lecturetable th {
	color: #1E3269;
	padding: 30px;
	border-right: 1px solid #e4e4e4;
	text-align: right;
}

#lecturetable td {
	padding: 25px;
	text-align: left;
}

#studentdelete, #studentback {
	float: right;
	background-color: #000069;
	border: 1px solid #000069;
	color: white;
	margin: 7px;
	width: 50px;
	height: 30px;
	line-height: 30px;
	border-radius: 5px;
}

#studentdelete:hover, #studentback:hover {
	cursor: pointer;
	background-color: white;
	color: #000069;
}

#attRange, #classRange { /* progress bar */
	height: 20px;
	width: 300px;
	/* background-color:beige; */
}
.btns{
	padding-top:40px;
}
.bardivs {
	width: 300px; /* 100% */
	position: relative;
	
}
#cl-pro-text,#ar-pro-text {
	position: absolute;
 	top: 0;
	left: 0;
	width: 100%;
	padding-top: 0px;
	text-align: center;
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
				<p>
					강사<br>
					<span id="lecname">${login.lecture }</span>
				</p>
				<ul>
					<li class="bigletter">출결관리</li>
					<li><a href="lmsteacherattendance.bit">출석체크</a></li>
					<li><a href="lmsteacherattlist.bit">출석조회</a></li>
					<li class="bigletter">수강생관리</li>
					<li><a href="lmsteacherstulist.bit">수강생정보</a></li>
					<li><a href="lmsteacherstugrade.bit">성적관리</a></li>
					<li><a href="lmsteacherDataroom.bit" class="bigletter">자료실</a>
					</li>
					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2>수강생 관리</h2>
				<h4>수강생 상세정보</h4>
				<c:set value="${bean }" var="bean" />
				<table id="lecturetable">
					<tr>
						<th>이름</th>
						<td>${bean.name }</td>
					</tr>
					<c:set var="phoneNum" value="${bean.phone}" />
					<tr>
						<th>전화번호</th>
						<td>${fn:substring(phoneNum,0,3) }-${fn:substring(phoneNum,3,7) }-${fn:substring(phoneNum,7,11) }</td>
					</tr>

					<tr>
						<th>강좌명</th>
						<td>${bean.lecture_name }</td>
					</tr>
					<tr>
						<th>강사명</th>
						<td>${bean.teacher_name }</td>
					</tr>
					<tr>
						<th>강의실</th>
						<!--숫자는 null이면 0으로 출력되므로 조건문처리.  -->
						<c:choose>
							<c:when test="${bean.lecture_room ne 0 }">
								<td>${bean.lecture_room }</td>
							</c:when>
							<c:when test="${bean.lecture_room eq 0 }">
								<td>${null }</td>
							</c:when>
						</c:choose>
					</tr>
					<tr>
						<th>개강일</th>
						<td>${bean.start_day }</td>
					</tr>
					<tr>
						<th>종강일</th>
						<td>${bean.end_day }</td>
					</tr>
					<tr>
						<th>수업 진행률</th>
						<td><div class="bardivs">
								<div id="cl-progress"></div>
								<div id="cl-pro-text">&nbsp;${bean.classProgress()}%&nbsp;(${bean.calTilToday()}/${bean.calAttDays()}일)</div>
							</div></td>
					</tr>
					<tr>
						<th>출석률</th>
						<td><div class="bardivs">
								<div id="ar-progress"></div>
								<div id="ar-pro-text">&nbsp;${bean.attRate()}%&nbsp;(${bean.cntAtt()}/${bean.calAttDays()}일)</div>
							</div></td>
					</tr>
					<tr>
						<th>출석</th>
						<td>${bean.cntAtt() }회</td>
					</tr>
					<tr>
						<th>지각</th>
						<td>${bean.cntLate() }회</td>
					</tr>
					<tr>
						<th>조퇴</th>
						<td>${bean.cntEarly() }회</td>
					</tr>
					<tr>
						<th>결석</th>
						<td>${bean.cntAbsent() }회</td>
					</tr>
					<tr>
						<th>JAVA</th>
						<td>${bean.exam1 }</td>
					</tr>
					<tr>
						<th>WEB</th>
						<td>${bean.exam2 }</td>
					</tr>
					<tr>
						<th>FRAMEWORK</th>
						<td>${bean.exam3 }</td>
					</tr>
				</table>
			</div>
			<div class="lmscontent btns">
				<button id="studentback" onclick="window.history.go(-1)">뒤로</button>
			</div>
			<!--*************content end******************-->
			<%@ include file="template/footer.jspf"%>
</body>
</html>