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
		width:100px;
	}
	
	td {
		border:1px solid black;
		text-align: center;
	}
</style>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
	String p = request.getParameter("personnel");
	String d = request.getParameter("division");
	String[] r = request.getParameterValues("missingnum");
	
	int personnel = Integer.parseInt(p);
	int division = Integer.parseInt(d);
	int seat = personnel / division / 2;
%>

<h1><span>자리 배치 결과</span></h1>

<div class = "whole">
	<% for(int i = 0; i < division; i++) { %>
		<div class = "seat">
			<table>
				<% for(int j = 0; j < seat; j++) { %>
				<tr>
					<td>0</td>
					<td>1</td>
				</tr>
				<% } %>
			</table>
		</div>
	<% } %>
</div>
</body>
</html>
