<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>BITCAMP JEJU: LMS영업-모집공고 삭제</title>


<script type="text/javascript">

var recruit_num = "${recruit.recruit_num }";

	$(function() {

		$('#recruitedit').on(
				'click',
				function() {//*************수정 서블릿으로
					location.href = 'lmssalesrecruitedit.bit?lecture_name='
							+ lecturename + '&lecture_num=' + lecturenum;
				});
		$('#recruitdelete').on(
				'click',
				function() {//****************삭제 서블릿으로
					location.href = 'lmssalesrecruitdelete.bit?recruit_num='+ recruit_num;
				});


	});//ready
</script>
<style type="text/css">
#content{
	height: 700px;
}
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	border-bottom: 1px solid #e4e4e4;
}

.lmscontent:last-child {
	border-bottom: 0px solid #e4e4e4;
	margin-bottom: 300px;
}

#recruittable {
	border-collapse: collapse;
}

#recruittable tr {
	
}

#recruittable th {
	color: #1E3269;
	padding: 10px;
	border-right: 1px solid #e4e4e4;
	text-align: right;
}

#recruittable td {
	padding: 25px;
	text-align: left;
	vertical-align:top;
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

#recruitadd, #recruitedit, #recruitdelete, #recruitback {
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
#recruitdelete:hover, #recruitback:hover {
		background-color:white;
		color:#000069;
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
.btns{
	padding-top:40px;
}
/* named upload */
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
					<li class="bigletter">수강생정보</li>
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
				<form action="lmssalesrecruitdelete.bit" method="post">
			<div class="lmscontent">
				<h2>모집공고</h2>
				<h4>모집공고 삭제</h4>
			
				<table id="recruittable">
					<tr>
						<th>모집공고</th>
						<td>삭제하시겠습니까?<input type="hidden" name="recruit_num" value="${recruit_num }"/></td>
					</tr>
				</table>


			</div>
			<div class="lmscontent btns">
				<button id="recruitback" type="button" onclick="window.history.go(-1)">뒤로</button>
				<button id="recruitdelete" type="submit">삭제</button>
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