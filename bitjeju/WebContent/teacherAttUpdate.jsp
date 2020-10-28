<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BITCAMP JEJU: LMS강사-출석수정</title>
<style type="text/css">
	h2 {
		text-align: center;
		margin: 30px auto;
	}
	#atttable{
		text-align:center;
		margin: 20px auto;
		border-collapse:collapse;
	}
	#atttable th{
		width: 200px;
		color:#1E3269;
		padding:10px;
		border-left:1px solid #e4e4e4;
		text-align:center;
	}
	#atttable td{
		border-left:1px solid #e4e4e4;
		padding:20px;
		text-align:center;
	}
	.inputbox{
		border: 1px solid white;
		text-align: center;
		width:100px;
	}
	#btn{/*버튼 조절*/
	    background-color: #000069;
	    border:1px solid #000069;
	    color:white;
	    width: 50px;
	    line-height: 22px;
	    border-radius: 5px;
	}
	#btn:hover{/*버튼 조절*/
		cursor: pointer;
		background-color: white;
		color:#000069;
	}
	#forbtn{
		margin:40px auto;
		text-align:center;
	}
</style>
<c:set value="${bean }" var="bean" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input:radio[name=state][value=" + '<c:out value="${ bean.state }"/>' + "]").attr("checked","checked");//상태 값 받아오기
});
</script>
</head>
<body>
	<h2>출석 수정</h2>
	<form action="lmsteacherattupdate.bit" method="post" id="form">
		<table id="atttable">
		<tr>
			<th>날짜</th>
			<td><input type="text" name="nalja" value="${bean.nalja }" class="inputbox" readonly="readonly"></td>
		</tr>
		<tr>
			<th>학번</th>
			<td><input type="text" name="num" value="${bean.num }" class="inputbox" readonly="readonly"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${bean.name }</td>
		</tr>
		<tr>
			<th>상태</th>
			<td>
				<label for="ra">출석</label>
			    <input type="radio" class="state" name="state" value="출석">
			    <label for="ra">지각</label>
			    <input type="radio" class="state" name="state" value="지각">
			    <label for="ra">조퇴</label>
			    <input type="radio" class="state" name="state" value="조퇴">
			    <label for="ra">결석</label>
			    <input type="radio" class="state" name="state" value="결석">
			</td>
		</tr>
		</table>
		<div id="forbtn">
			<button type="submit" id="btn">수정</button>
		</div>
	</form>
</body>
</html>