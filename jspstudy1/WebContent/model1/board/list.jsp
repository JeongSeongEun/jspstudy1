<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
1. 한페이지당 10건의 게시물을 출력하기 pageNum파라미터 값을 저장 => 없는 경우는 1로 설정하기
2. 최근 등록된 게시물이 가장 위에 배치함
3. db에서 해당 페이지에 출력될 내용을 조회하여 화면에 출력
	게시물을 출력부분
	페이지 구분 출력부분
 --%>
 <%
 int pageNum=1;
 try{
	 pageNum = Integer.parseInt(request.getParameter("pageNum"));
 }catch(NumberFormatException e){
	 e.printStackTrace();
 }
 int limit=10;
 BoardDao dao=new BoardDao();
 int boardcount=dao.boardCount(); //전체 게시물 등록 갯수
 List<Board> list=dao.list(pageNum,limit);
 int maxpage=(int)((double)boardcount/limit+0.95);
 int startpage=((int)(pageNum/10.0+0.9)-1)*10+1;
 int endpage=startpage+9;
 if(endpage>maxpage)
	 endpage=maxpage;
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<table><caption>게시판 목록</caption>
<%if(boardcount ==0){ %>
<tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
<%}else { %>
<tr><td colspan="5" style="text-align: right">글개수:<%=boardcount %></td></tr>
<tr><th width="8%">번호</th><th width="50%">제목</th><th width="14%">작성자</th><th width="17%">등록일</th><th width="11%">조회수</th></tr>
<%for (Board b:list){ %>
<tr><td><%=b.getNum() %></td>
<td style="text-align: left"><a href="info.jsp?num=<%=b.getNum() %>"><%=b.getSubject() %></a></td>
<td><%=b.getName() %></td><td><%=b.getRegdate() %></td><td><%=b.getReadcnt() %></td></tr>
<%} %>
<tr>
<td colspan="5">
<%if(pageNum <=1){ %>[이전]<%}else{ %>
<a href="list.jsp?pageNum=<%=pageNum-1%>">[이전]</a><%} %>
<%for(int a=startpage; a<=endpage; a++){ %>
<%if (a==pageNum){ %>[<%=a %>]<%}else{ %>
<a href="list.jsp?pageNum=<%=a%>">[<%=a %>]</a>
<%}
} %>
<%if(pageNum>=maxpage){ %>[다음]<%}else{ %>
<a href="list.jsp?pageNum=<%=pageNum+1%>">[다음]</a>
<%} %>
</td>
</tr>
<%} %>
<tr><td colspan="5" style="text-align: right"><a href="writeForm.jsp">[글쓰기]</a></td></tr>
</table>
</body>
</html>