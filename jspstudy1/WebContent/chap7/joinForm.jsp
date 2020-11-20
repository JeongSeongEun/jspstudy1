<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--
    입력된 내용을 join.jsp에 출력하기
        1. useBean, setProperty를 사용하기
        2. Bean 클래스의 이름은 chap7.Member로 하기
--%>
<title>회원가입</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript">
function inputcheck(f) {
	if(isNaN(f.age.value)){
		alert("나이는 숫자만 입력이 가능합니다.")
		f.age.value="";
		f.age.focus();
		return false;
	}
}
</script>
</head>
<body>
<form name="f" action="join.jsp" method="post" onsubmit="return inputcheck(this)">
<table><caption>회원가입</caption>
<tr>
<td>아이디</td>
<td><input type="text" name="id"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="pass"></td>
</tr>
<tr>
<td>이름</td>
<td><input type="text" name="name"></td>
</tr>
<tr>
<td>성별</td>
<td><input type="radio" name="gender" value="1" checked>남<input type="radio" name="gender" value="2">여 </td>
</tr>
<tr>
<td>나이</td><td><input type="text" name="age"></td>
</tr>
<tr>
<td>이메일</td><td><input type="text" name="email"></td>
</tr>
<tr><td colspan="2"><input type="submit" value="회원가입"></td></tr>
</table>
</form>
</body>
</html>