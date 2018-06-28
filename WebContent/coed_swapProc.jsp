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
	
	String m = request.getParameter("m_personnel");
	String w = request.getParameter("w_personnel");
	String d = request.getParameter("division");
	String[] r_m = request.getParameterValues("missingnum_m"); // 결번을 배열로 받아온다
	String[] r_w = request.getParameterValues("missingnum_w");
	
	int man = Integer.parseInt(m);
	int woman = Integer.parseInt(w);
	
	int personnel = man + woman; // 인원 수
	int division = Integer.parseInt(d); // 분단 수
	int s = 0;
	
	if(man > woman) {
		s = man / division;
	} else {
		s = woman / division;
	}
	
	int index = 0; // 인원 수 대로 모두 출력하기 위한 인덱스 넘버
	int rIndex = 0;
	int width = 300 * division;
	
	String[] seat_m = new String[Integer.parseInt(m)]; // 번호가 들어있는 자리 배열
	String[] seat_w = new String[Integer.parseInt(w)];
	
	for(int i = 0; i < seat_m.length; i++) {
		String num = Integer.toString(i+1);
		
		seat_m[i] = num;
		
		if(r_m != null) {
			for(int j = 0; j < r_m.length; j++) {
				if(Integer.parseInt(r_m[j]) <= seat_m.length) {
					if (r_m[j].equals(num)) {
						seat_m[i] = "X";
						rIndex++;
					} 
				}
			}
		}
	}

	for(int i = 0; i < seat_m.length / 2; i++) { // 자리 바꾸기
		int a, b = 0;
		a = random.nextInt(seat_m.length);
		b = random.nextInt(seat_m.length);
		
		if(a == b) {
			b = random.nextInt(seat_m.length);
		}
		
		String temp;
		
		temp = seat_m[a];
		seat_m[a] = seat_m[b];
		seat_m[b] = temp;
	}
	
	// 결번 처리
	if(r_m!= null) {
		for(int i = 1; i <= rIndex; i++) {
			for(int j = 0; j < seat_m.length; j++) {
				int rIndexx = seat_m.length-i;
				
				if(seat_m[j].equals("X")) {
					String temp = seat_m[j];
					seat_m[j] = seat_m[rIndexx];
					seat_m[rIndexx] = temp;
					
					break;
				}
			}
		}
	}
	
	/* 여자 */
	
	int rrIndex = 0;
	
	for(int i = 0; i < seat_w.length; i++) {
		String num = Integer.toString(i+1);
		
		seat_w[i] = num;
		
		if(r_w != null) {
			for(int j = 0; j < r_w.length; j++) {
				if(Integer.parseInt(r_w[j]) <= seat_w.length) {
					if (r_w[j].equals(num)) {
						seat_w[i] = "X";
						rrIndex++;
					} 
				}
			}
		}
	}
	
	for(int i = 0; i < seat_w.length / 2; i++) { // 자리 바꾸기
		int a, b = 0;
		a = random.nextInt(seat_w.length);
		b = random.nextInt(seat_w.length);
		
		if(a == b) {
			b = random.nextInt(seat_w.length);
		}
		
		String temp;
		
		temp = seat_w[a];
		seat_w[a] = seat_w[b];
		seat_w[b] = temp;
	}
	
	// 결번 처리
	if(r_w!= null) {
		for(int i = 1; i <= rrIndex; i++) {
			for(int j = 0; j < seat_w.length; j++) {
				int rIndexx = seat_w.length-i;
				
				if(seat_w[j].equals("X")) {
					String temp = seat_w[j];
					seat_w[j] = seat_w[rIndexx];
					seat_w[rIndexx] = temp;
					
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
		width:<%= width %>px;
		margin:auto;
		padding:auto;
	}
	
	div.seat {
		float:left;
		width:300PX;
	}
	
	td {
		text-align: center;
		width:130px;
		height:50px;
		font-size: 18px;
	}
	
	caption {
		font-size: 22px;
		margin-bottom:10px;
	}
	
	td.m {
		background-color: blue;
		border: 1px solid blue;
	}
	
	td.w {
		background-color: pink;
		border: 1px solid pink;
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
				case 1 : index = 1; break;
				case 2 : index = 2; break;
				default : index = 3;
			}	%>
			<div class = "seat">
				<table>
				<caption><%= i+1 %>분단</caption>
					<% for(int j = 0; j < s; j++) { %>
					<tr>
						<td class = "m"><% if((index+1) <= seat_m.length) { %><%= seat_m[index] %><% } %></td>
						<td class = "w"><% if((index+1) <= seat_w.length) { %><%= seat_w[index] %><% } %></td>
					</tr>
					<% 		index += division;  
					}%>
				</table>
			</div>
		<% } %>
	</div><br>
	<form>
		<input type="button" value="다시 바꾸기" onClick="window.location.reload()">
		<input type="button" value="홈으로" onClick="location='index.jsp'">
	</form>	
</body>
</html>
