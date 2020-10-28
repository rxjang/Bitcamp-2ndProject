<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style rel="stylesheet" type="text/css">
	p{
		text-align:center;
		font-size:25px;
		margin: 50px auto;
	}
	#btns{
		margin:auto;
		dispaly:block;
		width:115px;
		height:120px;
	}
	.btn{
		text-align:center;
		text-decoration: none;
		background-color: #000069;
		border: 1px solid #000069;
		border-radius:5px;
		color: white;
		width: 45px;
		margin: 5px;
		line-height: 28px;
		font-size:14px;
		cursor:pointer;	
		float:left;
	}
	.btn2{
		font-size:14px;
		text-align:center;
		text-decoration: none;
		background-color: #000069;
		border: 1px solid #000069;
		border-radius:5px;
		color: white;
		width: 45px;
		margin: 5px;
		line-height: 30px;
		display:inline-block;
	    float:left;
	}
	.btn:hover,.btn2:hover{
		border: 1px solid #000069;
		background-color: white;
		color: #000069;		
	}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BITCAMP JEJU: 공지사항 삭제페이지</title>
</head>
<body>
	<p>해당 게시글을 삭제하시겠습니까?</p>
	<form method="post" action="noticedelete.bit">
	<c:set value="${bean }" var="bean" />
	<input type="hidden" name="ntnum" value="${bean.ntnum }"/>
	<div id="btns">
		<button class="btn">삭제</button>
		<a href="#" onClick="self.close();" class="btn2">취소</a>
	</div>
	</form>
</body>
</html>