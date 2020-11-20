<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String login = (String) session.getAttribute("login");
    if (login == null) {%>
<script>
    alert("로그인하세요");
    location.href = "loginForm.jsp";
</script>
<%
} else if (!login.equals("admin") && !login.equals(id)) {
%>
<script>
    alert("본인만 탈퇴 가능합니다.");
    location.href = "main.jsp";
</script>
<%
    } else {%>
<html>
<head>
    <title>회원탈퇴 비밀번호 입력</title>
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="delete.jsp" name="f" method="post" onsubmit="return inputcheck(this)">
    <input type="hidden" name="id" value="<%=id%>">
    <table>
        <caption>회원비밀번호 입력</caption>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="탈퇴하기"></td>
        </tr>
    </table>
</form>
<script>
    function inputcheck(f) {
        if (f.pass.value == "") {
            alert("비밀번호를 입력하세요");
            f.pass.focus();
            return false;
        }
        return true;
    }
</script>
</body>
</html>
<% } %> 