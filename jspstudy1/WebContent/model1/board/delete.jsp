<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("UTF-8"); %>
<%
int num=Integer.parseInt(request.getParameter("num"));
String pass= request.getParameter("pass");

String msg="게시글의 비밀번호가 틀렸습니다";
String url="deleteForm.jsp?num="+num;
BoardDao dao=new BoardDao();
Board board=dao.selectOne(num);
if(board==null){
	msg="없는 게시글 입니다.";
	url="list.jsp";
}else{
	//pass: 입력된 비밀번호
	//board.getPass(): db에 등록된 비밀번호
	if(pass.equals(board.getPass())){
		if(dao.delete(num)){
			msg="게시글 삭제성공";
			url="list.jsp";
		}else{
			msg="게시글 삭제 실패";
			url="info.jsp?num="+num;
		}
	}
}

%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>