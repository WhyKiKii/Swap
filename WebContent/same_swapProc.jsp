<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");

	Random random = new Random();  
	
	String p = request.getParameter("personnel");
	String d = request.getParameter("division");
	String[] r = request.getParameterValues("missingnum"); // 결번을 배열로 받아온다
	
	int personnel = Integer.parseInt(p); // 인원 수
	int division = Integer.parseInt(d); // 분단 수
	int s = personnel / division / 2; // 분단의 줄 수
	if((personnel % division)!=0) {
		s += 1;
	}
	int index = 0; // 인원 수 대로 모두 출력하기 위한 인덱스 넘버
	int rIndex = 0;
	int w = 300 * division;
	
	String[] seat = new String[personnel]; // 번호가 들어있는 자리 배열
	
	for(int i = 0; i < personnel; i++) {
		String num = Integer.toString(i+1);
		
		seat[i] = num;
		
		if(r != null) {
			for(int j = 0; j < r.length; j++) {
				if(Integer.parseInt(r[j]) <= personnel) {
					if (r[j].equals(num)) {
						seat[i] = "X";
						rIndex++;
					} 
				}
			}
		}
	}
	
	for(int i = 0; i < personnel / 2; i++) { // 자리 바꾸기
		int a, b = 0;
		a = random.nextInt(personnel);
		b = random.nextInt(personnel);
		
		if(a == b) {
			b = random.nextInt(personnel);
		}
		
		String temp;
		
		temp = seat[a];
		seat[a] = seat[b];
		seat[b] = temp;
	}
	
	// 결번 처리
	if(r != null) {
		for(int i = 1; i <= rIndex; i++) {
			for(int j = 0; j < personnel; j++) {
				int rIndexx = personnel-i;
				
				if(seat[j].equals("X")) {
					String temp = seat[j];
					seat[j] = seat[rIndexx];
					seat[rIndexx] = temp;
					
					break;
				}
			}
		}
	}
%>

<style>
	body {	
		background-color:lightyellow;
	}
	
	h1 {
		text-align: center;
	}
	
	span {
		border-bottom:5px solid darkgreen;
	}
	
	div.whole {
		width:<%= w %>px;
		margin:auto;
		padding:auto;
	}
	
	div.seat {
		float:left;
		width:300PX;
	}
	
	td {
		border:2px solid darkgreen;
		text-align: center;
		width:130px;
		height:50px;
		font-size: 18px;
	}
	
	caption {
		font-size: 22px;
		margin-bottom:10px;
	}
	
	input[type=button]:hover  {
		background-color: transparent;
		color:darkgreen;
	}
	
	input[type=button]{
		margin-top:20px;
		width:145px;
		height:35px;
		font-size: 15px;
		border:2px solid darkgreen;
		background-color:darkgreen;
		color:white;
	}
</style>
</head>
<body>
<h1><span>자리 배치 결과</span></h1>
	<div class = "whole">	
		<% for(int i = 0; i < division; i++) {
			switch(i) {
				case 0 : index = 0; break;
				case 1 : index = 2; break;
				case 2 : index = 4; break;
				default : index = 6;
			}	%>
			<div class = "seat">
				<table>
				<caption><%= i+1 %>분단</caption>
					<% for(int j = 0; j < s; j++) { %>
					<tr>
						<td><% if((index+1) <= seat.length) { %><%= seat[index] %><% } %></td>
						<td><% if((index+2) <= seat.length) { %><%= seat[index+1] %><% } %></td>
					</tr>
					<% 		index += (2 * division);  
					}%>
				</table>
			</div>
		<% } %>
	</div>
	<form>
		<input type="button" value="다시 바꾸기" onClick="window.location.reload()">
		<input type="button" value="홈으로" onClick="location='index.jsp'">
	</form>
</body>
</html>
