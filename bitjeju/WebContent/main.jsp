<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<%@ include file="template/head.jspf"%>
<title>BITCAMP JEJU</title>

<script type="text/javascript">
var cnt = 1;
function carousel(){		/* 캐러셀 */
	
	$('#carouselImg').fadeOut(1000,function(){
		if(cnt==5)cnt=1;	
		$('#carouselImg').fadeIn(1000).attr('src','img/'+cnt+'.jpg');
	});
	cnt++;	
	setTimeout(carousel, 4500);
}

function curriDetail(idx){									/* 강좌div클릭 시 idx받아서 해당강좌 정보로 이동.  */
	location.href='curriculumdetail.bit?idx='+idx;		
}

$(function(){
	carousel();
	
	
	//.lecture-name:hover{
//	text-decoration-line:underline;

	
	$('.thumbnail').each(function(idx, ele){
		$(this).on('mouseenter',function(){
			$(this).find('.lecture-name').css('text-decoration-line','underline');		
		});//enter
		$(this).on('mouseleave',function(){
			$(this).find('.lecture-name').css('text-decoration-line','none');		
		});//leave
	});//each
});//ready


</script>

<style type="text/css">

#curriculum-main{
	width:750px;
	float:left;
	margin-left:150px;
	
}
#tile-div{
	margin-top:20px;
	margin-bottom:30px;
}
.title_letter{
	color: rgb(51, 51, 51);
	font-size: 18px;
	font-weight: 500;
	display: inline;
	vertical-align: middle;
}
.col-xs-4{ /*강좌들 전체  */
	width:240px;
	height:380px;
	float:left;
	display:block;
	margin:auto;
	overflow:hidden;
}
.thumbnail{/* 강좌 전체 */
	width:215px;
	height:340px;
	border: 1px solid rgb(221, 221, 221);
	border-radius: 5px;
	transition-duration: 600ms;
	display:block;
	margin:auto;
	margin-top:3px;
}
.thumbnail:hover{		/* 강좌 테두리 반짝 */
	transition-duration: 600ms;
	border: 1px solid rgb(255, 170, 0);
	box-shadow:rgb(255, 204, 102) 0px 0px 6px;
	cursor:pointer;
}


#thumbnail-img{
	width:200px;
	height: 200px;
}

.text-left,.caption{
	padding-left:10px;
}
.text-left>table{/* 교육기간 */
}
.text-left>table{/* 교육기간 */
}
.text-left>table th{/* 교육기간 */
	color:rgb(51, 51, 51);
	font-size:90%;
	font-weight:bold;
	padding-right: 5px;
	text-align:left;
}
.text-left>table td{/* 교육기간 */
	font-size:87%;
}
#orange-date{/* 교육기간 */
	font-weight:bold;
	color:#fe6625;
}

.orange{
	padding-left: 5px;
}
.thumbnail>img{ /* 강좌 이미지 */
	display:block;
	margin:auto;	
}
.thumbnail > .caption > h3 { /* 이미지아래 강좌이름 */
	color:#191919;
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

.box-tag-normal{

}

.box-tag {				/* 제주센터 */
	font-weight:400;
    position: absolute;
    margin-left:8px;
    font-size: 85%;
    height: 23px;
    line-height:23px;
    text-align: center;
    width: 75px;
    background-color: black;
    color:white;
}


</style>
</head>
<body>
	<%@ include file="template/header.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="carousel" class="gird12">
		<img id="carouselImg" src="img/forc.jpg">
	</div>
	<!--carousel-->
	<div id="contents">


		<div class="grid2">&nbsp;</div>
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
	
		<div id="curriculum-main">
	
			<div id="tile-div">
				<div class="title_letter">&nbsp;&nbsp;<strong>모집중</strong> 교육과정</div>
			</div>
			<div id="lecturecontent">
				<!-- ***********col-xs-4를 foreach로 db에서 모집공고 받아와서 반복.**************** -->

				<c:forEach items="${lecture}" var="bean">
					<c:set value="${bean.recruit_num }" var="idx"></c:set>
					<div class="col-xs-4">
					
					
						<div class="thumbnail" onclick="curriDetail(${idx})">
						
						
							<div class="box-tag box-tag-normal">제주센터</div>
							
							
							<img id="thumbnail-img" src="recruit/${bean.thumbnail }">
							<!-- 강좌이미지 모집공고이미지 -->
							
							
							<div class="caption">
								<h3><span class="lecture-name">${bean.recruit_name }</span></h3>
							</div>
							
							
							
							<div class="text-left price-bar">
							<table id="edu-duration">
							<tr>
								<th>개강일</th>
								<td>&#124;&nbsp;&nbsp;<span id="orange-date">${bean.start_day }</span></td>							
							</tr>
							<tr>
								<th>교육기간</th>
								<td>&#124;&nbsp;</td>							
							</tr>
							<tr>
								<td colspan="2">${bean.start_day}~${bean.end_day }</td>							
							</tr>
							
							</table>
							
								<%-- <small>개강일</small>&#124;<span class="orange">${bean.start_day }</span><br />
								<small>교육기간</small>&#124;<br>${bean.start_day}~${bean.end_day } --%>
							</div>
						</div>
					</div>

				</c:forEach>
				</div>
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