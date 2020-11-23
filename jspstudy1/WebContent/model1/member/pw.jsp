<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	MemberDao dao = new MemberDao();
	String pw = dao.pwSearch(id, email, tel);
	if (pw != null) {
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호찾기</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	
</script>
<body>
	<table>
		<tr>
			<th>비밀번호</th>
			<td><%="**" + pw.substring(2)%></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="닫기"
				onclick="javascript:self.close()"></td>
		</tr>
	</table>
</body>
</head>
</html>
<%
	} else {
%>
<script>
	alert("정보에 맞는 비밀번호를 찾을 수 없습니다.");
	location.href = "pwForm.jsp";
</script>
<%
	}
%>