<%@page import="java.util.Random"%>
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
	}
	
	span {
		border-bottom:5px solid darkgreen;
	}
	
	div.whole {
		width:auto;
		margin:auto;
		padding:auto;
	}
	
	div.seat {
		float:left;
		width:300PX;
	}
	
	td {
		border:1px solid black;
		text-align: center;
		width:130px;
		height:50px;
	}
</style>
</head>
<body>
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
	
	String[] seat = new String[personnel]; // 번호가 들어있는 자리 배열
	
	for(int i = 0; i < personnel; i++) {
		String num = Integer.toString(i+1);
		
		seat[i] = num;
		
		if(r != null) {
			for(int j = 0; j < r.length; j++) {
				if (r[j].equals(num)) {
					seat[i] = "X";
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
		for(int i = 1; i <= r.length; i++) {
			for(int j = 0; j < personnel; j++) {
				int rIndex = personnel-i;
				
				if(seat[j].equals("X")) {
					String temp = seat[j];
					seat[j] = seat[rIndex];
					seat[rIndex] = temp;
					
					break;
				}
			}
		}
	}
%>

<h1><span>자리 배치 결과</span></h1>
	<div class = "whole">
		<% for(int i = 0; i < division; i++) { %>
			<div class = "seat">
				<table>
					<% for(int j = 0; j < s; j++) { 
							if(seat.length >= (index+1)) {
					%>
					<tr>
						<td><%= seat[index] %></td>
						<td><%= seat[index+1] %></td>
					</tr>
					<% 		index += 2;  
							} else if (seat.length == index){ %>
								<tr>
									<td><%= seat[index] %></td>
									<td>X</td>
								</tr>
						<% 	} else { %>
							<tr>
							<td>X</td>
							<td>X</td>
						</tr>
						<% 	}
						}%>
				</table>
			</div>
		<% } %>
	</div>
	<%= s %>
</body>
</html>
