<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf" %>
<title>BITCAMP JEJU: LMS영업-수강생 상세정보</title>
<style type="text/css">
	.lmscontent {
		width: 600px;
		display: block;
		margin: auto;
		border-bottom:1px solid #e4e4e4;
	}
	.lmscontent:last-child {
		margin-bottom:300px;
	}
	#lecturetable{
		border-collapse:collapse;
		font-size:110%;
	}
	#lecturetable tr{
	}
	#lecturetable th{
		color:#1E3269;
		padding:30px;
		border-right:1px solid #e4e4e4;
		text-align:right;
	}
	#lecturetable td{
		padding:25px;
		text-align:left;
	}
	#studentdelete,#studentback{
		float:right;
	    background-color: #000069;
	    border:1px solid #000069;
	    color:white;
	    margin: 7px;
	    width: 50px;
	    height: 20px;
	}
	#attRange,#classRange{ /* progress bar */
		height:20px;
		width:300px;
		background-color:beige;
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
				<h2>수강생 관리</h2>
				<h4>수강생 상세정보</h4>
					<c:set value="${bean }" var="bean" />
				<table id="lecturetable">
					<tr>
						<th>이름</th>
						<td>${bean.name }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${bean.phone }</td>
					</tr>
					<tr>
						<th>선택 강좌명</th>
						<td>${bean.lecture_name }</td>
					</tr>
					<tr>
						<th>강사명</th>
						<td>${bean.teacher_name }</td>
					</tr>
					<tr>
						<th>강의실</th>	<!--숫자는 null이면 0으로 출력되므로 조건문처리.  -->
						<c:choose>
						<c:when test="${bean.lecture_room ne 0 }">
						<td>${bean.lecture_room }</td>
						</c:when>			
						<c:when test="${bean.lecture_room eq 0 }">
						<td>${null }</td>						
						</c:when>
						</c:choose>			
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
			<div class="lmscontent">
			<button id="studentback" onclick="window.history.go(-1)">뒤로</button>				
			</div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>