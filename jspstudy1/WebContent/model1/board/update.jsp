<%@page import="model.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
1. 파라미터 정보들을 Board 객체저장
2. 비밀번호 일치
	첨부파일의 변경이 없는굥우 file2 파라미터의 내용을 다시 저장하기
	파라미터의 내용을 해당 게시물의 내용을 수정하기
		boolean BoardDao.update(Board)
	수정성공: 수정성공 메시지 출력 후 info.jsp 페이지 이동
	수정실패: 수정 실패메시지 출력후 updateForm.jsp페이지로 이동
3. 비밀번호 불일치
	비밀번호 오류 메시지 출력하고 , updateForm.jsp페이지 이동
 --%>
<%
	Board board = new Board();
	String path = application.getRealPath("/") + "model1/board/file/";
	MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8");
	board.setNum(Integer.parseInt(multi.getParameter("num")));
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setSubject(multi.getParameter("subject"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));
	//파일부분의 수정이 없는경우
	if (board.getFile1() == null || board.getFile1().equals("")) {
		board.setFile1(multi.getParameter("file2"));
	}
	BoardDao dao = new BoardDao();
	Board dbBoard = dao.selectOne(board.getNum());
	String msg = "비밀번호가 틀렸습니다.";
	String url = "updateForm.jsp?num=" + board.getNum();
	if (board.getPass().equals(dbBoard.getPass())) {
		if (dao.update(board)) {
			msg = "게시글 수정 완료";
			url = "info.jsp?num=" + board.getNum();
		} else {
			msg = "게시물 수정 실패";
		}
	}
%>
<script>
 alert("<%=msg%>");
 location.href="<%=url%>";
</script>
