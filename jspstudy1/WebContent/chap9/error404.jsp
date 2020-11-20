<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>요청페이지 없음</title>
</head>
<body>
<h1>요청하신 페이지는 존재하지 않습니다.</h1>
<h2>URL주소가 올바른지 확인해주세요</h2>
<h3>요청된 URL:<%=request.getRequestURL() %></h3>
<h3>요청된 URI:<%=request.getRequestURI() %></h3>
</body>
</html>