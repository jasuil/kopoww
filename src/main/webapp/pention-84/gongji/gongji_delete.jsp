<!-����: �������� ����->
<!-��¥: 2016.07.25->
<!-����: ¯����->
<!-�ϰ���� ��: jsp�� ���� �� �վȿ� �ּ��̴�!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>�������� ����</h1>
<%
	String k22_ids = request.getParameter("key"); //  id
	int id= Integer.parseInt(k22_ids);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	
	String sql="delete from gongji where id="+id+";";
	stmt.executeUpdate( sql );
	stmt.close();
	conn.close();
	
%>

���� ������ �Ǿ����ϴ�.
<script>
document.location="gongji_list.jsp";
</script>
</body>
</html>