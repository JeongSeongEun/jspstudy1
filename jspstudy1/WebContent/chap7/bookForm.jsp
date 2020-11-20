<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 작성</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<form action="book.jsp" method="post">
<table>
<tr>
<td>작성자</td>
<td><input type="text" name="writer"></td>
</tr>
<tr>
<td>제목</td>
<td><input type="text" name="title"></td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="5" cols="60" name="content"></textarea></td>
</tr>
<tr>
<td colspan="2"><input type="submit" value="방명록 등록"></td>
</tr>
</table>
</form>
</body>
</html>