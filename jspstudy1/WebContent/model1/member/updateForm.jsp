<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
1. id파라미터 조회
2. login정보 조회
	-로그아웃: "로그인 하세요"출력. loginForm.jsp페이지로 이동.
3. 내정보가 아니면서 , admin도 아닌경우
	-내정보만 수정가능합니다. 출력. main.jsp 페이지 이동
4. id 정보를 db에서 읽어 Member객체에 저장
5. Member 객체를 화면에 출력 
 --%>
 <%
 String id=request.getParameter("id"); //조회대상 id
 String login=(String)session.getAttribute("login"); //모든 객체로 받을수 잇어서 String으러 형변환. 
 if(login == null){
 %>
 <script>
alert("로그인하세요")
location.href="loginForm.jsp";
</script>
<%
 }else if(!id.equals(login) && !login.equals("admin")){
%>
<script>
alert("내정보만 수정이 가능합니다")
location.href="main.jsp";
</script>
<%
 } else{ //정상적인 거래. 본인거래, 관리자인경우 다른 사용자 정보
	 //mem: id에 해당하는 값 가져오기
	  Member mem=new MemberDao().selectOne(id);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정하기</title>
<script type="text/javascript">
function inputcheck(f) {
	if(f.pass.value==""){
		alert("비밀번호를 입력하세요");
		f.pass.focus();
		return false;
	}
}
function win_passchg() {
	let op="width=500, height=250, left=50, top=150";
	open("passwordForm.jsp","",op);
}
function win_upload() {
	let op="width=500, height=250, left=50, top=150";
	open("pictureForm.jsp","",op);
}
</script>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="update.jsp" name="f" method="post" onsubmit="return inputcheck(this)">
<input type="hidden" name="picture" value="<%=mem.getPicture()%>">
<table><caption>회원정보 수정</caption>
<tr><td rowspan="4" valign="bottom"><img src="picture/<%=mem.getPicture() %>" width="100" height="120" id="pic"><br><font size="1"><a href="javascript:win_upload()">사진수정</a></font>
<tr><th>아이디</th><td><input type="text" name="id" readonly value="<%=mem.getId() %>"></td></tr> <!-- 수정불가 readonly -->
<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
<tr><th>이름</th><td><input type="text" name="name" value="<%=mem.getName() %>"></td></tr>
<tr><th>성별</th><td colspan="2"><input type="radio" name="gender" value="1" <%=mem.getGender()==1?"checked":"" %>>남
<input type="radio" name="gender" value="2" <%=mem.getGender()==2?"checked":"" %>>여</td></tr>
<tr><th>전화번호</th><td colspan="2"><input type="text" name="tel" value="<%=mem.getTel() %>"></td></tr>
<tr><th>이메일</th><td colspan="2"><input type="text" name="email" value="<%=mem.getEmail() %>"></td></tr>

<tr><td colspan="3"><input type="submit" value="회원수정"><%if(!login.equals("admin") || id.equals("admin")){ %>
<input type="button" value="비밀번호 수정" onclick="win_passchg()"><%} %></td></tr>
</table>
</form>
</body>
</html>
<%} %>