<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>BITCAMP JEJU: LMS영업-모집공고</title>
<script type="text/javascript">
$(function(){});
</script>

<style type="text/css">
.lmscontent { /* 제목과 테이블을 전부 감싸는 div */
	width: 600px;
	display: block;
	margin: auto;
	height:900px;
}

#lecturetable {
	margin: auto;
	width: 600px;
	border-collapse: collapse;
	border-bottom: 1px solid #e4e4e4;
	border-top: 1px solid #e4e4e4;
	margin-bottom:10px;
}

#lecturetable tr {
	text-align: center;
}

#lecturetable tr:first-child ~tr:hover { /* 테이블 첫번째 tr빼고 hover적용  */
	color: #1E3269;
	background-color: aliceblue;
	cursor: pointer;
}

#lecturetable th {
	color: #1E3269;
	padding: 30px;
	border-bottom: 1px solid #e4e4e4;
}

#lecturetable td {
	padding: 25px;
}

#lecturetable a {
	display: block;
	text-decoration: none;
	color: black;
	text-decoration: none;
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
				<p>영업</p>
				<ul>
					<li class="bigletter">모집공고</li>
					<li><a href="lmssalesrecruitlist.bit">강좌정보</a></li>
					<li class="bigletter">수강생관리</li>
					<li><a href="lmssalesassign.bit">강좌배정</a></li>
<!-- 					<li><a href="lmsstafflecturelist.bit">강좌정보</a></li>
					<li class="bigletter">수강생관리</li>
					<li><a href="lmsstaffstudentlist.bit">수강생정보</a></li> -->
					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2>모집공고</h2>
				<h4>강좌정보</h4>


				<table id="lecturetable">
					<tr>
						<th>강좌명</th>
						<th>모집공고</th>
						
					</tr>
					<c:forEach items="${list }" var="bean">
						<tr>
							<td><a href="lmssalesrecruitdetail.bit?lecture_num=${bean.lecture_num }">${bean.lecture_name }</a></td>
							
							<c:choose>
							<c:when test="${bean.recruit_num eq 0}">
							<td>&nbsp;</td>							
							</c:when>
							
							<c:when test="${bean.recruit_num ne 0}">
							<td>모집중</td>							
							</c:when>
							</c:choose>
						
							
						</tr>
					</c:forEach>

				</table>
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