<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--encypy="multipart/form-data"로 action되었으므로 request객체를 직접사용할 수없다.
=>MultipartRequest => 객체를 이용하여 사용됨
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 결과</title>
</head>
<body>
<%
//application.getRealPath("/"): 웹 어플리케이션 폴더 경로.
//uploadPath: 웹어플리케이션 폴더 경로/upload/=>서버의 업로드파일이 저장되는 위치
String uploadPath = application.getRealPath("/")+"upload/";
int size=10*1024*1024;
File f=new File(uploadPath);
if(!f.exists()) f.mkdirs(); //폴더 생성
/* 
new MultipartRequest
	request: 파라미터정보, 파일 정보, 파일 내용 저장하고있는 요청객체.
	uploadPath: 업로드되는 폴더 정보
	size: 업로드 되는 최대 파일의 크기 
	UTF-8: 파라미터 인코딩 설정
 */
MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8");
String name=multi.getParameter("name");
String title=multi.getParameter("title");
String fname=multi.getFilesystemName("file1");
%>
업로드 위치:<%= uploadPath %><br>
올린 사람:<%=name %><br>
제목:<%=title %><br>
파일:<a href="<%=fname %>"><%=fname %></a><br>
</body>
</html>