<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>

<title>BITCAMP JEJU: LMS행정-수강생정보</title>

<script type="text/javascript">
	var lecturename = "${lecture.lecture_name}";//el
	var studentNum = "${bean.num}";

	//**********com.bitjeju.lms.teacher.stu.model패키지 내 StudentDto에 있는 method
	//디테일 서블릿에서 StudentDto bean을 받아서 el이용하여 Dto내 메서드 사용.
	var attRate = "${bean.attRate()}"; //출석률
	var classRate = "${bean.classProgress()}"; //수업진행률
	/* var cntAtt = "${bean.cntAtt()}";//출석횟수 studentDto에 method구현해둠.
	 var cntLate = "${bean.cntLate()}";//지각횟수
	 var cntEaryl = "${bean.cntEarly()}";//조퇴횟수
	 var cntAbsent = "${bean.cntAbsent()}";//결석횟수 */

	$(function() {
		/* 	$('#lectureedit').on('click',function(){//*************수정 서블릿으로
		 location.href='lmsstafflectureedit.bit?lecture_name='+lecturename+'&lecture_num='+lecturenum;
		 }); */
		console.log(Math.floor(classRate));
		$('#cl-progress').progressbar({value : Math.floor(classRate)});
		$('#cl-progress').css('height','23px').css('vertical-align','text-bottom');
		$('#cl-progress').find(".ui-progressbar-value").css({"background":"#e4e4e4"}).css('height','100%');
	 //프로그래스 바
		$('#ar-progress').progressbar({value : Math.floor(attRate)});
		//$('#ar-progress').progressbar({value : 88});
		$('#ar-progress').css('height','23px').css('vertical-align','text-bottom');
		$('#ar-progress').find(".ui-progressbar-value").css({"background":"#e4e4e4"}).css('height','100%');

		if (attRate >= 80) {
			$('#studentdelete').attr('disabled', 'disabled').css(
					'background-color', 'gray');
			//출석률이 80%이상이면 삭제버튼 비활성.
		} else {
			$('#studentdelete').removeAttr('disabled');
			//출석률이 80%미만이면 삭제버튼 비활성화 속성을 삭제. 삭제가능. 
		}
		$('#studentdelete').on('click', function() {//****************삭제 서블릿으로
			location.href = 'lmsstaffstudentdelete.bit?num=' + studentNum;
		});
		console.log(attRate, classRate);
		$('#attRange').prop('value', attRate);
		$('#classRange').prop('value', classRate);

	});//ready
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
	background-color: white;
	color: #000069;
	cursor: pointer;
}

#attRange, #classRange { /* progress bar */
	height: 20px;
	width: 300px;
	/* 	background-color:beige; */
}

.btns {
	padding-top: 40px;
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
			<div class="lmscontent">
				<h2>수강생 관리</h2>
				<h4>수강생정보</h4>
				<!-- 
private String lecture_name;
	private Date start_day, end_day;
	private int num, lecture_room,lecture_num;
	


 -->

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
				<button id="studentdelete">삭제</button>

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