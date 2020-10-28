<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf" %>
<title>BITCAMP JEJU: LMS수강생-자료실</title>
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
	var post = 5;
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
					location.href = 'lmsstudataroom.bit?'
							+ paramapage;
					return false; //a태그 이동방지.
				});//click					
	});//each
	$('#prev').on('click',function() {
			start -= 10; //prev눌렀을때 이젠 페이지목록으로. 5칸 이동
			pageNum = start; //이전 페이지링크중 제일 앞 페이지번호로 게시판 이동
			//console.log(parseInt(pageNum), typeof pageNum, typeof start);
			var paramprev = 'pageNum=' + pageNum;
			location.href = 'lmsstudataroom.bit?' + paramprev;
	});
	$('#next').on('click',function() {
			console.log('넥스트');
			start += 10;
			pageNum = end;
			var paramnext = 'pageNum=' + pageNum;
			location.href = 'lmsstudataroom.bit?' + paramnext;
	});//click
	
	
	$('.page_num>a').each(function(){ //페이지링크 누르면 현재 페이지번호 색깔변함
		if($(this).text().trim()==pageNum){
			$(this).css('color','white');
			$(this).parent().css('background-color','#000069');
		}
	});
});//click
</script>
<style rel="stylesheet" type="text/css">
	#content{
		height:700px;
	}
	.lmscontent {
		width: 600px;
		height:500px
		display: block;
		margin: auto;
	}
	.lmscontent:last-child {
	/* margin-bottom:300px; */
	}
	#drtable{
		text-align:center;
		margin: 20px auto;
		border-collapse:collapse;
	}
	#drtable table{
		margin:auto;
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
		border-bottom:1px solid #e4e4e4;
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
		/* border-top:1px solid #e4e4e4; */
	}
	.page_num{
	margin-left:2px;
	width:10px;
	height:10px;
	border:1px solid #000069;
}
</style>
</head>
<body>
<%@ include file="template/lmsheader.jspf" %>
<%@ include file="template/menu.jspf" %>
   <div id="contents">
   <!--*****************lms메뉴******************-->
       <div class="grid2">
        <div id="lmsmenu">
            <p>수강생<br><span id="lecname">${login.lecture }</span></p>
            <ul>
                <li class="bigletter">
                    <a href="lmsstugrade.bit">성적조회</a>    
                </li>
                <li class="bigletter">
                    <a href="lmsstuattendance.bit">출결조회</a>    
                </li>
                <li class="bigletter">
                    <a href="lmsstulecture.bit">수강정보</a>    
                </li>
                <li class="bigletter">
                    <a href="lmsstudataroom.bit" class="bigletter">자료실</a>    
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
       	<table>
       		<tr>
       			<th>날짜</th>
       			<th>제목</th>
       			<th>작성자</th>
       		</tr>
       		<c:forEach items="${list }" var="list">
	       	<tr>
	       		<td>${list.drDate }</td>
	       		<td id="title"><a href="lmsstudrdetail.bit?drNum=${list.drNum}">${list.drTitle }</a></td>
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
       </div>
       </div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>