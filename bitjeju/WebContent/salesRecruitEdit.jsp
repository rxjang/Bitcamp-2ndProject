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
	function gotolist(){
		location.href="lmssalesrecruitlist.bit";
	}

	$(function() {

		$('#recruitedit').on('click',function(){// 모집공고 파일 수정 서블릿으로 이동.
				/*location.href='lmssalesrecruitfiledit';  */
		});


		var fileTarget = $('#recruitfile');
		fileTarget.on('change', function() { // 값이 변경되면
			var cur = $("#recruitfile").val();
			$(".upload-name").val(cur);
		});
		var thumbnail = $('#thumbnail');
		thumbnail.on('change', function() { // 값이 변경되면
			var cur = $("#thumbnail").val();
			$(".thumbnail-name").val(cur);
		});

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

#recruittable {
	border-collapse: collapse;
}

#recruittable tr {
	
}

#recruittable th {
	color: #1E3269;
	padding: 30px;
	border-right: 1px solid #e4e4e4;
	text-align: right;
}

#recruittable td {
	padding: 25px;
	text-align: left;
}


#recruit_name, .upload-name, .thumbnail-name { /* form input */
	width: 300px;
	height: 20px;
	margin: 7px;
	border-radius: 5px;
	border: 1px solid #969696;
	font-size: 90%;
	text-align: center;
	vertical-align: middle;
}

#recruitedit, #recruitedit, #recruitdelete, #recruitback {
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
#recruitedit:hover, #recruitedit:hover, #recruitdelete:hover, #recruitback:hover {
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

#recruittable label:hover {
	background-color:#000069;
	color:white;
	cursor: pointer;
}
#recruittable label {
	line-height:4px;
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
				<form action="lmssalesrecruitedit.bit" method="post" enctype="multipart/form-data">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2>모집공고</h2>
				<h4>모집공고 수정</h4>

				<c:set value="${lecture }" var="bean" />
				<table id="recruittable">
					<tr>
						<th>강좌명</th>
						<td id="lecture_td">&nbsp;&nbsp;${bean.lecture_name }
						<input type="hidden" name="lecture_name" id="lecture_name" value="${bean.lecture_name }"/></td>
					</tr>
					<tr>
						<th>썸네일</th>
						<td><input class="thumbnail-name" value="" placeholder="파일선택" />
							<label for="thumbnail">업로드</label> <input type="file"
							id="thumbnail" name = "thumbnail"/></td>
					</tr>
					<tr>
						<th>모집공고</th>
						<td><input class="upload-name" value="" placeholder="파일선택" />
							<label for="recruitfile">업로드</label> 
							<input type="file" id="recruitfile" name = "recruitfile"/></td>
					</tr>

					<tr>
						<th></th>
						<td></td>
					</tr>
				</table>
				


			</div>
			<div class="lmscontent btns">
				<button id="recruitback" type="button" onclick="gotolist()">뒤로</button>
				<button id="recruitedit" type="submit">수정</button>
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