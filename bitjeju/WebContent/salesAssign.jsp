<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf" %>
<style rel="stylesheet" type="text/css">
	.lmscontent {
		width: 600px;
		display: block;
		margin: auto;
	}
	.lmscontent:last-child {
		margin-bottom:300px;
	}
	#lecturebtn{
		display:none;
	}
	#assigntable{
		text-align:center;
		margin: 20px auto;
		border-collapse:collapse;
		border-bottom:1px solid #e4e4e4;
	}
	#assigntable th{
		width: 90px;
		color:#1E3269;
		padding:10px;
		border-bottom:1px solid #e4e4e4;
	}
	#assigntable td{
		padding:15px;
	}
	.lecturename{
		width: 200px;
	}
	.startday{
		width: 100px;
	}
	#assigntable a{
		text-decoration:none;
		color:black;
	}
	.stuname:hover{
		color: #1E3269;
		background-color: aliceblue;
	}
	#selectlecture{
		height:25px;
		text-align:center;
		margin-bottom: 20px;
	}
	.btn{/*버튼 조절*/
	    background-color: #000069;
	    border:1px solid #000069;
	    color:white;
	    margin: 7px;
	    width: 50px;
	    line-height: 25px;
	    border-radius: 5px;
	}
	.btn:hover{
		background-color:white;
		color:#000069;	
		cursor: pointer;
	}
	#studentprev, #studentnext { /* 테이블 아래 이전,다음버튼 */
		background-color: #000069;
		border: 1px solid #000069;
		color: white;
		margin: 7px;
		width: 50px;
		height: 20px;
	}
	#studentprev:hover, #studentnext:hover { /* 테이블 아래 이전,다음버튼 */
		background-color:white;
		color:#000069;
		cursor: pointer;
	}
	#paging{		/* 페이지링크 감싸는 div */
		width:300px;
		display:block;
		margin:auto;
	}
	.pagingconent { /* 이전 다음버튼 감싸는 div 버튼중앙 */
		width: 100px;
		display: block;
		margin: auto;
		text-align:center;
		float:left;
		font-size: 110%;
	}
	.searchbyname{
		text-align:center;
		height: 50px;
	}
	#search{
		text-align: center;
		width: 300px;
		margin: auto;
	}
	#search>input{	/*  검색창*/
	    height: 25px;
	    border-radius: 5px;
	    border: 1px solid #969696;
	    text-align:center;
	}
	#searchbtn{ /* 검색버튼 */
		background-color: #000069;
		border: 1px solid #000069;
		border-radius:5px;
		color: white;
		width: 50px;
		line-height: 25px;
	} 
	#searchbtn:hover{ /* 검색버튼 */
	background-color:white;
	color:#000069;
	cursor: pointer;
	}
</style>
<script type="text/javascript">
var pageNum, word, cardinality, start, end, lang;

pageNum="${pageNum}";
cardinality="${cardinality}";

function pages(){	
	var pageLink='';
	for(var i=start; i<end; i++){//페이지 링크 번호 5개씩 생성.
			pageLink+='<span class="page_num"><a href="#">&nbsp;'+i+'&nbsp;</a></span>';
			console.log(i);
		}
			console.log(start,'start');
	$('<div id="page_num"/>').html(pageLink).appendTo('#pagenum');
	//페이지링크 문자열을 게시판 테이블 뒤에 삽입. 
}
function selectLecture(){
	document.getElementById("lecturebtn").click();
}//과목 선택시 버튼을 자동으로 눌러 post방식으로 페이지 이동
word = ""; //초기값. 페이지 처음 왔을 때 기준.
$(function(){
	
	lang = 5; //한 페이지당 페이지 링크번호 수. 5개 
	var left = 0;
	if (cardinality % 5 != 0) {//게시글 나누기 5의 나머지가 있는 경우 1페이지 추가
		left = 1;
	}
	var totalPage = (cardinality - cardinality % 5) / 5 + left;
	console.log('totalpage',totalPage);
	start = 1 + parseInt((pageNum - 1) / lang) * lang;
	end = start + lang; //페이지 번호링크 끝	
	if (end > totalPage){
		end = totalPage + 1;
	}
	var stu="수강생"
	$('.lvl').each(function(){
		if($(this).text()==stu){
			$(this).next().hide();
		}
	});//레벨 2이상인 사람의 버튼 숨기기
	
	pages();
	$('#page_num>span>a').css('color','black').css('text-decoration','none').css('text-align','center');
	
	if(pageNum/5<=1){
		$('#studentprev').hide();//prev태그가 1~10페이지일때는 hide
		}else{
		$('#studentprev').show();
	}
	if(totalPage<end){
		$('#studentnext').hide();//next태그가 마지막페이지가 있는 곳에서는 hide
		}else{
		$('#studentnext').show();
	}
	
	$('#page_num>span>a').each(function(idx, ele){
		$(this).on('click',function(){//next나 prev아닌 숫자링크 클릭했을 때
			pageNum=parseInt($(this).text());
			var paramapage = 'pageNum='+pageNum+'&word='+word;
			location.href='lmssalesassign.bit?'+paramapage;
			return false; //a태그 이동방지.
		});//click					
	});//each
	$('#studentprev').on('click',function(){
		start-=5;						//prev눌렀을때 이젠 페이지목록으로. 5칸 이동
		pageNum=start;				//이전 페이지링크중 제일 앞 페이지번호로 게시판 이동
		//console.log(parseInt(pageNum), typeof pageNum, typeof start);
		var paramprev = 'pageNum='+pageNum+'&word='+word;
		location.href='lmssalesassign.bit?'+paramprev;
	});
	$('#studentnext').on('click',function(){
		console.log('넥스트');
		start+=5;		
		pageNum=end;				
		var paramnext = 'pageNum='+pageNum+'&word='+word;
		location.href='lmssalesassign.bit?'+paramnext;
	});//다음 버튼 클릭
	
	
	$('#search').submit(function(){ //검색버튼
		word=$('#searchword').val();
		var paramsearch = 'pageNum='+pageNum+'&word='+word;
		location.href='lmssalesassign.bit?'+paramsearch;
		return false;
	});//submit
});//ready
</script>
<title>BITCAMP JEJU: LMS영업-강좌배정</title>
</head>
<body>
<%@ include file="template/lmsheader.jspf" %>
<%@ include file="template/menu.jspf" %>
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
                <li></li>
            </ul>
        </div>
       </div>
        <!--*****************lms메뉴******************-->
       <div  id="content" class="grid6">&nbsp;
       <!--*************content start****************-->
       <div class="lmscontent">
       <h2>수강생관리</h2>
       <h4>강좌배정</h4>
	       <div id="assigntable">
	       		<form method="post" action="lmssalesassign.bit">
		      	 	<select name="lecturelist" onchange="selectLecture()" id="selectlecture">
		       		<option value="#">--과목명을 선택해 주세요--</option>
		       		<c:forEach items="${lecturelist}" var="lecture">
		       		<option value="${lecture.lecture_num }">${lecture.lecture_name }</option>
		       		</c:forEach>
		       		</select>
		       		<button id="lecturebtn">선택</button>
	       		</form>
	       	<table>
	       		<tr>
	       			<th>이름</th>
	       			<th>과목</th>
	       			<th>개강일</th>
	       			<th>등급</th>
	       			<th>&nbsp;</th>
	       		</tr>
	       		<c:forEach items="${list }" var="list">
	       		<form method="post" action="lmssalesassignupdate.bit">
		       		<tr>
		       			<td class="stuname"><a href="lmssalesassignstudetail.bit?num=${list.num}">${list.name}</a>
		       				<input type="hidden" value="${list.num}" name="num"/>
		       			</td>
		       			<td class="lecturename">${list.lecture_name}</td>
		       			<td class="startday">${list.start_day}</td>
		       			<c:choose>
		       			<c:when test ="${list.lvl eq 0}">
		      	 			<td class="lvl">일반회원</td>
		       			</c:when>
		       			<c:when test ="${list.lvl eq 1}">
		      	 			<td class="lvl">수료생</td>
		       			</c:when>
		       			<c:when test ="${list.lvl eq 2}">
		      	 			<td class="lvl">수강생</td>
		       			</c:when>
		       			</c:choose>
		       			<td><button class="btn" type="submit">확정</button></td>
		       		</tr>
	       		</form>
	       		</c:forEach>
	       	</table>
	       </div><!-- assigntable end -->
	       <div id=paging>			
					<div class="pagingconent">&nbsp;
						<button id="studentprev">이전</button>			
					</div><!-- pagingconent end -->
					<div id="pagenum" class="lmscontent"></div>
					<div class="pagingconent">&nbsp;
						<button id="studentnext">다음</button>
					</div><!-- pagingconent end -->
			</div><!-- paging end -->
			<form id="search" action="lmssalesassign.bit">	
				<input type="text" id="searchword" name="searchword" placeholder="이름으로 검색" />
				<button type="submit" id="searchbtn">찾기</button>
			</form>
       </div><!-- lmscotent end -->
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>