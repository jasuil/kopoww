<!-����: DB ���̺����->
<!-��¥: 2016.07.24->
<!-����: ¯����->
<!-�ϰ���� ��: jsp�� ���� �� �վȿ� �ּ��̴�!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root", "1212");
		Statement k22_stmt = conn.createStatement();
		String k22_sql="drop table book;";
		PrintWriter pw = response.getWriter();

		try{k22_stmt.execute(k22_sql); //���ܰ� �߻��� �޽����� ���� �����ش�.
		   }catch(Exception e){
			   pw.printf(e+"<br>");
		}		
		try{
			k22_sql="drop table operate;";
			k22_stmt.execute(k22_sql);}catch(Exception e2){
				pw.printf(e2+"%d��° ���ܹ߻�\n",2);
				}
k22_stmt.close();
conn.close();
%>
<script>
document.location="f_01.jsp";
</script>
</body>
</html>