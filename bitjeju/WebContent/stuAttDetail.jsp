<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf" %>
<title>BITCAMP JEJU: LMS수강생-출결조회</title>
<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
}
.lmscontent:last-child {
	margin-bottom:300px;
}
#atttable{
	width:600px;
	border-collapse:collapse;
	font-size:110%;
}
#atttable th{
	color:#1E3269;
	padding:30px;
	border-bottom:1px solid #e4e4e4;
}
#atttable td{
	padding:25px;
	text-align:center;
}
.btn{/*버튼 조절*/
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 70px;
    line-height: 20px;
    float:right;
}
.btn:hover{
    background-color: white;
    border:1px solid #000069;
    color:#000069;	
}
</style>
<script type="text/javascript">

	
</script>
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
       <c:set value="${list }" var="list" />
       <h2>출결조회</h2>
      <%--  <h4>${list.state }조회</h4> --%>
       <table id="atttable">
    		<tr>
				<th>날짜</th>
			</tr>
          <c:forEach items="${list}" varStatus="status" var="list">
			<tr>
				<td>${list.nalja }</td>
			</tr>
		</c:forEach>
       </table>
       <button class="btn" onclick="window.history.go(-1)">이전</button>
       </div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>