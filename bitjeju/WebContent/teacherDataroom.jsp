<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf" %>
<script type="text/javascript">
var pageNum, cardinality, start, end, lang;
pageNum = "${pageNum}";
cardinality = "${totalList}";
function pages() {
	var pageLink = '';
	for (var i = start; i < end; i++) {//페이지 링크 번호 5개씩 생성.
		pageLink += '<span class="page_num"><a href="#">&nbsp;' + i
				+ '&nbsp;</a></span>';
		console.log(i);
	}
	console.log(start, 'start');
	$('<div id="page_num"/>').html(pageLink).appendTo('#pagenum');
	//페이지링크 문자열을 게시판 테이블 뒤에 삽입. 
}
$(function() {
	lang = 10; //한 페이지당 페이지 링크번호 수. 10개 
	var left = 0;
	var post = 5; //한페이지당 보이는 게시글 수 
	if (cardinality % post != 0) {//게시글 나누기 5의 나머지가 있는 경우 1페이지 추가
		left = 1;
	}
	/* 
	77개 /10 =7
	나머지 +1페이지
	*/
	var totalPage = (cardinality - cardinality % post) / post + left;
	console.log('totalpage', totalPage);
	start = 1 + parseInt((pageNum - 1) / lang) * lang;
	end = start + lang; //페이지 번호링크 끝	
	if (end > totalPage) {
		end = totalPage + 1;
	}
	pages();
	$('#page_num>span>a').css('color', 'black').css('text-decoration',
			'none').css('text-align', 'center');
	if (pageNum / 10 <= 1) {
		$('#prev').hide();//prev태그가 1~10페이지일때는 hide
	} else {
		$('#prev').show();
	}
	if (totalPage < end) {
		$('#next').hide();
	} else {
		$('#next').show();
	}
	$('#page_num>span>a').each(
			function(idx, ele) {
				$(this).on('click',function() {
					pageNum = parseInt($(this).text());
					var paramapage = 'pageNum=' + pageNum ;
					location.href = 'lmsteacherDataroom.bit?'
							+ paramapage;
					return false; //a태그 이동방지.
				});//click					
	});//each
	$('#prev').on('click',function() {
			start -= 10; //prev눌렀을때 이젠 페이지목록으로. 5칸 이동
			pageNum = start; //이전 페이지링크중 제일 앞 페이지번호로 게시판 이동
			//console.log(parseInt(pageNum), typeof pageNum, typeof start);
			var paramprev = 'pageNum=' + pageNum;
			location.href = 'lmsteacherDataroom.bit?' + paramprev;
	});
	$('#next').on('click',function() {
			console.log('넥스트');
			start += 10;
			pageNum = end;
			var paramnext = 'pageNum=' + pageNum;
			location.href = 'lmsteacherDataroom.bit?' + paramnext;
	});//click
	
	$('.page_num>a').each(function(){ //페이지링크 누르면 현재 페이지번호 색깔변함
		if($(this).text().trim()==pageNum){
			$(this).css('color','white');
			$(this).parent().css('background-color','#000069');
		}
	});
	
});//ready
</script>
<style rel="stylesheet" type="text/css">
	.lmscontent {
		width: 600px;
		height:500px;
		display: block;
		margin: auto;
	}
	.lmscontent:last-child {
	margin-bottom:150px;
	}
	#drtable{
		text-align:center;
		margin: 20px auto;
	}
	#drtable table{
		margin-top:50px;
		border-top:3px solid #000069;
		border-collapse: collapse;
	}
	#drtable th{
		width: 120px;
		color:#1E3269;
		padding:10px;
		border-bottom:1px solid #e4e4e4;
	}
	#drtable td{
		padding:15px;
	}
	#drtable tr:first-child~tr:hover{
		color: #1E3269;
		background-color: aliceblue;
	}
	#title{
		width:300px;
	}
	#title a{
		text-decoration: none;
		color: black;
	}
	#paging{
		border-top:1px solid #e4e4e4;
	}
	.page_num{
	margin-left:2px;
	width:10px;
	height:10px;
	border:1px solid #000069;
}
	#btn,#prev,#next{
		text-decoration: none;
		float: right;
		background-color: #000069;
		border: 1px solid #000069;
		color: white;
		width: 50px;
		line-height: 25px;
	}
	#btn{
		width:55px;
		border-radius:5px;
	}
	#btn:hover{
		border: 1px solid #000069;
		background-color: white;
		color: #000069;		
	}
</style>
<title>BITCAMP JEJU: LMS강사-자료실</title>
</head>
<body>
<%@ include file="template/lmsheader.jspf" %>
<%@ include file="template/menu.jspf" %>
   <div id="contents">
   <!--*****************lms메뉴******************-->
       <div class="grid2">
        <div id="lmsmenu">
             <p>강사<br><span id="lecname">${login.lecture }</span></p>
            <ul>
                <li class="bigletter">출결관리</li>
                <li>
                    <a href="lmsteacherattendance.bit">출석체크</a>    
                </li>
                <li>
                    <a href="lmsteacherattlist.bit">출석조회</a>    
                </li>
                <li class="bigletter">수강생관리</li>
                <li>
                    <a href="lmsteacherstulist.bit">수강생정보</a>    
                </li>
                <li>
                    <a href="lmsteacherstugrade.bit">성적관리</a>    
                </li>
                <li>
                    <a href="lmsteacherDataroom.bit" class="bigletter">자료실</a>    
                </li>
                <li></li>
            </ul>
        </div>
       </div>
        <!--*****************lms메뉴******************-->
       <div  id="content" class="grid6">&nbsp;
       <!--*************content start****************-->
       <div class="lmscontent">
       <h2>자료실</h2>
       <div id="drtable">
       	<table id="dr-table">
       		<tr>
       			<th>날짜</th>
       			<th>제목</th>
       			<th>작성자</th>
       		</tr>
       		<c:forEach items="${list }" var="list">
	       	<tr>
	       		<td>${list.drDate }</td>
	       		<td id="title"><a href="lmsteacherdrdetail.bit?drNum=${list.drNum}">${list.drTitle }</a></td>
	       		<td>${list.name }</td>
	       	</tr>
       		</c:forEach>
       	</table>
       		<div id=paging>
				<div>
					&nbsp;
					<button id="prev">이전</button>
				</div>
				<div id="pagenum"></div>
				<div>
					&nbsp;
					<button id="next">다음</button>
				</div>
			</div>
	       	<a href="lmsteacherdrwrite.bit" id="btn">글쓰기</a>
       </div>
       </div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>