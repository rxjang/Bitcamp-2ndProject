<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="template/lmshead.jspf"%>
<title>BITCAMP JEJU:취업지원센터</title>
<style>
#header .grid3 {
	margin-top: 40px;
	position: relative;
}

#careerinfo {
	margin: 30px auto;
	width: 700px;
}

.bar {
	background-color: #000069;
	width: 4px;
	height: 19px;
	display: inline-block;
	margin-left: 60px;
	vertical-align: middle;
}

.text {
	color: darkblue;
	font-size: 18px;
	font-weight: 600;
	display: inline;
	vertical-align: middle;
}

#careerinfo table {
	margin: 40px auto;
	text-align: center;
	border-collapse: collapse;
}

#careerinfo th {
	width: 80px;
	border-bottom: 2px solid #e4e4e4;
}

#careerinfo td {
	border-bottom: 1px solid #e4e4e4;
}

.careertitle2 {
	text-align: left;
	padding: 7px;
}

.notice {
	background-color: #e4e4e4;
}

#paging {
	margin: 30px auto;
	text-align: center;
}

.num1, .num {
	margin: 10px 10px;
	width: 30px;
	line-height: 30px;
	border: 1px solid #000069;
	display: inline-block;
}

.num1 {
	background-color: #000069;
	color: white;
}

#lmsmenu {
	margin-top: 20px;
	margin-left: 45px;
	width: 200px;
	border: 3px solid white;
	/*        background-color: #F6F6F6;*/
}

.bigletter {
	font-size: 18px;
	font-weight: 600;
}

#lmsmenu>p {
	line-height: 30px;
	color: #505050;
	font-weight: 800;
	font-size: 21px;
	border-bottom: 1px solid #e4e4e4;
	padding-bottom: 10px;
	padding-left: 40px;
}

#lecname {
	color: #787878;
	font-size: 14px;
	font-weight: bold;
	line-height: 15px;
}

#lmsmenu>ul {
	list-style: none;
	color: #505050;
}

#lmsmenu>ul>li {
	padding-bottom: 10px;
	color: #505050;
}

#content {
	height: 1200px;
}
</style>
</head>
<body>
	<%@ include file="template/header.jspf"%>
	<%@ include file="template/menu.jspf"%>
	<div id="contents">
		<!--*********취업지원센터 메뉴**********-->
		<div class="grid2">
			<div id="lmsmenu">
				<p>취업지원센터</p>
				<ul>
					<li class="bigletter">취업정보전달</li>
					<li class="bigletter">이력서관리</li>
					<li class="bigletter">스케쥴링(면접)</li>
					<li class="bigletter">취업현황관리</li>
					<li></li>
				</ul>
			</div>
		</div>
		<!--*********취업지원센터 메뉴**********-->
		<div id="content" class="grid6">&nbsp;
			<!--*************content start****************-->
			<div>

				<span class="bar">&nbsp;</span>
				<div class="text">&nbsp;&nbsp;취업지원센터</div>
			</div>
			<div id="careerinfo">
				<table>
					<tr>
						<th>번호</th>
						<th id="careertitle">제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<tr>
						<td class="notice">공지</td>
						<td class="careertitle2">※구인의뢰를 원하시거나 문의사항이 있으신 분들은 비트캠프
							취업지원실(02-3453-5803 또는 job@bitcamp.co.kr)로 연락주시기 바랍니다.※</td>
						<td>비트캠프</td>
						<td>2020.07.06</td>
						<td>116</td>
					</tr>
					<tr>
						<td class="notice">공지</td>
						<td class="careertitle2">※아래 공고들은 모두 비트캠프 수료생 혹은 수료예정자를 대상으로
							한 채용 정보입니다. 비트캠프에서 과정을 수강 중이시거나 수료하신 분들만 지원하시기 바랍니다.※</td>
						<td>비트캠프</td>
						<td>2020.06.26</td>
						<td>66</td>
					</tr>
					<tr>
						<td>50</td>
						<td class="careertitle2">(주)내담씨앤씨/서울,경기/상시모집</td>
						<td>비트캠프</td>
						<td>2020.08.18</td>
						<td>50</td>
					</tr>
					<tr>
						<td>49</td>
						<td class="careertitle2">(주)매드엑스컴퍼니/서울/채용시 마감</td>
						<td>비트캠프</td>
						<td>2020.08.14</td>
						<td>73</td>
					</tr>
					<tr>
						<td>48</td>
						<td class="careertitle2">(주)대영유비텍/서울, 경기/~08.28</td>
						<td>비트캠프</td>
						<td>2020.08.13</td>
						<td>74</td>
					</tr>
					<tr>
						<td>47</td>
						<td class="careertitle2">(주)세포아소프트/서울/~08.31</td>
						<td>비트캠프</td>
						<td>2020.08.13</td>
						<td>68</td>
					</tr>
					<tr>
						<td>46</td>
						<td class="careertitle2">(주)경포씨엔씨/서울/~09.10</td>
						<td>비트캠프</td>
						<td>2020.08.11</td>
						<td>93</td>
					</tr>
					<tr>
						<td>45</td>
						<td class="careertitle2">(주)아워콥/서울/~08.31</td>
						<td>비트캠프</td>
						<td>2020.08.10</td>
						<td>114</td>
					</tr>
					<tr>
						<td>44</td>
						<td class="careertitle2">(주)블루비즈넷/서울/~08.14</td>
						<td>비트캠프</td>
						<td>2020.08.10</td>
						<td>85</td>
					</tr>
					<tr>
						<td>43</td>
						<td class="careertitle2">(주)티맥스소프트/경기/~08.15</td>
						<td>비트캠프</td>
						<td>2020.08.05</td>
						<td>123</td>
					</tr>
					<tr>
						<td>42</td>
						<td class="careertitle2">(주)넥스트아이씨티/서울/수시모집</td>
						<td>비트캠프</td>
						<td>2020.08.05</td>
						<td>94</td>
					</tr>
					<tr>
						<td>41</td>
						<td class="careertitle2">(주)골프존/서울/~08.09</td>
						<td>비트캠프</td>
						<td>2020.08.05</td>
						<td>98</td>
					</tr>
					<tr>
						<td>40</td>
						<td class="careertitle2">(주)티맥스소프트/경기/~08.03</td>
						<td>비트캠프</td>
						<td>2020.07.31</td>
						<td>121</td>
					</tr>
					<tr>
						<td>39</td>
						<td class="careertitle2">(주)에이치엠솔루션/서울/~08.28</td>
						<td>비트캠프</td>
						<td>2020.07.30</td>
						<td>153</td>
					</tr>
					<tr>
						<td>38</td>
						<td class="careertitle2">(주)스펙트라/서울/~08.05</td>
						<td>비트캠프</td>
						<td>2020.07.30</td>
						<td>138</td>
					</tr>
					<tr>
						<td>37</td>
						<td class="careertitle2">(주)블루비즈넷/서울/~07.23</td>
						<td>비트캠프</td>
						<td>2020.07.28</td>
						<td>103</td>
					</tr>
					<tr>
						<td>36</td>
						<td class="careertitle2">(주)비아엘/서울/수시모집</td>
						<td>비트캠프</td>
						<td>2020.07.28</td>
						<td>119</td>
					</tr>
					<tr>
						<td>35</td>
						<td class="careertitle2">(주)컴트루테크놀로지/서울,세종/~07.31</td>
						<td>비트캠프</td>
						<td>2020.07.23</td>
						<td>150</td>
					</tr>
					<tr>
						<td>34</td>
						<td class="careertitle2">(주)내담씨앤씨/서울,경기/상시모집</td>
						<td>비트캠프</td>
						<td>2020.07.22</td>
						<td>110</td>
					</tr>
					<tr>
						<td>33</td>
						<td class="careertitle2">(주)유알피시스템/서울,경기/상시모집</td>
						<td>비트캠프</td>
						<td>2020.07.22</td>
						<td>119</td>
					</tr>
					<tr>
						<td>32</td>
						<td class="careertitle2">(주)가디언넷/서울/채용마감</td>
						<td>비트캠프</td>
						<td>2020.07.21</td>
						<td>109</td>
					</tr>
					<tr>
						<td>31</td>
						<td class="careertitle2">(주)넥스트아이씨티/서울/수시모집</td>
						<td>비트캠프</td>
						<td>2020.07.17</td>
						<td>118</td>
					</tr>
				</table>
				<div id="paging">
					<div class="num1">1</div>
					<div class="num">2</div>
					<div class="num">3</div>
				</div>
			</div>
			<!--*************content end******************-->
			<%@ include file="template/footer.jspf"%>
</body>
</html>