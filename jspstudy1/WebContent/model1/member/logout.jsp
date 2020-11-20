<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
0. 로그아웃하셨습니다.alert창 
세션 종료 후 loginForm.jsp로 이동
1. session로그인 정보 제거.
2. loginForm.jsp페이지 이동.
 --%>
 <%
 session.invalidate(); //기존의 session 만료, 새로운 session으로 변경
 //session.removeAttribute("login");
 //response.sendRedirect("loginForm.jsp");
 %>
 <script type="text/javascript">
 alert("로그아웃 하셨습니다.");
 location.href="loginForm.jsp";
 </script>
