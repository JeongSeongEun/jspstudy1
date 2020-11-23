<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num=Integer.parseInt(request.getParameter("num"));
BoardDao dao= new BoardDao();
Board b=dao.selectOne(num); //num에 해당하는 게시물 조회
dao.readcntAdd(num); //조회수 증가
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
        <th>첨부파일</th>
        <td><%if(b.getFile1()==null || b.getFile1().equals("")){ %> &nbsp;
        <%}else{ %><a href="<%=b.getFile1()%>"><%=b.getFile1()%></a><%} %></td>
    </tr>
    <tr>
        <td colspan="2">
            <a href="replyForm.jsp?num=<%=b.getNum()%>">[답변]</a>
            <a href="updateForm.jsp?num=<%=b.getNum()%>">[수정]</a>
            <a href="deleteForm.jsp?num=<%=b.getNum()%>">[삭제]</a>
            <a href="list.jsp">[목록]</a>
        </td>
    </tr>
</table>
</body>
</html>
