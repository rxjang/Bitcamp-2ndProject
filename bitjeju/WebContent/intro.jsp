<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf" %>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73c965258ca816cf5049ccb3b335741e"></script>
<script type="text/javascript">
function Tabs(){
	$('#Tab>ul>li').each(function(idx, ele){ /*하나 누를때마다 눌린 탭과 나머지탭의 border와 배경색, 이벤트 변경, 이미지 로드*/
		$(this).on('click', function(){
			$(this).css('border','1px solid #dddddd').css('border-top-right-radius','10px')
			.css('border-top-left-radius','10px').css('border-bottom','0px');
			
			$('#Tab>.tab_list>li').not($(this)) //안눌린 것들은 밑경계선 보이게. 
			.css('border','0px solid')
			.css('border-bottom','1px solid #dddddd');
			
			$(this).css('background-color','white');//배경 흰색
			
			$('#Tab>.tab_list>li').not($(this)).on('mouseover',function(){ /*마우스 이벤트*/
					$(this).css('background-color','aliceblue')
			});
			$('#Tab>.tab_list>li').not($(this)).on('mouseleave',function(){
					$(this).css('background-color','white')
			});
			
			$('.etcimg').attr('src','img/history'+idx+'.jpg');//탭 년도별로 이미지 부여
		});//li click
	});	
}//Tabs


function Stu(){
	$('#teacher>.tab_teacher_list>li').each(function(idx, ele){ /*하나 누를때마다 눌린 탭과 나머지탭의 border와 배경색, 이벤트 변경, 이미지 로드*/
		$(this).on('click', function(){
			$(this).css('border','1px solid #dddddd')
			.css('border-top-right-radius','10px')
			.css('border-top-left-radius','10px')
			.css('border-bottom','0px');
			
			$('#teacher>.tab_teacher_list>li').not($(this))
			.css('border','0px solid')
			.css('border-bottom','1px solid #dddddd');
			
			$(this).css('background-color','white');
			
			$('#teacher>.tab_teacher_list>li').not($(this)).on('mouseover',function(){ /*마우스 이벤트*/
					$(this).css('background-color','aliceblue')
			});
			$('#teacher>.tab_teacher_list>li').not($(this)).on('mouseleave',function(){
					$(this).css('background-color','white')
			});
			$('.stuimg').attr('src','img/stu'+idx+'.png');
		});
	});	
}
function kakaoMap(){
	container = document.getElementById('map');
	options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		//center: new kakao.maps.LatLng(37.503207, 127.024278),
		level: 3
	};

	map = new kakao.maps.Map(container, options);

	markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

	// 마커를 생성합니다
	marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	marker.setMap(map);//marker를 지도에 표시
	
	
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


	var iwContent = '<div style="padding:5px;">비트캠프 제주점<br>'
	+'<a href="https://map.kakao.com/link/map/BIT JEJU,33.450701,126.570667" style="color:blue; text-decoration:none;" '
	+'target="_blank">큰지도보기</a></div>', 
	// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

// 인포윈도우를 생성하고 지도에 표시합니다
	var infowindow = new kakao.maps.InfoWindow({
    map: map, // 인포윈도우가 표시될 지도
    position : iwPosition, 
    content : iwContent,
    removable : iwRemoveable
});



}
var aTag = "${a}";
$(document).ready(function(){  
	console.log(aTag);
	Stu();
	Tabs();
	$('#Tab>.tab_list>li:nth-child(1)').click();
	$('#teacher>.tab_teacher_list>li:nth-child(1)').click();
	kakaoMap();
	
	if(aTag==1){
		//$('#intro-a-1').get(0).click(); 
	}else if(aTag==2){
		$('#intro-a-2').get(0).click(); 
	}else if(aTag==3){
		$('#intro-a-3').get(0).click(); 
	}else if(aTag==4){
		$('#intro-a-4').get(0).click();
	}
	
});


</script>
<style type="text/css">
	#header .grid3{
		margin-top:40px;
		position:relative;
		
	}
	.bar{
		background-color: #000069;
		width: 4px;
		height: 19px;
		display: inline-block;
		margin-left: 60px;
		vertical-align: middle;
	}
	.text{
		color: darkblue;
		font-size: 18px;
		font-weight: 600;
		display: inline;
		vertical-align: middle;
	}
		
	#introImg{
		
		display:block;
		margin:auto;
		margin-top:40px;
		margin-bottom:40px;	
		width:700px;
	}	
	
	
	/*연혁 탭  */
	#Tab{
	
		margin: auto;
		margin-top:40px;
		margin-bottom:40px;
	}
	#Tab>ul{
	/* background-color:beige; */
		width:710px;
		margin:0px auto;
		padding:0px;
		clear:both;
		overflow:hidden;
		list-style:none;
		text-align:center;
	}
	#Tab>ul>li{
		font-size:130%;
		border-bottom:1px solid #dddddd;
	/* 	border-bottom:1px solid gray; */
		width:140px;
		height:40px;
		line-height:40px;
		float:left;
		display:block;
		cursor:pointer;
	/* 	margin-right:2px; */
	}
	#Tab>ul>li:hover{
		background-color:antiquewhite;
	  	border:1px solid #dddddd;
		border-bottom:0px solid gray;
		border-top-right-radius:10px;
		border-top-left-radius:10px;
	}
	#Tab>.tab_content{
		display:block;
		border:1px solid #dddddd;
		margin:0px auto;
		margin-top:20px;
		width:710px;
	}
	.etcimg{
		display:block;
		margin:auto;
	}		
	
	/* 강사진 소개 탭 */
	#teacher{
		margin: auto;
		margin-top:40px;
		margin-bottom:40px;
	}
	#teacher>.tab_teacher_list{
		width:700px;
		margin:0px auto;
		padding:0px;
		clear:both;
		overflow:hidden;
		list-style:none;
		text-align:center;
	}
	#teacher>.tab_teacher_list>li{
		font-size:110%;
		border-bottom:1px solid #dddddd;
	/* 	border-bottom:1px solid gray; */
		width:140px;
		height:40px;
		line-height:40px;
		float:left;
		display:block;
		cursor:pointer;
	}
	.tab_teacher{
		display: block;
		margin: 0px auto;
		margin-top: 10px;
		margin-bottom: 40px;
		width:700px;
		height:400px;
		} 

	#bitcampMap{
		width: 700px;
		display:block;
		margin:auto;
	
	}
	
	/* 카카오 지도 api */
	#map{
		margin-top: 50px;
		margin-bottom:10px;
		width:690px;
		height:400px;
	}
	#map_info{
		margin-bottom:40px;
	}
	#mapTable{
		font-weight:0;
		width: 690px;
		border-collapse: collapse;
	}
	#mapTable tr{
		border-top:1px solid #dddddd;
	}
	#mapTable th{
		vertical-align:top;
		padding:10px;
		text-align:left;
		color:#414141;
	}
	#mapTable td{
		padding:10px;
		text-align:left;
	
	}
	/* 제일 위로 이동 */
	#moveTop{
		width:40px;
		height:20px;
		line-height:20px;
		border:1px solid gray;
		float:right;
		display:block;
		cursor:pointer;
		margin-right:20px;
		margin-bottom:100px;
		text-align:center;
	}
	#moveTop:hover{
		box-shadow:gray 0px 0px 3px;
	}
	#moveTop>a{
		text-decoration:none;
		color:black;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="template/header.jspf" %>
<%@ include file="template/menu.jspf" %>
   <div id="contents">
   <!--*****************비트캠프 메뉴******************-->
   		<div class="grid2">
			<div id="lmsmenu">
				<p>비트캠프</p>
				<ul>
					<li class="bigletter"><a id="intro-a-1"  href="#intro_table">학원소개</a></li>
					<li class="bigletter"><a id="intro-a-2"  href="#years">연혁</a></li>
					<li class="bigletter"><a id="intro-a-3"  href="#teacher-intro">강사진소개</a></li>
					<li class="bigletter"><a id="intro-a-4"  href="#bitcampMap">오시는길</a></li>
					<li></li>
				</ul>
			</div>
			
		</div>
        <!--*****************비트캠프 메뉴******************-->
       <div id="content" class="grid6">&nbsp;
       <!--*************content start****************-->
      <div id="intro_table" >
      	<div>
      		<span class="bar">&nbsp;</span>
      		<div class="text" >&nbsp;&nbsp;학원소개</div>
      		<div id="introImg">
      		<img alt="" src="img/bitcamp_intro.png"/>
      		</div>
		</div>
		<div id="years">
			<span class="bar">&nbsp;</span>
      		<div class="text">&nbsp;&nbsp;연 혁</div>
		</div>
      		<div id="Tab" class="gird12">
      			<ul class="tab_list">
				  <li>2018-2020</li>
				  <li>2015-2017</li>
				  <li>2010-2014</li>
				  <li>2004-2009</li>
				  <li>1990-2003</li>
				</ul>
			</div>	
				<div class="tab_content">
					<img class="etcimg" src="img/history0.jpg"/>
				</div>	
		<div>
			<span class="bar">&nbsp;</span>
      		<div class="text" id="teacher-intro">&nbsp;&nbsp;강사진</div>
		</div>
		<div id="teacher" class="gird12">
			<ul class="tab_teacher_list">
				<li>설민석</li>
				<li>황현민</li>
				<li>정승재</li>
			</ul>
		</div>
		<div class="tab_teacher">
			<img class="stuimg" src="img/stu0.png">
		</div>
		<div>
			<span class="bar">&nbsp;</span>
      		<div class="text">&nbsp;&nbsp;오시는 길</div>
      	</div>
      	<div id="bitcampMap">	
			<div id="div_map">
		<div id ="map"></div><!-- 지도가 들어가는 곳  -->
		<div id="map_info">
		
		<table id="mapTable">
		
		<tr>
		<th>주소</th>
		<td>제주특별자치도 제주시 첨단로 242 (우)63309</td>
		</tr>
		<tr>
		<th>대표전화</th>
		<td>1899-1326</td>
		</tr>
		<tr>
		<th>버스</th>
		<td>(하차) 카카오 스페이스닷원 앞,제주첨단과학기술단지</td>
		</tr>
		</table>
		
		
		<!-- 
		
			주소 		서울특별시 서초구 강남대로459 백암빌딩 (구관건물)
			대표전화 	02-3486-9600
			지하철 		(신논현역) 9호선 6번출구 – 강남역 방향 도보 3분
						(강남역) 2호선 10번출구 – 신논현역 방향 도보 7분
			버스 		(하차) 신논현역,구교보타워사거리/ 신논현역,씨티은행
		
		
		 -->
		</div>
		</div>
	</div>
		<div id="moveTop"><a href="#header">top</a></div>
       <!--*************content end******************-->
       </div>
<%@ include file="template/footer.jspf" %>
</body>
</html>