<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>BITCAMP JEJU: LMS행정-직원등록</title>

<script type="text/javascript">

var dept='';
function selected(){
	$('#deptselect option').each(function(){
		if($(this).prop('selected')==true){
			dept = $(this).val();
			console.log(dept);
		}
	});
}

function pwCheck(passwordVal){
		var chek_num = passwordVal.search(/[0-9]/g);
		var chek_eng = passwordVal.search(/[a-z]/g);
		if(chek_num<0 || chek_eng<0){
			return true;
		}else{
			return false;
		}	
}

$(function(){
	
$('#accountform').submit(function(){ //등록버튼 눌렀을 때 이벤트.
	selected();
	var emailVal = $("#accountemailid").val();//id창에 입력된 값
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var memberInfo = 'emailid='+$('#accountemailid').val()+'&pw='+$('#accountpw').val()+'&dept=';
	memberInfo += dept +'&phone='+$('#phone').val()+'&name='+$('#name').val();
	console.log(memberInfo);
	/* 
		비밀번호는 영문 + 숫자 조합, 8~12자리 
	*/
	var passwordVal=$('#accountpw').val();//비밀번호
	
	
	if($('#accountemailid').val()=="" || $('#accountpw').val()==""||$('#name').val()=="" ||$('#phone').val()==""){
		alert("모든 정보를 입력해야 합니다.");
	
	}else if(emailVal.match(regExp) == null){
		alert("아이디는 이메일 형식 입니다.");
	
	}else if(pwCheck(passwordVal)){
		//비밀번호 검증 하기.	영문이나 숫자가 포함되어야함., 포함되어있으면 false 영어나숫자만 true
		alert('비밀번호는 영문 + 숫자 조합이어야 합니다.');
	}else if(passwordVal.length<8 || passwordVal.length>12){
		//비밀번호 길이는 8자~12자까지. 
		alert('비밀번호는 8 ~ 12자리 입니다.');	
	}else{
		$.ajax('lmsstaffaccountadd.bit',{
			'method':'post',
			'data':memberInfo,
			'success':function(data){
				location.href='lmsstaffaccountlist.bit';//등록성공		
			} //success
		});//ajax
	}//else
	return false;
});//submit

	$('select option').each(function(){
		var space = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
			+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
			+'&nbsp;&nbsp;&nbsp;&nbsp;';
		$(this).html(space+$(this).text());
	});//each

});//ready
</script>

<style type="text/css">
.lmscontent {
	width: 600px;
	display: block;
	margin: auto;
}

#accountform{
	margin-bottom:200px;
}
#accounttable{
	width:600px;
	border-bottom:1px solid #e4e4e4;
	border-collapse:collapse;
	margin-bottom:40px;
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
	width:400px;
	padding:25px;
	text-align:left;
}

#accountemailid,#deptselect,#name,#phone,#accountpw{ /* form input */
    width: 300px;
    height: 33px;
    margin: 7px;
    border-radius: 5px;
    border: 1px solid #969696;
    font-size:90%;
    text-align:center;
}

#accountedit,#accountdelete,#accountback{/*  수정삭제뒤로가기 버튼 */
	float:right;
    background-color: #000069;
    border:1px solid #000069;
	border-radius:5px;
    color:white;
    margin: 7px;
    width: 50px;
    height: 30px;
    line-height:30px;
}
#accountedit:hover,#accountdelete:hover,#accountback:hover{/*  수정삭제뒤로가기 버튼 */
		background-color:white;
		color:#000069; 
		cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="template/lmsheader.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*****************lms메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>행정</p>
				<ul>
					<li class="bigletter">계정관리</li>
					<li><a href="lmsstaffaccountlist.bit">회원정보</a></li>
					<li class="bigletter">강의관리</li>
					<li><a href="lmsstafflectureadd.bit">강좌개설</a></li>
					<li><a href="lmsstafflecturelist.bit">강좌정보</a></li>
					<li class="bigletter">수강생관리</li>
					<li><a href="lmsstaffstudentlist.bit">수강생정보</a></li>
					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************lms메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			
			<form action="lmsstaffaccountadd.bit" method="post" id="accountform">
			<!--*************content start****************-->
			<div class="lmscontent">
				<h2>계정관리</h2>
				<h4>직원등록</h4>
<!-- 
--회원테이블
	num number primary key, 				--회원번호
	id_email varchar2(50) unique not null,  --이메일을 아이디로씀
	name varchar2(15),						--회원이름
	dept varchar2(20) default '일반회원',		
	lvl number(1) default 1,				--등급
	password varchar2(15) not null, 		--비밀번호 영문+숫자조합
	phone number,							--전화번호
	lecture varchar2(30),					--강좌명 
 -->


				<table id="accounttable">
					<tr>
						<th>이메일</th>
						<td><input type="email" id="accountemailid" name="emailid" placeholder="이메일을 입력하세요."/></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="name" placeholder="이름을 입력하세요."/></td>
					</tr>
					<tr>
						<th>부서</th>
						<td>
						<select  id="deptselect">
						<option value="영업" selected="selected">영업</option>
						<option value="강사">강사</option>
						<option value="행정">행정</option>
						<option value="회계">회계</option>
						<option value="취업">취업</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="accountpw" name="pw" placeholder="영문+숫자조합 8~12자리 입니다."/></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="tel" name="phone" id="phone" placeholder="'-' 없이 입력해주세요."/></td>
					</tr>
				</table>


			</div>
			<div class="lmscontent">
			<button id="accountback" type="button" onclick="window.history.go(-1)">뒤로</button>			
			<button id="accountdelete" type="reset">리셋</button>			
			<button id="accountedit" type="submit">등록</button>			
			</div>
			<!--*************content end******************-->
			</form>
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