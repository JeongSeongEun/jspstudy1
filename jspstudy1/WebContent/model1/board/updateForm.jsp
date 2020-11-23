<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
1. num값에 해당하는 게시물을 조회
2. 조회된 게시물을 화면에 출력
--%>
<%
int num=Integer.parseInt(request.getParameter("num"));
Board b=new BoardDao().selectOne(num);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정 화면</title>
<link rel="stylesheet" href="../../css/main.css">
<script>
function file_delete() {
	document.f.file2.value="";
	file_desc.style.display="none";
}
</script>
</head>
<body>
<form action="update.jsp" method="post" enctype="multipart/form-data" name="f">
<input type="hidden" name="num" value="<%=b.getNum()%>">
<input type="hidden" name="file2" value="<%=b.getFile1()==null?"":b.getFile1()%>">
<table><caption>게시판 수정 화면</caption>
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=b.getName()%>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=b.getSubject()%>"></td></tr>
<tr><td>내용</td><td><textarea rows="15" name="content"><%=b.getContent() %></textarea></td></tr>
<tr><td>첨부파일</td><td style="text-align: left">
<%
if(b.getFile1() != null &&(!b.getFile1().equals(""))){
%>
<div id="file_desc"><%=b.getFile1()%><a href="javascript:file_delete()">[첨부파일 삭제]</a></div>
<%} %>
<input type="file" name="file1"></td></tr>
<tr><td colspan="2">
<a href="javascript:document.f.submit()">[게시물 수정]</a></td></tr>
</table>
</form>
</body>
</html>