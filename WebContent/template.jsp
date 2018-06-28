<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	body {	
		background-color:lightyellow;
	}
	
	h1 {
		text-align: center;
		margin:50px;
	}
	
	span {
		border-bottom:5px solid darkgreen;
	}
	
	div {
		width:380px;
		margin:auto;
		padding:auto;
	}
	
	button {
		margin-top:20px;
		width:180px;
		height:55px;
		border:2px solid darkgreen;
		background-color: transparent;
		font-size: 18px;
		color:darkgreen;
	}
	
	button:hover {
		background-color:darkgreen;
		color:white;
	}
</style>
</head>
<body>
 <h1><span>자리 배치 프로그램</span></h1>
 <div>
	 <button onclick="location='same_template.jsp'">여고 / 남고</button>
	 <button onclick="location='coed_template.jsp'">남녀공학</button>
 </div>
</body>
</html>