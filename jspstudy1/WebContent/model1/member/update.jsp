<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
1. 모든 파라미터 정보를 Member객체에 저장 => useBean 태그
2. 입력된 비밀번호와, db에 저장된 비밀번호 비교
	-같지않은경우: "비밀번호 오류" 메세지 출력 updateForm.jsp 페이지 이동
3. 파라미터를 저장하고있는 Member 객체를 이용하여 db정보 수정.
	int MemberDao.update(Member)
	결과가 0이하면 수정실패 메세지 출력후, updateForm.jsp페이지 이동. 1이상이면 수정 성공 info.jsp페이지 이동
 --%>
 <%
 request.setCharacterEncoding("UTF-8");
 %>
 <jsp:useBean id="mem" class="model.Member"></jsp:useBean>
 <jsp:setProperty property="*" name="mem"/>
 <%
 MemberDao dao=new MemberDao();
 String login=(String)session.getAttribute("login");
/*  Member dbmem=dao.selectOne(mem.getId()); */
Member dbmem=null;
if(login.equals("admin"))
	dbmem=dao.selectOne(login);
else
	dbmem=dao.selectOne(mem.getId());
 String msg="비밀번호가 틀렸습니다";
 String url="updateForm.jsp?id="+mem.getId();
 if(mem.getPass().equals(dbmem.getPass())){
	 int result=dao.update(mem);
	 //int result=0;
	 if(result>0){
		 msg="수정성공";
		 url="info.jsp?id="+mem.getId();
	 }else{
		 msg="수정실패";
	 }
 }
 %>
 <script>
 alert("<%=msg%>");
 location.href="<%=url%>";
 </script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>