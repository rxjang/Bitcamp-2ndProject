<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<style rel="stylesheet" type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
}

.lmscontent:last-child {
	margin-bottom: 300px;
}

#lecturebtn {
	display: none;
}

#assigntable {
	text-align: center;
	margin: 20px auto;
	border-collapse: collapse;
	border-bottom: 1px solid #e4e4e4;
}

#assigntable th {
	width: 90px;
	color: #1E3269;
	padding: 30px;
	border-right: 1px solid #e4e4e4;
	text-align: right;
}

#assigntable td {
	padding: 30px;
	text-align: left;
}

.lecturename {
	width: 200px;
}

.startday {
	width: 100px;
}

#assigntable a {
	text-decoration: none;
	color: black;
}

.stuname:hover {
	color: #1E3269;
	background-color: aliceblue;
	cursor: pointer;
}

#selectlecture {
	height: 25px;
	text-align: center;
	margin-bottom: 20px;
}

.btn { /*버튼 조절*/
	background-color: #000069;
	border: 1px solid #000069;
	color: white;
	margin: 7px;
	width: 50px;
	line-height: 27px;
	border-radius: 5px;
}

#assignback:hover {
	background-color: white;
	color: #000069;
	cursor: pointer;
}

#paging { /* 페이지링크 감싸는 div */
	width: 300px;
	display: block;
	margin: auto;
}

.pagingconent { /* 이전 다음버튼 감싸는 div 버튼중앙 */
	width: 100px;
	display: block;
	margin: auto;
	text-align: center;
	float: left;
	font-size: 110%;
}

.searchbyname {
	text-align: center;
	height: 50px;
}

#search {
	text-align: center;
	width: 300px;
	margin: auto;
}

#search>input { /*  검색창*/
	height: 25px;
	border-radius: 5px;
	border: 1px solid #969696;
	text-align: center;
}

#searchbtn { /* 검색버튼 */
	background-color: #000069;
	border: 1px solid #000069;
	border-radius: 5px;
	color: white;
	width: 50px;
	line-height: 25px;
}
</style>
<script type="text/javascript">
	$(function() {
	});//ready
</script>
<title>BITCAMP JEJU: LMS영업-강좌배정</title>
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
					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2>수강생관리</h2>
				<h4>수강생정보</h4>
				<div id="assigntable">
					<!--  
 * 학생이름
 * 강좌이름
 * 교육기간
 * 학생 연락처
 * 이메일

-->
					<c:set value="${student }" var="bean"></c:set>
					<table>
						<tr>
							<th>이름</th>
							<td>${bean.name }</td>
						</tr>
						<tr>
							<th>과목</th>
							<td>${bean.lecture_name }</td>
						</tr>
						<tr>
							<th>강의실</th>
							<td>${bean.lecture_room }</td>
						</tr>
						<tr>
							<th>교육기간</th>
							<c:choose>
								<c:when test="${not empty bean.start_day}">
									<td>${bean.start_day }~ ${bean.end_day }</td>
								</c:when>
								<c:when test="${empty bean.start_day }">
									<td></td>
								</c:when>
							</c:choose>
						</tr>
						<c:set var="phoneNum" value="${bean.phone}" />
						<tr>
							<th>전화번호</th>
							<td>${fn:substring(phoneNum,0,3) }-${fn:substring(phoneNum,3,7) }-${fn:substring(phoneNum,7,11) }</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${bean.id_email }</td>
						</tr>

					</table>
				</div>
				<!-- assigntable end -->
			</div>
			<div class="lmscontent">
				<button id="assignback" class="btn" onclick="window.history.go(-1)">뒤로</button>
			</div>
		</div>
		<!-- lmscotent end -->
		<!--*************content end******************-->
		<%@ include file="template/footer.jspf"%>
</body>
</html>