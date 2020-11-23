<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
1. 파라미터값을 Board객체에 저장하기 => useBean태그사용
	원글정보 : num, grp, grplevel,grpstep
	답글정보: name, pass, subject, content =>등록정보
2. 같은 grp 값을 사용하는 게시물들의 grpstep값을 증가하기.
	void BoardDao.grpStepAdd(grp, grpstep)
3. Board 객체를 db에 insert하기
	num: maxnum+1
	grp:원글과 동일.
	grplevel: 원글+1
	grpstop: 원글 +1
4. 등록성공시: "답변등록 완료"메세지 출력 후, list.jsp로 페이지 이동
	등록실패시: "답변등록시 오류발생" 메시지 출력후, replyForm.jsp로 페이지 이동
 --%>
 <%
 request.setCharacterEncoding("UTF-8");
 %>
 <jsp:useBean id="b" class="model.Board"></jsp:useBean>
<jsp:setProperty name="b" property="*"/>
<%--
	b객체 파라미터 정보
	num: 원글의 grp정보
	grp: 원글의 grp정보
	grplevel: 원글의 grplevel정보
	grpstep: 원글의 grpstep정보
	
	name: 입력된 글쓴이 정보
	pass: 입력된 비밀번호 정보
	subject: 입력된 제목 정보
	content: 입력된 내용 정보
 --%>
<%
BoardDao dao=new BoardDao();
dao.grpStepAdd(b.getGrp(),b.getGrpstep());
int grplevel=b.getGrplevel();
int grpstep=b.getGrpstep();
int num=dao.maxnum();
String msg="답변등록시 오류 발생";
String url="replyForm.jsp?num="+b.getNum();
b.setNum(++num);
b.setGrplevel(grplevel+1);
b.setGrpstep(grpstep+1);
if(dao.insert(b)){
	msg="답변등록 완료";
	url="list.jsp";
}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>