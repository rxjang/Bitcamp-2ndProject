<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf" %>
<title>BITCAMP JEJU: LMS수강생-수강정보</title>
<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
}
.lmscontent:last-child {
	margin-bottom:300px;
}
#lecturetable{
	text-align:center;
	margin: 50px auto;
	border-collapse:collapse;
	font-size:110%;
}
#lecturetable th{
	width: 200px;
	color:#1E3269;
	padding:10px;
	text-align:center;
	border-right:1px solid #e4e4e4;
}
#lecturetable td{
	padding:20px;
	text-align:center;
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
       <h2>수강정보</h2>
       <c:set value="${bean }" var="bean" />
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
       		</table>
       </div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>