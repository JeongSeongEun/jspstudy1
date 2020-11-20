<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 예제</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<!-- enctype="multipart/form-data"
파일업로드시 선택된 파일의 내용까지 서버로 전송하도록 설정.
파일 업로드하기위해 사용해야히ㅏㅁ
*주의사항: upload.jsp페이지에서는 request 객체를 직접사용 불가
:cos.jar 파일이 설정된 MultiparRequest 객체를 사용해야함.
 -->
<body>
<form action="upload.jsp" method="post" enctype="multipart/form-data">
<table>
<tr><th>올린사람</th><td><input type="text" name="name"></td></tr>
<tr><th>제목</th><td><input type="text" name="title"></td></tr>
<tr><th>파일</th><td><input type="file" name="file1"></td></tr>
<tr><td colspan="2"><input type="submit" value="전송"></td></tr>
</table>
</form>
</body>
</html>