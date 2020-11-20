<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>오류발생페이지</title>
</head>
<body>
<%int num=Integer.parseInt("abc"); %>
<%=request.getParameter("name").trim() %>
</body>
</html>
<!-- 
error페이지 설정시 우선순위
	1. 해당 페이지에서 오류 페이지 설정시
	<%@page errorPage="error.jsp"%>
	2. web.xml에서 예외클래스별로 설정
	<error-page><exception-type>....
	3. web.xml 에서 HTTP 오류 코드로 설정
	<error-page><error-code>.....
	4.톰캣(웹컨테이너, 웹 어플리케이션 서버)에서 기본으로 제공하는 에러 페이지
 -->