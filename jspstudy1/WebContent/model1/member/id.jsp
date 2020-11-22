<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
1. 파라미터 저장
2. db에서 eamail과 tel을 이용하여 id값을 리턴
	id=MemberDao.idSearch(email,tel)
3. id값이 존재
	opener의 id값을 저장. 현재화면 닫기
4. id값이 없는 경우
	정보에 맞는 id를 찾을 수 없습니다. 메세지 출력후 idForm.jsp페이지로 이동
 --%>
 <%
 String email=request.getParameter("email");
 String tel=request.getParameter("tel");
 MemberDao dao= new MemberDao();
 String id=dao.idSearch(email,tel);
 if(id != null){ //id를 찾은경우
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
function idsend() {
	opener.document.f.id.value=id;
	self.close();
}
</script>
<body>
<table>
<tr><th>아이디</th>
<td><%=id.substring(0,id.length()-2)+"**" %></td>
</tr>
<tr><td colspan="2"><input type="button" value="아이디전송" onclick="idsend('<%=id.substring(0,id.length()-2) %>')"></td></tr>
</table>
</body>
</head>
</html>
<%} else{%>
<script>
alert("정보에 맞는 id를 찾을 수 없습니다.");
location.href="idForm.jsp";
</script>
<%}%>