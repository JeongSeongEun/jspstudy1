<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--1. 사용되는 패키지: java.sql 패키지에 속한 클래스
    	2. 드라이버 설정하기: Class.forName("드라이버 클래스명")
    	3. 연결객체 생성: Connection conn=DriverManger.getConnection(...)
    	4. dbms에 명령 전달 객체생성
    		Statement stmt=conn.createStatement();
    	5. sql구문 실행
    		ResultSet rs = stmt.excuteQuery("select...")
    		int cnt = stmt.excuteUpdate("insert...")
     --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JDBC연결</title>
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
ResultSet rs=stmt.executeQuery("select * from emp");
while(rs.next()){ //읽어온 레코드 한개씩 리턴
%>
<%=rs.getString(1) %>,<%=rs.getString(2) %>,
<%=rs.getString(3) %>,<%=rs.getString(4) %><br>
<%} %>
</body>
</html>