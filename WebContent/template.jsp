<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
		width:300px;
	}
	
	div.swap {
		margin-top:40px;
		margin-left:auto;
		margin-right:auto;
		padding:auto;
	}
	
	label {
		font-size: 15pt;
		margin-top:10px;
	}
	
	div.swap input[type=number], input[type=text], input[type=button] {
		float:right;
		margin-top:5px;
		width:70px;
	}
	
	div.swap input[type=submit], input[type=reset] {
		margin-top:20px;
		width:145px;
		height:35px;
		border:2px solid darkgreen;
		background-color: transparent;
		font-size: 15px;
		color:darkgreen;
	}
	
	div.swap input[type=submit]:hover, input[type=reset]:hover {
		background-color:darkgreen;
		color:white;
	}
	
	div#add_missingnum input[type=number], input[type=button] {
		width:40px;
		background-color:darkgreen;
		color:white;
		border:1px solid darkgreen;
	}
	
	div#add_place input[type=button]{
	 	width:40px;
	 	background-color:darkgreen;
		color:white;
		border:1px solid darkgreen;
		margin-left:5px;
	}
	
	div#add_place input[type=number]  {
		float:right;
		margin-top:5px;
		border:1px solid graytext;
	}
</style>
</head>
<body>
 <h1><span>자리 배치 프로그램</span></h1>
 <div class = "swap">
	 <form action="swap.jsp">
	 	<label>인원 수</label> <input type = "number" name = "personnel" min="20" max="40" required="required"> <br>
	 	<label>분단 수</label> <input type = "number" name = "division" min="2" max="4" required="required"> <br>
		<label>결번</label> <input type="button" value="추가" onclick="add_missing_number()"> <br>
		<div id="add_place"></div>
	 	<input type = "submit" value = "자리 바꾸기">
	 	<input type = "reset" value = "다시 입력">
	 </form>
 </div>
 
 <div id="add_missingnum" style="display:none;">
	<label>결번 번호</label> <input type="button" value="삭제" onclick="remove_missing_number(this)">
	<input type="number" min="1" max="35" name="missingnum" required="required">
</div>
 	
 <script>
		function add_missing_number() {
			var div = document.createElement('div');
			div.innerHTML = document.getElementById('add_missingnum').innerHTML;
			document.getElementById('add_place').appendChild(div);
		}
		
		function remove_missing_number(obj) {
			document.getElementById('add_place').removeChild(obj.parentNode);
		}
	</script>
</body>
</html>
