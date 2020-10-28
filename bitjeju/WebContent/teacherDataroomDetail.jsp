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
		margin-bottom:150px;
	}
	#drtable{
		margin: 20px auto;
		border-collapse:collapse;
	}
	#drtable table{
		border-top:3px solid #000069;		
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
	#text{
		height:300px;
		vertical-align:top;
	}
	.line{
		border-right:1px solid #e4e4e4;
		width: 130px;
	}
	#drtable td{
		border-bottom:1px solid #e4e4e4;
		padding:15px;
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
		color: white;
		width: 45px;
		margin: 5px;
		margin-top:30px;
		line-height: 25px;
		border-radius:5px;
		float:right;
	}
	.btn:hover,.btn2:hover{
		border: 1px solid #000069;
		background-color: white;
		color: #000069;		
	}
</style>
<script type="text/javascript">
$(function(){
	$('.apopup').each(function(){
		var drNum = $('#drNumV').val();
		 console.log(drNum);
		$(this).on('click',function(){
			 $.ajax('lmsteacherdrdelete.bit',{
				'method':'get',
				'data':'drNum='+drNum,
				'success':function(){
					var title="new window";
					var option = "width=400,height=300,top=300,left=500, toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no";
					window.open("lmsteacherdrdelete.bit?drNum="+drNum,title,option);			  
					console.log('성공');
				} 		
			})//ajax
				return false;
		});//click
	});//each
});
</script>
<title>BITCAMP JEJU: LMS강사-자료실 상세페이지</title>
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
	       	<table>
	       	<c:set value="${bean }" var="bean" />
	       		<tr>
	       			<th>제목<input type="hidden" name="drNum" value="${bean.drNum }" id="drNumV"/></th>
	       			<td colspan="3">${bean.drTitle }</td>
	       		</tr>
	       		<tr>
	       			<th>작성자</th>
	       			<td class="line">${bean.name }</td>
	       			<th>작성일</th>
	       			<td>${bean.drDate }</td>
	       		</tr>
	       		<tr>
	       			<td colspan="4" id="text">${bean.drContent }</td>
	       		</tr>
	       		<tr>
	       			<th>첨부파일</th>
	       			<td colspan="3"><a href="lmsteacherdownload.bit?fileName=${bean.fileName }" class="filename">${bean.fileName }</a></td>
	       		</tr>
	       	</table>
		       	<a href="lmsteacherDataroom.bit" class="btn2">뒤로</a>
		       	<a class ="apopup btn" href="#">삭제</a>
		       	<a href="lmsteacherdredit.bit?drNum=${bean.drNum }" class="btn">수정</a>
	       </div>
       </div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>