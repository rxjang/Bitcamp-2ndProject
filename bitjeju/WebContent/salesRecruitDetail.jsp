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


var lecturename ="${lecture.lecture_name}";//el
var lecturenum ="${lecture.lecture_num}";
var recruitnum ="${lecture.recruit_num}";
var start_day = "${lecture.start_day}";
/* 2020-08-04 */
function parseDate(str) {
    var y = str.substr(0, 4);//년
    var m = str.substr(5, 2);//월
    var d = str.substr(8, 2);//일
    return new Date(y,m-1,d);//날짜타입으로 반환ㄴ
}
/* 	console.log(new Date());
	console.log(parseDate('2020-08-13'));
	console.log(new Date()>new Date('2020','07','30')); //false */
$(function(){
	$('#recruitadd').on('click',function(){//*************모집공고 등록 서블릿으로, 모집공고 이름과 모집공고 번호전달.
		/* 
		new Date() 오늘날짜// start_day 비교하기(현재문자열)
		*/
		if(new Date()<parseDate(start_day)){  //개강 날짜가 오늘보다 더 뒤의 날짜일 때만 모집공고 등록가능.
			location.href='lmssalesrecruitfile.bit?lecture_num='+lecturenum;
		}else{
			alert('개강날짜가 지났습니다.');
		}		
	}); 
	console.log(recruitnum);	
	$('#lecturetable td>a').on('click',function(){
		if(recruitnum==0){
			alert('모집공고가 없습니다.');
			return false;
		}
	});
	
});//ready

</script>
<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	border-bottom:1px solid #e4e4e4;
}
.lmscontent:last-child {
	border-bottom:0px solid #e4e4e4;
	margin-bottom:200px;
}
#lecturetable{
	border-collapse:collapse;
}
#lecturetable tr{
}
#lecturetable th{
	color:#1E3269;
	padding:30px;
	border-right:1px solid #e4e4e4;
	text-align:right;
}
#lecturetable td{
	padding:25px;
	text-align:left;
}
#lecturetable td>a{
	text-decoration:none;
	color:#000069;
	font-size:110%;
	
}
#lecturetable td>a:hover{
	font-weight:600;
	cursor: pointer;
	
}
#recruitadd,#recruitedit,#recruitdelete,#recruitback{ /* 아래쪽버튼들 */
	float:right;
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 50px;
    height: 30px;
    line-height:30px;
    border-radius: 5px;
}
#recruitadd:hover,#recruitback:hover{
		background-color:white;
		color:#000069;
		cursor: pointer;
}
.btns{
	padding-top:40px;
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
			<div class="lmscontent">
				<h2>모집공고</h2>
				<h4>강좌정보</h4>
<!-- 
private String lecture_name;
	private Date start_day, end_day;
	private int num, lecture_room,lecture_num;
	


 -->

					<c:set value="${lecture }" var="bean" />
				<table id="lecturetable">
					<tr>
						<th>강좌명</th>
						<td>${bean.lecture_name }</td>
					</tr>
					<tr>
						<th>강사명</th>
						<td>${bean.name }</td>
					</tr>
					<tr>
						<th>강의실</th>
						<td>${bean.lecture_room }</td>
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
						<th>모집공고</th><!-- recruit테이블에서 모집공고 정보 받아오기 -->
						<td><a href="lmssalesrecruitfiledetail.bit?recruit_num=${bean.recruit_num}">모집공고 바로가기</a></td>
					</tr>
					<tr>
						<th>모집상태</th><!-- recruit테이블에서 모집공고 정보 받아오기 -->
							<c:choose>
							<c:when test="${bean.recruit_num eq 0}">
							<td>&nbsp;</td>							
							</c:when>
							
							<c:when test="${bean.recruit_num ne 0}">
							<td>모집중</td>							
							</c:when>
							</c:choose>
					</tr>
				</table>


			</div>
			<div class="lmscontent btns">
			<button id="recruitback" type="button" onclick="gotolist()">뒤로</button>			
			<button id="recruitadd" type="submit">등록</button>			
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