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
	
	div.swap {
		width:300px;
		margin-top:40px;
		margin-left:auto;
		margin-right:auto;
		padding:auto;
	}
	
	label {
		font-size: 15pt;
		margin-top:10px;
	}
	
	input[type=number], input[type=text], input[type=button] {
		float:right;
		margin-top:5px;
		width:80px;
	}
	
	input[type=submit] {
		margin-top:20px;
		width:180px;
		height:35px;
		border:2px solid darkgreen;
		background-color: transparent;
		font-size: 15px;
		color:darkgreen;
	}
	
	input[type=submit]:hover {
		background-color:darkgreen;
		color:white;
	}
	
	#add_missingnum input[type=button] {
		float:right;
		width:40px;
	}
</style>
</head>
<body>
 <h1><span>자리 배치 프로그램</span></h1>
 <div class = "swap">
	 <form action="swap.jsp">
	 	<div><label>인원 수</label> <input type = "number" min="1" max="35" required="required"></div>
	 	<div><label>분단 수</label> <input type = "number" min="1" max="4" required="required"></div>
	 	<div class="add_place"></div>
			<label>결번</label> <input type="button" value="추가" onclick="add_missing_number()"> <br>
		<br>
	 	
	 	<input type = "submit" value = "자리 바꾸기">
	 </form>
	 <div class="add_missingnum" style="display: none;">
		<label>결번 번호</label> <input type="number" name="missingnum" required="required">
		<input type="button" value="삭제" onclick="remove_missing_number(this)">
		<br>
	</div>
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
