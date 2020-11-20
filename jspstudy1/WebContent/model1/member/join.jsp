<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
1. 파라미터 정보를 Member 객체에 저장=> useBean 액션태그
2. Member 객체정보를 db에 추가.
3.  가입성공: loginForm.jsp페이지 이동
	가입실패: joinForm.jsp페이지 이동
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mem" class="model.Member"></jsp:useBean>
<%--파라미터와 Member 객체의 프로퍼티가 값은경우 setProperty를 이용하여 Member 객체에 파라미터 값이 저장됨 .--%>
<jsp:setProperty property="*" name="mem"/>
<%
	MemberDao dao=new MemberDao();
	int result=dao.insert(mem);
	String msg="회원가입 실패";
	String url="joinForm.jsp";
	if(result>0){
		msg=mem.getName()+"님 회원가입 완료";
		url="loginForm.jsp";
	}
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
</body>
</html>