<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����߻�������</title>
</head>
<body>
<%int num=Integer.parseInt("abc"); %>
<%=request.getParameter("name").trim() %>
</body>
</html>
<!-- 
error������ ������ �켱����
	1. �ش� ���������� ���� ������ ������
	<%@page errorPage="error.jsp"%>
	2. web.xml���� ����Ŭ�������� ����
	<error-page><exception-type>....
	3. web.xml ���� HTTP ���� �ڵ�� ����
	<error-page><error-code>.....
	4.��Ĺ(�������̳�, �� ���ø����̼� ����)���� �⺻���� �����ϴ� ���� ������
 -->