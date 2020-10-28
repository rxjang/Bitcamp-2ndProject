<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="template/lmshead.jspf" %>
<meta charset="UTF-8">
<title>BITCAMP JEJU: LMS강사-출석체크</title>
<script type="text/javascript">

var selectDate;
$(function(){
	  document.getElementById('nalja').value = new Date().toISOString().substring(0, 10);
	  selectDate = $('#nalja').val();
	  $('.nalja').val(selectDate);
	  $('.nalja').css('display','none')
		var temp=$('.listnalja').text().substring(0, 10);
	  if(temp==selectDate){
		  $('#attchecktable').hide();
		  $('#fin').hide();
		  $('#attlist').show();
	  }else{
		  $('#attchecktable').show();
		  $('#fin').show();
		  $('#attlist').hide();		  
	  }
		
});//READY

</script>
<style type="text/css">
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
#naljadiv{
	padding: 10px;
}
#nalja{	
	border:1px solid white;
}
#atttable{<!--출석체크 이전 테이블-->
	text-align:center;
	margin: 10px auto;
	border-collapse:collapse;
}
#atttable th{
	color:#1E3269;
	padding:10px;
	border-left:1px solid #e4e4e4;
	text-align:center;
}
#atttable td{
	border-left:1px solid #e4e4e4;
	padding:25px;
	text-align:center;
}
#attlist{<!--출석체크 이후 완료 테이블-->
	text-align:center;
	margin: 20px auto;
	border-collapse:collapse;
}
#attlist th{
	width: 200px;
	color:#1E3269;
	padding:10px;
	border-left:1px solid #e4e4e4;
	text-align:center;
}
#attlist td{
	border-left:1px solid #e4e4e4;
	padding:25px;
	text-align:center;
}
#fin{/*버튼 조절*/
	float: right;
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 50px;
    line-height: 25px;
    border-radius: 5px;
}
#fin:hover{
	background-color:white;
	color:#000069;
	cursor: pointer;
}
.classStu{
	float:right;
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
	   <h2>출결관리</h2>
	   <h4>출석체크</h4>
	   <c:set value="${classStu }" var="classStu" />
	   <div id="naljadiv">
	      <label for="nalja">날짜</label>
	      <input type="date" id="nalja" name="nalja" readonly>
	      <span class="classStu">총인원: ${classStu }</span>
	   </div>
	   <form method="post" action="lmsteacherattlist.bit">
	   <div id="atttable">
	      <table id="attchecktable">
	         <tr>
	            <th>학번</th>
	            <th>이름</th>
	            <th>상태</th>
	         </tr>
	   <c:forEach items="${list}" varStatus="status" var="bean">
	         <tr>
	            <td align ="center" >
		            ${bean.num }
		            <input type="hidden" name="num${bean.num }" value="${bean.num }">
		            <input type="date" class="nalja" name="nalja${bean.num }">
	            </td>
	            <td>
	            	${bean.name }
	            </td>
	            <td>
		            <label for="ra">출석</label>
		            <input type="radio" class="state" name="state${bean.num }" value="출석" required>&nbsp;
		            <label for="ra">&nbsp;지각</label>
		            <input type="radio" class="state" name="state${bean.num }" value="지각">&nbsp;
		            <label for="ra">&nbsp;조퇴</label>
		            <input type="radio" class="state" name="state${bean.num }" value="조퇴">&nbsp;
		            <label for="ra">&nbsp;결석</label>
		            <input type="radio" class="state" name="state${bean.num }" value="결석">
	             </td>
	         </tr>
	   </c:forEach>
	      </table>
	      <table id="attlist">
	      		<tr>
	      			<th>날짜</th>
					<th>학번</th>
					<th>이름</th>
					<th>상태</th>
	      		</tr>
	      		<c:forEach items="${list2}" var="list2">
	      		<tr>
					<td class="listnalja">${list2.nalja }</td>
					<td>${list2.num }</td>
					<td>${list2.name }</td>
					<td>${list2.state }</td>
	      		</tr>
	      		</c:forEach>
	      </table>
	   </div>
	   <button id="fin">완료</button>
	   </form>
	   </div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>