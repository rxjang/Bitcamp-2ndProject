<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>BITCAMP JEJU: 마이페이지</title>


<script type="text/javascript">

var num="${bean.num}";
$(function(){
	$('#mypageedit').on('click',function(){	//내정보 수정페이지로 이동
		//location.href='mypageedit.bit?idx='+num;
		$.ajax('mypageedit.bit',{
			'method':'post',
			'data':'idx='+num,
			'success':function(data){
				location.href='mypageedit.bit';
			},//success
			'error':function(data){
				alert('수정에 실패했습니다.');
			}//error
		});//ajax
	});//click
	
	$('#accountdelete').on('click', function(){ // 탈퇴 페이지로 이동
		var param = 'idx='+num
		$.ajax('deletemechk.bit', {
			'method' : 'post',
			'data' : param,
			'success' : function(data){
				location.href ='deletemechk.bit';
			}, //success
			'error' : function(data){
				alert('이동 실패');
			} //error
		}); //ajax
	}); //click
	
	
});//ready
</script>
<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	margin-bottom:40px;
	/* border-bottom:1px solid #e4e4e4; */
}
.lmscontent:last-child{/*푸터와 거리두기  */
	margin-bottom:200px;
}

#lock-icon{
	vertical-align:text-bottom;
	width:32px;
	height:32px;
}
#accounttable{
	width:600px;
	border-collapse:collapse;
	border-top:1px solid #e4e4e4;
	border-bottom:1px solid #e4e4e4;
}
#accounttable tr{
}
#accounttable th{
	color:#1E3269;
	padding:30px;
	/* border-right:1px solid #e4e4e4; */
	text-align:right;
}
#accounttable td{
	width:400px;
	padding:25px;
	text-align:left;
}
#mypageedit,#accountback{
	float:right;
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin: 7px;
    width: 50px;
    height: 30px;
    line-height:30px;
    border-radius: 5px;
}
#mypageedit:hover,#accountback:hover{
	background-color:white;
	color:#000069;
	cursor: pointer;
}
#accountdelete{
	float: left;
	background-color: #d90b0b;
	border: 1px solid #d90b0b;
	color: white;
	margin: 7px;
	width: 80px;
	height: 30px;
	line-height:30px;
	border-radius:5px;
	margin-left: 23px;
}
#accountdelete:hover{
	background-color: white;
	color: #d90b0b;
	cursor: pointer;
}

#mypagepw,#mypagephone{/*비밀번호 input  */
    width: 300px;
    height: 35px;
    margin: 7px;
    border-radius: 5px;
    border: 1px solid #969696;
    font-size:120%;
    text-align:center;
    vertical-align:middle;
  
}
#header .grid3{
	margin-top:40px;
	position:relative;
	
}
</style>
</head>
<body>
	<%@ include file="template/header.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*****************lms메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>내 정보</p>
				<ul>
					<li class="bigletter">계정관리</li>
					<li><a href="mypage.bit">회원정보</a></li>

					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2><img id="lock-icon" src="img/lock-icon.png"> 내 정보</h2>
				<h4>&nbsp;</h4>


					<c:set value="${bean }" var="bean" />
				<table id="accounttable">
					<tr>
						<th>이름</th>
						<td>${bean.name }</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${bean.id_email }</td>
					</tr>
					<tr>
						<th>구분</th>
						<td>${bean.dept }</td>
					</tr>
					    <c:set var="phoneNum" value="${bean.phone}" />
					<tr>
						<th>전화번호</th>
						<td>${fn:substring(phoneNum,0,3) }-${fn:substring(phoneNum,3,7) }-${fn:substring(phoneNum,7,11) }</td>
					</tr>
				</table>


			</div>
			<div class="lmscontent">
			<button id="accountdelete" type="submit">탈퇴하기</button>
			<button id="accountback" onclick="window.history.go(-1)">뒤로</button>
			<button id="mypageedit" type="submit">수정</button>			
			

<!-- 
  @ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --jstl함수 선언.
               </tr>
               
                     <c:set var="phoneNum" value="${bean.phone}" />
               
                   <td>${fn:substring(phoneNum,0,3) }-${fn:substring(phoneNum,3,7) }-${fn:substring(phoneNum,7,11) }</td>
               </tr>


-->		
			</div>
			<!--*************content end******************-->
			<%@ include file="template/footer.jspf"%>
</body>
</html>
<!-- 
-1번라인의 charset, pageEncoding 5번라인의 charset모두 utf-8로 맞춰주세요.
-2번의 doctype도 다지우고 위처럼 html만 남겨주세요.
-content내부에 content와 sidebar로 나눔 ->content에 작업하면됩니다.
-sidebar에서 사용하고 있는 id: #signin #emailid #pw #login #createccount #gotolms #campus #campusinfo #classinfo #open
-footer에서 사용하고있는 id: #footercon
위의 아이디들은 작업시 사용하지 마세요 이름바꾸고 싶으면 저와 의논바람
 -->