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
	border-right:1px solid #e4e4e4;
	text-align:right;
}
#atttable td{
	padding:25px;
	text-align:left;
}
#atttable td>span{
	line-height:35px;
}
.btn{/*버튼 조절*/
	vertical-align: middle;
	font-size: 14px;
	text-align:center;
	text-decoration: none;
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 62px;
    line-height: 25px;
    border-radius:5px;
    float:right;
}
.btn:hover{
    background-color: white;
    border:1px solid #000069;
    color:#000069;	
}

.bardivs {
	width: 300px; /* 100% */
	position: relative;
	
}
#cl-pro-text,#ar-pro-text {
	position: absolute;
 	top: 0;
	left: 0;
	width: 100%;
	padding-top: 0px;
	text-align: center;
}
</style>
<script type="text/javascript">
	var attRate ="${bean.attRate()}";	//출석률
	var classRate = "${bean.classProgress()}"; //수업진행률
	 $(function(){
		$('#cl-progress').progressbar({value : Math.floor(classRate)});
		$('#cl-progress').css('height','23px').css('vertical-align','text-bottom');
		$('#cl-progress').find(".ui-progressbar-value").css({"background":"#e4e4e4"}).css('height','100%');
	 //프로그래스 바
		$('#ar-progress').progressbar({value : Math.floor(attRate)});
		//$('#ar-progress').progressbar({value : 88});
		$('#ar-progress').css('height','23px').css('vertical-align','text-bottom');
		$('#ar-progress').find(".ui-progressbar-value").css({"background":"#e4e4e4"}).css('height','100%');
		
	 });//ready
	
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
       <h2>출결조회</h2>
       <table id="atttable">
       <c:set value="${bean }" var="bean" />
			<tr>
				<th>수업 진행률</th>
				<td><div class="bardivs">
						<div id="cl-progress"></div>
						<div id="cl-pro-text">&nbsp;${bean.classProgress()}%&nbsp;(${bean.calTilToday()}/${bean.calAttDays()}일)</div>
					</div></td>
			</tr>
			<tr>
				<th>출석률</th>
				<td><div class="bardivs">
						<div id="ar-progress"></div>
						<div id="ar-pro-text">&nbsp;${bean.attRate()}%&nbsp;(${bean.cntAtt()}/${bean.calAttDays()}일)</div>
					</div></td>
			</tr>
			<tr>
				<th>출석</th>
				<td>${bean.cntAtt() }회</td>
			</tr>
			<tr>
				<th>지각</th>												
				<td><span>${bean.cntLate() }회</span><a class="btn" href="lmsstuattdetail.bit?num=${login.num}&state=late">상세보기</a></td>
			</tr>
			<tr>
				<th>조퇴</th>
				<td><span>${bean.cntEarly() }회</span><a class="btn" href="lmsstuattdetail.bit?num=${login.num}&state=leave">상세보기</a></td>
			</tr>
			<tr>
				<th>결석</th>
				<td><span>${bean.cntAbsent() }회</span><a class="btn" href="lmsstuattdetail.bit?num=${login.num}&state=absent">상세보기</a></td>
			</tr>
       </table>
       </div>
       <!--*************content end******************-->
<%@ include file="template/footer.jspf" %>
</body>
</html>