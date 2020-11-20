<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emp테이블읽어 화면에 출력하기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%
//드라이버 설정
Class.forName("org.mariadb.jdbc.Driver"); //클래스 정보 로드
//Connection 생성
Connection conn=DriverManager.getConnection("jdbc:mariadb://localhost:3307/classdb","scott","1234");
//sql구문 전달 객체 생성
Statement stmt=conn.createStatement();
//sql구문 실행
ResultSet rs=stmt.executeQuery("select * from student");
//ResultSetMetaData: 조회된 레코드의 정보 저장
ResultSetMetaData rsmt=rs.getMetaData();
%>
<table>
<tr>
<%
//getColumnCount(): 조회된 컬럼의 갯수
//getColumnName(): 첫번째 조회된 컬럼의 이름
for(int i=1; i<=rsmt.getColumnCount();i++){ %>
<th><%=rsmt.getColumnName(i) %></th>
<%} %></tr>
<%while(rs.next()){ 
%>
<tr>
<%
//getString(i):첫번째 칼럼값
for(int i=1; i<=rsmt.getColumnCount();i++){ %>
<td><%=rs.getString(i) %></td>
<%} %>
</tr>
<%} %>
</table>

</body>
</html>