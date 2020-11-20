<%@page import="java.awt.Graphics2D"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>원본이미지와 썸네일 이미지 보기</title>
</head>
<body>
<%
//이미지 파일 업로드 위치 지정
String path=application.getRealPath("/")+"thumnail/";
int size=10*1024*1024; //최대 업로드 크기
//업로드 실행
MultipartRequest multi=new MultipartRequest(request, path, size,"UTF-8");
//fname:<input type="file" name="picture">선택한 파일의 이름
//		업로드된 파일의 이름
String fname=multi.getFilesystemName("picture");
//new File(path+fname):업로드된 파일의 절대 경로.
//bi: 이미지 파일을 읽어서 메모리에 저장
BufferedImage bi=ImageIO.read(new File(path+fname));
int width=bi.getWidth()/5; //원본이미지 가로크기의 5분의1
int height=bi.getHeight()/5; //원본이미지 세로크기의 5분의 1
BufferedImage thumb=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
Graphics2D g=thumb.createGraphics();
g.drawImage(bi, 0, 0, width, height,null);
File f=new File(path+"sm_"+fname);
ImageIO.write(thumb, "jpg", f);
%>
<h3>원본이미지</h3><img src="<%=fname%>"><p>
<h3>썸네일 이미지</h3><img src="sm_<%=fname %>"><p>
</body>
</html>