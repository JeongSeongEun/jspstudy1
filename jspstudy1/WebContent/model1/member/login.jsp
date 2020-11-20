<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
1. 파라미터값 저장
2. db의 정보를 읽어서(Member MemberDao.selectOne(id)), 아이디와 비밀번호를 비교.
3. 아이디가 없는경우: 아이디가 없습니다. 메시지 출력후 loginForm.jsp 페이지 이동.
      비밀번호가 틀린경우: 비밀번호가 틀립니다. 메시지출력후 loginForm.jsp페이지 이동.
      아이디, 비밀번호 일치.
      -session객체에 로그인 정보 저장
      -'이름'님이 로그인 했습니다. 메시지 출력후, main.jsp 페이지 이동
--%>
<%
String msg="아이디를 확인하세요";
String url="loginForm.jsp";
//1.파라미터 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
//2.db정보읽기
Member mem=new MemberDao().selectOne(id);
//3.아이디, 비밀번호 검증
if(mem!=null){
	if(pass.equals(mem.getPass())){ //비밀번호가 같은경우. 로그인 성공
		session.setAttribute("login", id); //로그인 정보 저장
		msg=mem.getName()+"님이 로그인 했습니다.";
		url="main.jsp";
	}else{
		msg="비밀번호가 틀립니다.";
	}
}
%>
<script>
alert("<%=msg%>")
location.href="<%=url%>";
</script>
