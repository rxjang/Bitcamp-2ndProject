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
	#lecname{
		color: #787878;
		font-size:14px;
		font-weight:bold;
		line-height:15px;
	}
	.grade{
		border: 1px solid white;
		text-align: center;
		width:100px;
	}
	.btn{
		display: none;
	}
	#gradetable{
		text-align:center;
		margin: 20px auto;
		border-collapse:collapse;
	}
	#gradetable th{
		width: 120px;
		color:#1E3269;
		padding:10px;
		border-left:1px solid #e4e4e4;
	}
	#gradetable td{
		border-left:1px solid #e4e4e4;
		padding:15px;
	}
</style>
<script type="text/javascript">
function pressEnter(){
    if(event.keyCode == 13){
		console.log("work");
	 	form.submit();
    }
}
</script>
<title>BITCAMP JEJU: LMS강사-성적입력</title>
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
       <h2>수강생관리</h2>
       <h4>성적관리</h4>
       <div id="gradetable">
       	<table>
       		<tr>
       			<th>학번</th>
       			<th>이름</th>
       			<th>java</th>
       			<th>web</th>
       			<th>framework</th>
       		</tr>
       		<c:forEach items="${list }" var="list">
       		<form method="post" action="lmsteacherstugrade.bit" name="form" onsubmit="return press(form)">
	       		<tr>
	       			<td>${list.num}
	       			<input type="hidden" class="test" name="num" value="${list.num }"/>
	       			</td>
	       			<td>${list.name}</td>
	       			<td><input type="text" class="grade" name="grade1" value="${list.exam1}" onKeydown="pressEnter()"/></td>
	       			<td><input type="text" class="grade" name="grade2" value="${list.exam2}" onKeydown="pressEnter()"/></td>
	       			<td><input type="text" class="grade" name="grade3" value="${list.exam3}" onKeydown="pressEnter()"/></td>
	       		</tr>
	       			<button class="btn">btn</button>
       		</form>
       		</c:forEach>
       	</table>
       </div>
       </div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>