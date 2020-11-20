<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String login=(String) session.getAttribute("login");
MemberDao dao=new MemberDao();
Member loginMember=null;
if(login.equals("admin"))
	loginMember = dao.selectOne(login);
else
	loginMember= dao.selectOne(id);
String msg=null;
String url=null;
if(login==null){
	msg="로그인 하세요";
	url="loginForm.jsp";
}else if(!login.equals("admin") && !id.equals(login)){
	msg="본인만 탈퇴가 가능합니다.";
	url="main.jsp";
}else if(id.equals("admin")){
	msg="탈퇴 불가";
	url="list.jsp";
}else if(!(loginMember.getPass().equals(pass))){
	msg="비밀번호가 틀림";
	url="deleteForm.jsp?id="+id;
}else{
	int result=dao.delete(id);
	if(result>0){
		msg="삭제성공";
		if(login.equals("admin"))
			url="list.jsp";
		else
			url="logout.jsp";
	}else{
		if(login.equals("admin")){
			msg="삭제 실패";
			url="list.jsp";
		}else{
			msg="탈퇴실패";
			url="info.jsp?id="+id;
		}
	}
}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>