<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>간단한 select구문 실행결과 확인</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String sql = request.getParameter("sql");
	%>
	<form method="post">
		<!--action="Test1.jsp"(생략가능)  -->
		<textarea rows="5" cols="60" name="sql"><%=(sql == null) ? "" : sql%></textarea>
		<br> <input type="submit" value="실행">
	</form>
	<%
		Connection conn = null;
		if (sql != null && !sql.trim().equals("")) {
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/classdb", "scott", "1234");
				//PreparedStatement: Statement 하위 인터페이스. sql구문을 미리 db서버에 전송
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery(sql);
				ResultSetMetaData rsmt = rs.getMetaData();
				PreparedStatement pstmt2 = conn.prepareStatement("select count(*) from (" + sql + ") a");
				ResultSet rs2 = pstmt2.executeQuery();
				rs2.next();
				int cnt = rs2.getInt(1); //조회된 레코드 건수
	%>
	<table>
		<tr>
			<td colspan="<%=rsmt.getColumnCount()%>" style="text-align: right">조회된 레코드
				수: <%=cnt%></td>
		</tr>
		<tr>
			<%
				for (int i = 1; i <= rsmt.getColumnCount(); i++) {
			%>
			<th><%=rsmt.getColumnName(i)%></th>
			<%
				}
			%>
		</tr>


		<%
			while (rs.next()) {
		%>
		<tr>
			<%
				for (int i = 1; i <= rsmt.getColumnCount(); i++) {
			%>
			<td><%=rs.getString(i)%></td>
			<%
				}
			%>
			<%
				}
			%>
		</tr>
	</table>
	<%
		} catch (Exception e) {
	%>
	<h1>sql구문 오류입니다.</h1>
	<h1><%=e.getMessage()%></h1>
	<h1>
		sql 구문<%=sql%></h1>
	<%
		} finally {
				conn.close();
			}
		}
	%>
</body>
</html>