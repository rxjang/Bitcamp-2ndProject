<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="template/lmshead.jspf" %>
<title>BITCAMP JEJU: LMS강사-출석조회</title>
<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
}
.lmscontent:last-child {
	margin-bottom:300px;
}
#searchbyname{
	width: 100px;
}
.btn{/*버튼 조절*/
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 50px;
    line-height: 23px;
    border-radius:5px;
    cursor:pointer;
}
.btn:hover{
    cursor:pointer;
	background-color:white;
	color:#000069;
}
#attendtable{
	text-align:center;
	margin: 20px auto;
	border-collapse:collapse;
}
#attendtable th{
	width: 200px;
	color:#1E3269;
	padding:10px;
	border-left:1px solid #e4e4e4;
	text-align:center;
}
#attendtable td{
	border-left:1px solid #e4e4e4;
	padding:25px;
	text-align:center;
}
#attendtable tr:first-child~tr:hover{/* 테이블 첫번째 tr빼고 hover적용  */
	color: #1E3269;
	background-color:aliceblue;
}
.apopup{
	text-decoration: none;
    color: black;
}
#spanpopup{/* 팝업창 나오게하는 폼데이터.  */
	display:none;
}
#paging{
		border-top:1px solid #e4e4e4;
}
.page_num{
	vertical-align:middle;
	margin-left:2px;
	width:10px;
	height:10px;
	border:1px solid #000069;
}
#prev,#next{
	text-decoration: none;
	float: right;
	background-color: #000069;
	border: 1px solid #000069;
	color: white;
	width: 50px;
	line-height: 25px;
}
.classStu{
	float:right;
}
</style>
<script type="text/javascript">
$(function(){
	$('.apopup').each(function(){
		var pnalja = $(this).text();//누른 날짜.
		var pnum = $(this).prev().text();
		$(this).on('click',function(){
			 $.ajax('lmsteacherattupdate.bit',{
				'method':'get',
				'data':'num='+pnum+'&nalja='+pnalja,
				'success':function(){
					var date= pnalja;
					var title="new window";
					var option = "width=600,height=500,top=200,left=400, toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no";
					window.open("lmsteacherattupdate.bit?num="+pnum+"&nalja="+pnalja,title,option);			  
					console.log('성공');
				} 		
			})//ajax
				return false;
		});//click
	});//each
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
	}//pages
	lang = 10; //한 페이지당 페이지 링크번호 수. 10개 
	var left = 0;
	if (cardinality % 10 != 0) {//게시글 나누기 5의 나머지가 있는 경우 1페이지 추가
		left = 1;
	}
	/* 
	77개 /10 =7
	나머지 +1페이지
	*/
	var totalPage = (cardinality - cardinality % 10) / 10 + left;
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
					location.href = 'lmsteacherattlist.bit?'
							+ paramapage;
					return false; //a태그 이동방지.
				});//click					
	});//each
	$('#prev').on('click',function() {
			start -= 10; //prev눌렀을때 이젠 페이지목록으로. 5칸 이동
			pageNum = start; //이전 페이지링크중 제일 앞 페이지번호로 게시판 이동
			//console.log(parseInt(pageNum), typeof pageNum, typeof start);
			var paramprev = 'pageNum=' + pageNum;
			location.href = 'lmsteacherattlist.bit?' + paramprev;
	});
	$('#next').on('click',function() {
			console.log('넥스트');
			start += 10;
			pageNum = end;
			var paramnext = 'pageNum=' + pageNum;
			location.href = 'lmsteacherattlist.bit?' + paramnext;
	});//click
	
	
	$('.page_num>a').each(function(){ //페이지링크 누르면 현재 페이지번호 색깔변함
		if($(this).text().trim()==pageNum){
			$(this).css('color','white');
			$(this).parent().css('background-color','#000069');
		}
	});
	
	
});
</script>
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
    <h2>출결관리</h2>
	<h4>출석조회</h4>
	<c:set value="${classStu }" var="classStu" />
	<form action="lmsteacherattsearchbydate.bit" method="post">
		<input type="date" class="date" name="nalja1"><span>~</span>
		<input type="date" class="date" name="nalja2">
		<button class="btn">조회</button>
		<span class="classStu">총인원: ${classStu }</span>
	</form>
	<form action="lmsteacherattsearchbyname.bit" method="post">
		<input type="text" id="searchbyname" name="name" placeholder="이름으로 검색">
		<button class="btn">조회</button>
	</form>
	<div id="attendtable">
		<table>
			<tr>
				<th>날짜</th>
				<th>학번</th>
				<th>이름</th>
				<th>상태</th>
			</tr>
			<c:forEach items="${list}" var="list">
			<tr >
				<td><span id="spanpopup">${list.num }</span><a class ="apopup" href="#">${list.nalja}</a></td>
				<td>${list.num }</td>
				<td>${list.name }</td>
				<td>${list.state }</td>
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