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

function pwCheck(passwordVal){
	var chek_num = passwordVal.search(/[0-9]/g);
	var chek_eng = passwordVal.search(/[a-z]/g);
	if(chek_num<0 || chek_eng<0){
		return true;
	}else{
		return false;
	}	
}

var id_email = "${login.id_email }";

$(function(){

	var mypagepw1 = $('#mypagepw1').val();		//바꾸는 비밀번호
	var mypagepw2 = $('#mypagepw2').val();		//바꾸는 비밀번호
	
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	
	$('#mypagepw1').on('keyup',function(){
		mypagepw1 = $('#mypagepw1').val();		//바꾸는 비밀번호
		mypagepw2 = $('#mypagepw2').val();		//바꾸는 비밀번호
		if(mypagepw1==mypagepw2&&!pwCheck(mypagepw1)){
			$('#changepwtxt').text('OK').css('font-size','130%')
			.css('color','green').css('line-height','40px');
		}else if(mypagepw1==''&&mypagepw2==''){
			$('#changepwtxt').text('')
		}else{
			$('#changepwtxt').text('NO').css('font-size','130%')
			.css('color','red').css('line-height','40px');
		}
	});
	
	
	
	$('#mypagepw2').on('keyup',function(){
		mypagepw1 = $('#mypagepw1').val();		//바꾸는 비밀번호
		mypagepw2 = $('#mypagepw2').val();		//바꾸는 비밀번호
		if(mypagepw1==mypagepw2&&!pwCheck(mypagepw1)){
			$('#changepwtxt').text('OK').css('font-size','130%')
			.css('color','green').css('line-height','40px');
		}else if(mypagepw1==''&&mypagepw2==''){
			$('#changepwtxt').text('')
		}
		else{
			$('#changepwtxt').text('NO').css('font-size','130%')
			.css('color','red').css('line-height','40px');
		}
	});
	
	
	
	$('#changepw').on('click',function(){
		mypagepw1 = $('#mypagepw1').val();		//바꾸는 비밀번호
		mypagepw2 = $('#mypagepw2').val();		//바꾸는 비밀번호
		$('#changepwtxt').text('');
	
		if($('#mypagepw1').val()==""){
			alert("비밀번호를 입력해야 합니다.");
		
		}else if(pwCheck(mypagepw1)){
			//비밀번호 검증 하기.	영문이나 숫자가 포함되어야함., 포함되어있으면 false 영어나숫자만 true
			alert('비밀번호는 영문 + 숫자 조합이어야 합니다.');
		}else if(mypagepw1.length<8 || mypagepw1.length>12){
			//비밀번호 길이는 8자~12자까지. 
			alert('비밀번호는 8 ~ 12자리 입니다.');	
		}else if(mypagepw1!=mypagepw2){
			alert('비밀번호가 다릅니다.');	
		}else{
		
			$.ajax('mypageeditvalidate.bit',{
				'method':'post',
				'data':'mypagepw='+mypagepw1+'&mypageid='+id_email,
				'success':function(data){
					if($(data).find('update').text()=='success'){
						alert('비밀번호 변경이 완료되었습니다.');
						$('#mypagepw1').val('');		//바꾸는 비밀번호
						$('#mypagepw2').val('');	
						location.href='logout.bit';
					}else{
						alert('변경실패');
					}
				}, //success
				'error':function(){
					alert('변경실패 : error');
				}
			});//ajax
		}//else
	});//pw변경click
	
	$('#changephone').on('click',function(){
		var mypagephone = $('#mypagephone').val(); //바꾸는 전화번호
		if(mypagephone.length>12){
			alert('전화번호를 확인해주세요');
			
		}else{
			$.ajax('mypagephoneedit.bit',{
				'method':'post',
				'data':'mypagephone='+mypagephone+'&mypageid='+id_email,
				'success':function(data){
					if($(data).find('update').text()=='success'){
						alert('전화번호 변경이 완료되었습니다.');
					}else{
						alert('변경실패');
					}//if
				}, //success
				'error':function(){
					alert('변경실패 : error');
				}//error
			});//ajax
			
		}
	});//전화번호 변경버튼 클릭
	

});//ready
</script>
<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
	/* border-bottom:1px solid #e4e4e4; */
}
.lmscontent:last-child{/*푸터와 거리두기  */
	margin-bottom:150px;
}
#lock-icon{
	vertical-align:text-bottom;
	width:32px;
	height:32px;
}
.title_small {
	margin-top: 10px;
	margin-bottom: 50px;
	width: 600px;
	height: 30px;
	/* border-bottom: 1px solid #e4e4e4; */
	color: #999;
}
#accounttable{
	border-collapse:collapse;
}
#accounttable tr{
}
#accounttable th{
	color:#1E3269;
	padding:30px;
	border-right:1px solid #e4e4e4;
	text-align:right;
}
#accounttable td{
	padding:25px;
	text-align:left;
}
#accountback{
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
#accountback:hover{
	background-color:white;
	color:#000069;
	cursor: pointer;
}

#changepw,#changephone{   /* 비번변경 버튼 */
    background-color: #000069;
    border:1px solid #000069;
    color:white;
    margin-top : 7px;
    margin-right: 10px;
    width: 50px;
    height: 32px;
    font-size:90%;
    border-radius:5px;
    vertical-align:middle;
    float:left;
    ling-height:35px;
}
#changepw:hover,#changephone:hover{
	background-color:white;
	color:#000069;
	cursor: pointer;
}
#mypagepw1,#mypagepw2,#mypagephone{/*비밀번호 input  */
    width: 250px;
    height: 30px;
    margin: 7px;
    border-radius: 5px;
    border: 1px solid #969696;
    font-size:90%;
    text-align:center;
    line-height:30px;
    vertical-align:middle;
    float:left;
  
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
				<h2><img id="lock-icon" src="img/lock-icon.png"> 내 정보 수정</h2>
				<div class="title_small">
				<small>비트캠프 비밀번호와 전화번호를 수정 하실 수 있습니다.</small>
				</div>


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
						<th>비밀번호</th>
						<td><input type="password" id="mypagepw1" name="mypagepw" placeholder="영문+숫자 8~12자리입니다."/><button type="button" id="changepw">변경</button></td>
					</tr>
					<tr>	
						<th>비밀번호확인</th>
						<td><input type="password" id="mypagepw2" name="mypagepw" placeholder="영문+숫자 8~12자리입니다."/><span id="changepwtxt"></span></td>
					</tr>
					<tr>
						<th>구분</th>
						<td>${bean.dept }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="mypagephone" id="mypagephone"  placeholder="'-' 없이 입력해주세요." value=" ${bean.phone }"/><button type="button" id="changephone">변경</button></td>
					</tr>
				</table>
<!--  
               </tr>
               
                     <c:set var="phoneNum" value="${bean.phone}" />
               
                   <td>${fn:substring(phoneNum,0,3) }-${fn:substring(phoneNum,3,7) }-${fn:substring(phoneNum,7,11) }</td>
               </tr>


-->

			</div>
			<div class="lmscontent">
			<!-- <button id="accountback" onclick="window.history.go(-1)">뒤로</button>	 -->

	
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