<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
1. 로그아웃 상태: 로그인이 필요합니다. loginForm.jsp페이지 이동
2. 로그인 상태: 
	일반사용자: 관리자만 가능합니다. main.jsp 페이지 이동
3. 관리자 로그인 상태
	db에서 모든 회원 정보를 조회하여 List<Member>객체로 리턴
4. List 객체를 화면에 출력하기 
 --%>
<%
	String login = (String) session.getAttribute("login");
	if (login == null) {
%>
<script>
	alert("로그인이 필요합니다.");
	location.href = "loginForm.jsp";
</script>
<%
	} else if (!login.equals("admin")) {
%>
<script>
	alert("관리자만 사용가능한 기능입니다.");
	location.href = "main.jsp";
</script>
<%
	} else {
		List<Member> memberList = new MemberDao().list();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table>
		<caption>회원 목록</caption>
		<tr>
			<th>아이디</th>
			<th>사진</th>
			<th>이름</th>
			<th>성별</th>
			<th>전화</th>
			<th>&nbsp;</th>
		</tr>
		<%
			for (Member m : memberList) {
		%>
		<tr>
			<td><a href="info.jsp?id=<%=m.getId()%>"><%=m.getId()%></a></td>
			<td><img src="picture/sm_<%=m.getPicture()%>" width="20"
				height="30"></td>
			<td><%=m.getName()%></td>
			<td><%=m.getGender() == 1 ? "남자" : "여자"%></td>
			<td><%=m.getTel()%></td>
			<td><a href="updateForm.jsp?id=<%=m.getId()%>">[수정]</a> <%
 	if (!m.getId().equals("admin")) {
 %> <a href="deleteForm.jsp?id=<%=m.getId()%>">[강제탈퇴]</a> <%
 	}
 %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
<%
	}
%>