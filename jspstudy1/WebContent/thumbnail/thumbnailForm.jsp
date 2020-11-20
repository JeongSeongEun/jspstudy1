<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
thumbnail 이미지 예제: 큰이미지를 작은 이미지로 생성.
=>이미지 업로드하면서, 작은이미지 생성
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>원본이미지 올리기</title>
</head>
<body>
<form action="thumbnail.jsp" method="post" enctype="multipart/form-data">
원본이미지: <input type="file" name="picture">
<input type="submit" value="썸네일이미지 생성">
</form>
</body>
</html>