<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf" %>
<style rel="stylesheet" type="text/css">
	#header .grid3 {
		margin-top: 40px;
		position: relative;
	}

	.lmscontent {
		width: 600px;
		display: block;
		margin: auto;
	}
	.lmscontent:last-child {
		margin-bottom:150px;
	}
	#drtable{
		margin: 20px auto;
		margin-top:40px;
		border-collapse:collapse;
		border-top:3px solid #000069;
	}
	#drtable tr{
	}
	#drtable th{
		height: 30px;
		text-align:center;
		width: 130px;
		color:#1E3269;
		padding:10px;
		border-right:1px solid #e4e4e4;
		border-bottom:1px solid #e4e4e4;
	}
	.line{
		border-right:1px solid #e4e4e4;
		width: 130px;
	}
	#drtable td{
		border-bottom:1px solid #e4e4e4;
		padding:15px;
	}
	#text{
		width:585px;
		height:350px;
		vertical-align:top;
	}
	.filename{
		color:black;
		text-decoration: none;
	}
	.filename:hover{
		text-decoration-line: underline
	}
	.btn,.btn2{
		text-align:center;
		text-decoration: none;
		background-color: #000069;
		border: 1px solid #000069;
		border-radius:5px;
		color: white;
		width: 45px;
		margin: 5px;
		margin-top:30px;
		line-height: 25px;
		float:right;
	}
	.btn:hover,.btn2:hover{
		border: 1px solid #000069;
		background-color: white;
		color: #000069;		
	}
</style>
<script type="text/javascript">
var loginLvl;
$(function(){
	$('.apopup').each(function(){
		var ntnum = "${bean.ntnum}";
		 console.log(ntnum);
		$(this).on('click',function(){
			 $.ajax('noticedelete.bit',{
				'method':'get',
				'data':'ntnum='+ntnum,
				'success':function(){
					var title="new window";
					var option = "width=400,height=300,top=300,left=500, toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no";
					window.open("noticedelete.bit?ntnum="+ntnum,title,option);			  
					console.log('성공');
				} 		
			})//ajax
				return false;
		});//click
	});//each
	
	loginLvl="${login.lvl}";//행정직원 로그인 상태에서만 수정삭제 보임.
	$('.btn').each(function(){
		if(loginLvl==5){
			$(this).show();
		}else{
			$(this).hide();
		}
	});//each
	
	
});//ready
</script>
<title>BITCAMP JEJU: 공지사항</title>
</head>
<body>
<%@ include file="template/header.jspf" %>
<%@ include file="template/menu.jspf" %>
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
       <div  id="content" class="grid6">&nbsp;
       <!--*************content start****************-->
       <div class="lmscontent">
       <h2>공지사항</h2>
	       <div>
	       	<table id="drtable">
	       	<c:set value="${bean }" var="bean" />
	       		<tr>
	       			<th>제목</th>
	       			<td colspan="3">${bean.title }</td>
	       		</tr>

	       		<tr>
					<th>작성일</th>
					<c:choose>
						<c:when test="${empty bean.wtimeStamp }">
							<td colspan="3">${bean.wtime }</td>
						</c:when>

						<c:when test="${not empty bean.wtimeStamp }">
							<td colspan="3">${bean.wtimeStamp }</td>
						</c:when>
					</c:choose>
				</tr>
	       		<tr>
	       			<th>작성자</th>
	       			<td class="line">관리자</td>
	       			<th>조회수</th>
	       			<td>${bean.read_cnt }</td>
	       		</tr>
	       		<tr>
	       			<td colspan="4" id="text">${bean.content }</td>
	       		</tr>
	       		<tr>
	       			<th>첨부파일</th>
	       			<td colspan="3"><a href="noticedown.bit?fileName=${bean.filename }" class="filename">${bean.filename }</a></td>
	       		</tr>
	       	</table>
		       	<a href="customercenter.bit" class="btn2">뒤로</a>
		       	<a class ="apopup btn" href="#">삭제</a>
		       	<a href="noticeedit.bit?idx=${bean.ntnum }" class="btn">수정</a>
	       </div>
       </div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>