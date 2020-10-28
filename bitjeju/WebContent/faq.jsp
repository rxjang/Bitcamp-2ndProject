
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('.faq-question').each(function(){
			$(this).on('click',function(){
				if($(this).find('.triangle').text() == '▷'){
					
					$(this).find('.triangle').text('▼');
					$(this).css('border-bottom-left-radius','0px')
						   .css('border-bottom-right-radius','0px')
						   .css('box-shadow','0px');
					$(this).next().slideDown(500);

				}else if($(this).find('.triangle').text() == '▼'){
					
					$(this).find('.triangle').text('▷');
					$(this).next().slideUp(500,function(){
						$(this).prev().css('border-bottom-left-radius','5px')
									  .css('border-bottom-right-radius','5px')
									  .css('box-shadow','0px');
					});//slideup
				}//else
			})//click
		});//each
		
		
		
		
	})//ready
</script>
<style type="text/css">
#header .grid3{
	margin-top:40px;
	position:relative;
	
}
#content {
	height: 700px;
}

.title_bar { /* 국비지원 */
	background-color: darkblue;
	width: 4px;
	height: 19px;
	display: inline-block;
	margin-left: 60px;
	vertical-align: middle;
}

.title_letter {
	color: darkblue;
	font-size: 18px;
	font-weight: 600;
	display: inline;
	vertical-align: middle;
}

.title_small {
	margin-top: 10px;
	margin-left: 60px;
	margin-bottom: 50px;
	width: 800px;
	height: 40px;
	border-bottom: 1px solid #e4e4e4;
	color: #999;
}

#faq-content {
	width: 700px;
	display: block;
	margin: auto;
	color:rgb(51, 51, 51);
}
.faq-box{
	margin-bottom:50px;
}
.faq-question {
	width: 700px;
	padding: 12px;
	background-color: #f5f5f5;
	border: 1px solid #e4e4e4;
 	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
 	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	/* border-radius:5px; */
	cursor:pointer;
}

.faq-answer {
	display:none;
	padding: 12px;
	width: 700px;
	border: 1px solid #e4e4e4;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

.faq-answer a{
	color:rgb(51, 51, 51);
	text-decoration:none;
}
.faq-answer a:hover{
	color:rgb(51, 51, 51);
	text-decoration:underline;
}

</style>
<title>BITCAMP JEJU: FAQ</title>
</head>
<body>
	<%@ include file="template/header.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*****************고객센터 메뉴******************-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>고객센터</p>
				<ul>
					<li class="bigletter"><a href="customercenter.bit">공지사항</a></li>
					<li class="bigletter"><a href="faq.bit">FAQ</a></li>
					<li></li>
				</ul>
			</div>
		</div>
		<!--*****************고객센터 메뉴******************-->
		<div id="content" class="grid6">
			&nbsp;
			<!--*************content start****************-->
			<div>
				<span class="title_bar">&nbsp;</span>
				<div class="title_letter">&nbsp;&nbsp;자주하는 질문</div>
			</div>
			<div class="title_small">
				<small>자주하는 질문들을 모았습니다.</small>
			</div>

			<div id="faq-content">
		
		
				<div class="faq-box">				
				<div class="faq-question">
					<span class="triangle">▷</span>&nbsp;아이디를 모르겠어요.
				</div>
				<div class="faq-answer">
					비트캠프의 아이디는 <b>"이메일" </b>주소입니다.<br />주로 이용하시는 이메일 주소를 통해 로그인 해보시기
					바랍니다.<br/>
				</div>
				</div>
				<div class="faq-box">				
				<div class="faq-question">
					<span class="triangle">▷</span>&nbsp;비밀번호를 까먹었어요.
				</div>
				<div class="faq-answer">
					<a href="pwform.bit"><b>[비밀번호 찾기]</b></a>를 통해서 비밀번호를 찾을 수 있습니다.<br/>
					비밀번호는 가입한 이메일로 발송되니 이메일을 통해 확인하시고 이용하시기 바랍니다.<br/><br/>
					<a href="pwform.bit" style="color:#5eb36f;"><strong>[비밀번호 찾기 바로가기]</strong></a>
				</div>
				</div>
				<div class="faq-box">				
				<div class="faq-question">
					<span class="triangle">▷</span>&nbsp;수강신청은 어떻게 하나요?
				</div>
				<div class="faq-answer">
					<a href="curriculum.bit"><b>[교육과정]</b></a> 메뉴를 통해서 수강신청을 할 수 있습니다.<br/>
					회원가입을 하시고 로그인 후 원하는 강좌의 수강신청 버튼을 누르시면 됩니다.<br/>
				</div>
				</div>

			</div><!-- faq content  -->

			<!--*************content end******************-->
		</div>
		<%@ include file="template/footer.jspf"%>
</body>
</html>