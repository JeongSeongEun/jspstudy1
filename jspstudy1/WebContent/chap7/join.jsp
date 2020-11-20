<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입화면</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="join" class="chap7.Member"></jsp:useBean>
<jsp:setProperty property="*" name="join"/>
<table>
<caption>회원정보</caption>
<tr>
<td>아이디</td>
<td><jsp:getProperty property="id" name="join"/></td>
</tr>
<tr>
<td>비밀번호</td>
<td><jsp:getProperty property="pass" name="join"/></td>
</tr>
<tr>
<td>이름</td>
<td><jsp:getProperty property="name" name="join"/></td>
</tr>
<tr>
<td>성별</td>
<td><jsp:getProperty property="gender" name="join"/>, <%=join.getGender()==1?"남자":"여자" %></td>
</tr>
<tr>
<td>성별</td>
<td><jsp:getProperty property="gender2" name="join"/></td>
</tr>
<tr>
<td>나이</td>
<td><jsp:getProperty property="age" name="join"/></td>
</tr>
<tr>
<td>이메일</td>
<td><jsp:getProperty property="email" name="join"/></td>
</tr>
</table>
</body>
</html>