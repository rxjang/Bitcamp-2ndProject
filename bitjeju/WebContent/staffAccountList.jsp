<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>

<title>BITCAMP JEJU: LMS행정-회원정보</title>

<script type="text/javascript">
	var pageNum, key, word, cardinality, start, end, lang;
	pageNum = "${pageNum}";
	cardinality = "${totalMember}";

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

	key = "name";
	word = "";
	$(function() {
		lang = 5; //한 페이지당 페이지 링크번호 수. 5개 
		var left = 0;
		if (cardinality % 5 != 0) {//게시글 나누기 5의 나머지가 있는 경우 1페이지 추가
			left = 1;
		}
		var totalPage = (cardinality - cardinality % 5) / 5 + left;
		console.log('totalpage', totalPage);
		start = 1 + parseInt((pageNum - 1) / lang) * lang;
		end = start + lang; //페이지 번호링크 끝	
		if (end > totalPage) {
			end = totalPage + 1;
		}

		pages();
		$('#page_num>span>a').css('color', 'black').css('text-decoration',
				'none').css('text-align', 'center');

		if (pageNum / 5 <= 1) {
			$('#studentprev').hide();//prev태그가 1~10페이지일때는 hide
		} else {
			$('#studentprev').show();
		}
		if (totalPage < end) {
			$('#studentnext').hide();//next태그가 마지막페이지가 있는 곳에서는 hide
		} else {
			$('#studentnext').show();
		}

		$('#page_num>span>a').each(
				function(idx, ele) {
					$(this).on(
							'click',
							function() {//next나 prev아닌 숫자링크 클릭했을 때
								pageNum = parseInt($(this).text());
								var paramapage = 'pageNum=' + pageNum + '&key='
										+ key + '&word=' + word;
								location.href = 'lmsstaffaccountlist.bit?'
										+ paramapage;
								return false; //a태그 이동방지.
							});//click					
				});//each
		$('#studentprev').on(
				'click',
				function() {
					start -= 5; //prev눌렀을때 이젠 페이지목록으로. 5칸 이동
					pageNum = start; //이전 페이지링크중 제일 앞 페이지번호로 게시판 이동
					//console.log(parseInt(pageNum), typeof pageNum, typeof start);
					var paramprev = 'pageNum=' + pageNum + '&key=' + key
							+ '&word=' + word;
					location.href = 'lmsstaffaccountlist.bit?' + paramprev;
				});
		$('#studentnext').on(
				'click',
				function() {
					console.log('넥스트');
					start += 5;
					pageNum = end;
					var paramnext = 'pageNum=' + pageNum + '&key=' + key
							+ '&word=' + word;
					location.href = 'lmsstaffaccountlist.bit?' + paramnext;
				});//click

		$('#accountadd').on('click', function() {
			location.href = 'lmsstaffaccountadd.bit';
		});//click

		$('#search').submit(
				function() {
					word = $('#searchword').val();
					key = $('#searchkey').val();
					var paramsearch = 'pageNum=' + pageNum + '&key=' + key
							+ '&word=' + word;
					location.href = 'lmsstaffaccountlist.bit?' + paramsearch;
					return false;
		});//submit

		
		$('.page_num>a').each(function(){ //페이지링크 누르면 현재 페이지번호 색깔변함
			if($(this).text().trim()==pageNum){
				$(this).css('color','white');
				$(this).parent().css('background-color','#000069');
			}
		});
		
		
		$('#searchkey option').each(function(){
			var space = '&nbsp;&nbsp;&nbsp;&nbsp;';
			$(this).html(space+$(this).text());
		});//each
	});//ready
</script>
<style type="text/css">
.lmscontent { /* 제목과 테이블을 전부 감싸는 div */
	width: 600px;
	
	display: block;
	margin: auto;
}
.firstc-lmsctnt{

}

#formdiv { /*검색창 감싸는 Div  */
	display: block;
	margin: auto;
	clear: both;
	width: 440px;
	margin-bottom:150px;
}

#accounttable {
	margin: auto;
	width: 600px;
	border-collapse: collapse;
	border-bottom: 1px solid #e4e4e4;
	border-top: 1px solid #e4e4e4;
	margin-bottom: 10px;
}

#accounttable tr {
	text-align: center;
}

#accounttable tr:first-child ~tr:hover { /* 테이블 첫번째 tr빼고 hover적용  */
	color: #1E3269;
	background-color: aliceblue;
}

#accounttable th {
	color: #1E3269;
	padding: 30px;
	border-bottom: 1px solid #e4e4e4;
}

#accounttable td {
	padding: 25px;
}

#accounttable a {
	display: block;
	text-decoration: none;
	color: black;
	text-decoration: none;
}

#accounttable a:hover {
	font-weight: 500;
	color: #1E3269;
}

#accountadd { /* 등록버튼 */
	float: right;
	background-color: #000069;
	border: 1px solid #000069;
	color: white;
	margin: 7px;
	width: 50px;
	height: 30px;
	line-height:30px;
	border-radius: 5px;
}
#accountadd:hover { /* 등록버튼 */
		background-color:white;
		color:#000069;
		cursor: pointer;
}
#paging {
	width: 300px;
	height:40px;
	display: block;
	overflow:hidden;
	margin:auto;
	margin-bottom:20px;
	
}
#paging>.lmscontent { /* 이전 다음버튼 감싸는 div 버튼중앙 */
	width: 100px;
	font-size: 110%;
	
	
}

#paging .lmscontent { /* 이전 다음버튼 감싸는 div 버튼중앙 */
	font-size: 110%;
	width: 100px;

	display: block;
	margin: auto;
	text-align:center;
	float:left;
}

.page_num{
	vertical-align:middle;
	margin-left:2px;
	width:10px;
	height:10px;
	border:1px solid #000069;
}
#studentprev{
	background-color: #000069;
	border: 1px solid #000069;
	color: white;
	margin: 7px;
	width: 50px;
	height: 20px;
	line-height:20px;
	cursor: pointer;
} 
#studentnext { /*이전 다음 버튼  */
	background-color: #000069;
	border: 1px solid #000069;
	color: white;
	margin: 7px;
	width: 50px;
	height: 20px;
	float:right;
	line-height:20px;
	cursor: pointer;
}


#searchbtn {
	float: right;
	background-color: #000069;
	border: 1px solid #000069;
	border-radius: 5px;
	color: white;
	margin: 8px;
	width: 50px;
	line-height:28px;
	vertical-align: middle;
	
}
#searchbtn:hover{
		background-color:white;
		color:#000069;
		cursor: pointer;
}
#search {
	
}

#search>select {
	width: 100px;
	height: 33px;
	
	margin: 7px;
	border-radius: 5px;
	border: 1px solid #969696;
	font-size: 120%;
	text-align: center;
	vertical-align: middle;
}

#search>input {
	vertical-align: middle;
	width: 230px;
	height: 30px;
	margin: 7px;
	border-radius: 5px;
	border: 1px solid #969696;
	font-size: 120%;
	text-align: center;
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
				<p>행정</p>
				<ul>
					<li class="bigletter">계정관리</li>
					<li><a href="lmsstaffaccountlist.bit">회원정보</a></li>
					<li class="bigletter">강의관리</li>
					<li><a href="lmsstafflectureadd.bit">강좌개설</a></li>
					<li><a href="lmsstafflecturelist.bit">강좌정보</a></li>
					<li class="bigletter">수강생관리</li>
					<li><a href="lmsstaffstudentlist.bit">수강생정보</a></li>
					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent firstc-lmsctnt">
				<h2>계정관리</h2>
				<h4>회원정보</h4>
				<div class="lmscontentadd">
					<button id="accountadd">등록</button>
				</div>

				<table id="accounttable">
					<tr>
						<th>회원번호</th>
						<th>이름</th>
						<th>구분</th>
					</tr>
					<c:forEach items="${list }" begin="0" end="5" var="bean">
						<tr>

							<td>${bean.num }</td>
							<td><a href="lmsstaffaccountdetail.bit?num=${bean.num}">${bean.name }</a></td>
							<td>${bean.dept }</td>

						</tr>
					</c:forEach>

				</table>
			</div>
			<div id=paging>
				<div class="lmscontent">
					&nbsp;
					<button id="studentprev">이전</button>
				</div>
				<div id="pagenum" class="lmscontent"></div>
				<div class="lmscontent">
					&nbsp;
					<button id="studentnext">다음</button>
				</div>
			</div>
			
			
			<div id="formdiv">

				<form id="search" action="#">
					<select id="searchkey">
						<option value="name" selected="selected">이름</option>
						<option value="lvl">구분</option>
					</select> <input type="text" id="searchword" name="searchword" />
					<button type="submit" id="searchbtn">찾기</button>
				</form>
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