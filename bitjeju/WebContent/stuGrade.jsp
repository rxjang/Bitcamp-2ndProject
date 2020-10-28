<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf" %>
<title>BITCAMP JEJU: LMS수강생-성적조회</title>
<style type="text/css">
	.lmscontent {
		width: 600px;
		display: block;
		margin: auto;
	}
	.lmscontent:last-child {
		margin-bottom:300px;
	}
	#gradetable{
		text-align:center;
		margin: 20px auto;
		border-collapse:collapse;
		font-size:110%;
	}
	#gradetable th{
		width: 200px;
		color:#1E3269;
		padding:10px;
		text-align:center;
		border-bottom:1px solid #e4e4e4;
	}
	#gradetable td{
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
       		<h2>성적조회</h2>
       		<c:set value="${bean }" var="bean" />
       		<table id="gradetable">
       			<tr>
       				<th>과목명</th>
       				<th>점수</th>
       			</tr>
       			<tr>
       				<td>Java</td>
       				<td>${bean.exam1 }</td>
       			</tr>
       			<tr>
       				<td>WEB</td>
       				<td>${bean.exam2 }</td>
       			</tr>
       			<tr>
       				<td>Framework</td>
       				<td>${bean.exam3 }</td>
       			</tr>
       		</table>
       </div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>