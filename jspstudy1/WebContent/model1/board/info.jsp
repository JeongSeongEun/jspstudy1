<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num=Integer.parseInt(request.getParameter("num"));
BoardDao dao= new BoardDao();
Board b=dao.selectOne(num);
dao.readcntAdd(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 상세보기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table>
<caption>게시글 상세보기</caption>
 <tr>
        <th width="20%">글쓴이</th>
        <td style="text-align: left"><%=b.getName()%></td>
    </tr>
    <tr>
        <th width="20%">제목</th>
        <td style="text-align: left"><%=b.getSubject()%></td>
    </tr>
    <tr>
        <th width="20%">내용</th>
        <td style="text-align: left; vertical-align: text-top; height: 200px;"><%=b.getContent()%></td>
    </tr>
    <tr>
        <th width="20%">첨부파일</th>
        <td><a href="<%=b.getFile1()%>"><%=b.getFile1()%></a></td>
    </tr>
    <tr>
        <td colspan="2">
            <a href="#">[답변]</a>
            <a href="#">[수정]</a>
            <a href="#">[삭제]</a>
            <a href="list.jsp">[목록]</a>
        </td>
    </tr>
</table>
</body>
</html>
