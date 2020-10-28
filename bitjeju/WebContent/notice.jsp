
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
var loginLvl;
	$(function() {
		$('#noticeAdd').on('click', function() {
			location.href = "noticeadd.bit";
		});//click
		
		
		$('#noticeAdd').hide();//글쓰기버튼 숨김. 
		
		loginLvl="${login.lvl}";//행정직원 로그인 상태에서만 글쓰기버튼 보임.
		if(loginLvl==5){
			$('#noticeAdd').show();	
		}
		
/* 		setInterval(function(){
			loginLvl="${login.lvl}";
			if(loginLvl==5){
				$('#noticeAdd').show();	
			}else{
				$('#noticeAdd').hide();
			}
		}, 5000); //interval */
	});//ready
	
	//***************************↓페이지처리*******************************
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
		var post = 5; //한페이지에 보이는 게시글 수
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
						location.href = 'customercenter.bit?'
								+ paramapage;
						return false; //a태그 이동방지.
					});//click					
		});//each
		$('#prev').on('click',function() {
				start -= 10; //prev눌렀을때 이젠 페이지목록으로. 5칸 이동
				pageNum = start; //이전 페이지링크중 제일 앞 페이지번호로 게시판 이동
				//console.log(parseInt(pageNum), typeof pageNum, typeof start);
				var paramprev = 'pageNum=' + pageNum;
				location.href = 'customercenter.bit?' + paramprev;
		});
		$('#next').on('click',function() {
				console.log('넥스트');
				start += 10;
				pageNum = end;
				var paramnext = 'pageNum=' + pageNum;
				location.href = 'customercenter.bit?' + paramnext;
		});//click
		
		
		$('.page_num>a').each(function(){ //페이지링크 누르면 현재 페이지번호 색깔변함
			if($(this).text().trim()==pageNum){
				$(this).css('color','white');
				$(this).parent().css('background-color','#000069');
			}
		});
		
		
		
	});//ready
	
	
</script>
<style type="text/css">
#header .grid3 {
	margin-top: 40px;
	position: relative;
}

#content {
	height: 800px;
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

.write-btn {
	width: 700px;
	height: 40px;
	display: block;
	margin: auto;
}

#noticeAdd {
	float: right;
	background-color: #000069;
	border: 1px solid #000069;
	border-radius: 5px;
	color: white;
	margin: 7px;
	width: 70px;
	line-height: 30px;
	vertical-align: middle;
}

#noticeAdd:hover {
	background-color: white;
	color: #000069;
	cursor: pointer;
}

.notice-div {
	margin-top: 25px;
}

#notice-table {
	margin: auto;
	width: 700px;
	border-collapse: collapse;
	border-bottom: 1px solid #e4e4e4;
	border-top: 3px solid #000069;
	margin-bottom: 10px;
}

#notice-table a {
	color: black;
	text-decoration: none;
}

#notice-table a:hover {
	text-decoration: underline;
}

#notice-table tr {
	text-align: center;
}

#notice-table tr:first-child ~tr:hover { /* 테이블 첫번째 tr빼고 hover적용  */
	color: #1E3269;
	background-color: aliceblue;
	cursor: pointer;
}

#notice-table th {
	color: #1E3269;
	padding: 20px;
	border-bottom: 1px solid #e4e4e4;
}

#notice-table td {
	padding: 25px;
}
#paging{
	display: block;
	margin:auto;
	width:400px;
	text-align:center;
}
.page_num{
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
#search-div { /*검색창 감싸는 Div  */
	display: block;
	margin: auto;
	clear: both;
	width: 320px;
	margin-bottom: 300px;
}

#searchbtn {
	float: right;
	background-color: #000069;
	border: 1px solid #000069;
	border-radius: 5px;
	color: white;
	margin: 7px;
	width: 50px;
	line-height: 30px;
	vertical-align: middle;
}

#searchbtn:hover {
	background-color: white;
	color: #000069;
	cursor: pointer;
}

#search {
	
}

#search>select {
	vertical-align: middle;
	width: 100px;
	height: 33px;
	margin: 7px;
	border-radius: 5px;
	border: 1px solid #969696;
	font-size: 120%;
	text-align: center;
}

#search>input {
	width: 230px;
	height: 30px;
	margin: 7px;
	border-radius: 5px;
	border: 1px solid #969696;
	font-size: 90%;
	text-align: center;
	vertical-align: middle;
}
</style>
<title>BITCAMP JEJU: 공지사항</title>
</head>
<body>
	<%@ include file="template/header.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*****************고객센터 메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>고객센터</p>
				<ul>
					<li class="bigletter"><a href="customercenter.bit">공지사항</a></li>
					<li class="bigletter"><a href="faq.bit">FAQ</a></li>
					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************고객센터 메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div>
				<span class="title_bar">&nbsp;</span>
				<div class="title_letter">&nbsp;&nbsp;공지사항</div>
			</div>
			<div class="write-btn">
				<button id="noticeAdd">글쓰기</button>
			</div>
			<div class="notice-div">
				<table id="notice-table">
					<tr>
						<th>글번호</th>
						<th width="300px">제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach items="${notice }" var="bean">
						<!-- 공지사항 내용 불러오기 -->
						<tr>
							<td>${bean.ntnum }</td>
							<td><a href="noticedetail.bit?idx=${bean.ntnum }">${bean.title }</a></td>
							<c:choose>
								<c:when test="${empty bean.wtimeStamp }">
									<td>${bean.wtime }</td>
								</c:when>

								<c:when test="${not empty bean.wtimeStamp }">
									<td>${bean.wtimeStamp }</td>
								</c:when>
							</c:choose>
							<td>${bean.read_cnt}</td>
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
				<div id="search-div">
					<form id="search" action="customercenter.bit">
					 <input type="text" id="searchword" name="searchword" placeholder="제목으로 검색"/>
						<button type="submit" id="searchbtn">찾기</button>
					</form>
				</div>
			</div>
			<!--*************content end******************-->
		</div>
		<%@ include file="template/footer.jspf"%>
</body>
</html>