<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 내용보기</title>
<link rel="stylesheet" href="../css/main.css">
<%request.setCharacterEncoding("UTF-8"); 
String name=request.getParameter("name");%>
<%--
	chap7.Book book=new chap7.Book();
	request.setAttribute("book",book);
	scope속성이 생략된 경우: page영역임
	pageContext.setAttribute("book",book);
 --%>
<jsp:useBean id="book" class="chap7.Book" scope="request"/>
<%-- 
property="*": 파라미터 이름과 프로퍼티 이름이 같은 값을 book객체에 저장함.
book.setName(request.getPrameter("name"))
book.setTitle(request.getPrameter("title"))
book.setContent(request.getPrameter("content"))
 --%>
<jsp:setProperty property="*" name="book"/>
<%--파라미터와 프로퍼티가 다른경우 
book.setName(request.getPrameter("writer"))
--%>
<jsp:setProperty property="name" param="writer" name="book"/>
</head>
<body>
<table><caption>방명록 조회</caption>
<tr><td>작성자</td>
<td><jsp:getProperty name="book" property="name"/>,<%=book.getName() %></td>
</tr>
<tr><td>제목</td>
<td><jsp:getProperty name="book" property="title"/>,<%=book.getTitle() %></td>
</tr>
<tr><td>내용</td>
<td><jsp:getProperty name="book" property="content"/>,<%=book.getContent() %></td>
</tr>

</table>
</body>
</html>