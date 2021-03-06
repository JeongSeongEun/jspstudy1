<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
1. 파라미터값을 model.Board객체 저장.
	useBean사용불가.: request 정보의 파라미터와 빈 클래스의 프로퍼티 비교. request객체를 사용할 수 없음.
2. 게시물 번호 num 현재등록된 num의 최대값을 조회. 최대값 +1 등록된 게시물의 번호.
	db에서 maxnum을 구해서 +1 값으로 num설정하기
3. board 내용을 db에 등록하기.
	등록성공: 메세지 출력. list.jsp페이지 이동
	등록실패: 메세지 출력. writeForm.jsp페이지 이동
--%>
<%
	String path = application.getRealPath("/") + "model1/board/file/";
	File f = new File(path);
	if (!f.exists())
		f.mkdir();
	MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8");
	Board board = new Board();
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setSubject(multi.getParameter("subject"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	BoardDao dao = new BoardDao();
	//board table에서 num컬럼의 최대값 리턴. 최대값이 없는 경우 0으로 리턴
	String msg = "게시물 등록 실패";
	String url = "writeForm.jsp";
	int num = dao.maxnum();
	board.setNum(++num);
	board.setGrp(num);
	if (dao.insert(board)) {
		msg = "게시물 등록 성공";
		url = "list.jsp";
	}
%>
<script type="text/javascript">
alert("<%=msg%>")
location.href="<%=url%>"
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>