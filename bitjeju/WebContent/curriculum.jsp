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

function curriDetail(idx){
	location.href='curriculumdetail.bit?idx='+idx;
}

$(function(){
	
	$('.thumbnail').each(function(idx, ele){
		$(this).on('mouseenter',function(){
			$(this).find('.lecture-name').css('text-decoration-line','underline');		
		});//enter
		$(this).on('mouseleave',function(){
			$(this).find('.lecture-name').css('text-decoration-line','none');		
		});//leave
	});//each
    
});

</script>
<style type="text/css">
#header .grid3 {
	margin-top: 40px;
	position: relative;
}

#lecturecontent {
	display: block;
	margin: auto;
	margin-top: 40px;
	width: 750px;
}

.title_bar { /* 국비지원 */
	background-color: darkblue;
	width: 4px;
	height: 19px;
	display: inline-block;
	margin-left: 60px;
	vertical-align: middle;
}

.title_letter {
	color: darkblue;
	font-size: 18px;
	font-weight: 600;
	display: inline;
	vertical-align: middle;
}

.col-xs-4 { /*강좌들 전체  */
	width: 235px;
	height: 380px;
	float: left;
	display: block;
	margin: auto;
	overflow: hidden;
}

.thumbnail { /* 강좌 전체 */
	width: 215px;
	height: 340px;
	border: 1px solid rgb(221, 221, 221);
	border-radius: 5px;
	transition-duration: 600ms;
	display: block;
	margin: auto;
	margin-top: 3px;
}

.thumbnail:hover { /* 강좌 테두리 반짝 */
	transition-duration: 600ms;
	border: 1px solid rgb(255, 170, 0);
	box-shadow: rgb(255, 204, 102) 0px 0px 6px;
	cursor: pointer;
}

#thumbnail-img{
	width:200px;
	height: 200px;
}
.text-left, .caption {
	padding-left: 10px;
}

.text-left>small { /* 교육기간 */
	color: #191919;
	font-weight: bold;
	padding-right: 5px;
}

.orange {
	padding-left: 5px;
}

.thumbnail>img { /* 강좌 이미지 */
	display: block;
	margin: auto;
}

.thumbnail>.caption>h3 { /* 이미지아래 강좌이름 */
	color: #191919;
	font-size: 15px;
	font-weight: 900;
	margin-top: 3px;
	margin-bottom: 3px;
	line-height: 1.4;
	text-overflow: ellipsis;
	overflow: hidden;
	width: 183px;
	height: 38px;
}

.box-tag-normal {
	
}

.box-tag { /* 제주센터 */
	font-weight: bold;
	position: absolute;
	margin-left: 8px;
	font-size: 15px;
	height: 23px;
	text-align: center;
	width: 75px;
	background-color: black;
	color: white;
}

#content {
	height: 1100px;
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
			<div>
				<span class="title_bar">&nbsp;</span>
				<div class="title_letter">&nbsp;&nbsp;국비지원 교육</div>
			</div>
			<div id="lecturecontent">
				<!-- ***********col-xs-4를 foreach로 db에서 모집공고 받아와서 반복.**************** -->

				<c:forEach items="${lecture}" var="bean">
					<c:set value="${bean.recruit_num }" var="idx"></c:set>
					<div class="col-xs-4">
						<div class="thumbnail" onclick="curriDetail(${idx})">
							<div class="box-tag box-tag-normal">제주센터</div>
							<img id="thumbnail-img" src="recruit/${bean.thumbnail }"><!-- **********썸네일이미지********* -->
							<!-- 강좌이미지 모집공고이미지 -->
							<div class="caption">
								<h3>
									<span class="lecture-name">${bean.recruit_name }</span>
								</h3>
							</div>
							<div class="text-left price-bar">
								<small>개강일</small>&#124;<span class="orange">${bean.start_day }</span><br />
								<small>교육기간</small>&#124;<br>${bean.start_day}~${bean.end_day }
							</div>
						</div>
					</div>

				</c:forEach>



				<!-- ***********col-xs-4를 foreach로 db에서 모집공고 받아와서 반복.**************** -->

			</div>
			<!-- lecture content -->
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