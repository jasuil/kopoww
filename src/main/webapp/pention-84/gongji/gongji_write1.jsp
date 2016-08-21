<!--공지사항 입력-->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>공지사항 보기</h1>
<%
	String k22_ids = request.getParameter("key"); //  id
	String k22_title = new String(request.getParameter("title").getBytes("8859_1"),"utf-8"); //  제목
	String k22_text = new String(request.getParameter("text").getBytes("8859_1"),"utf-8"); //  내용
	int id= Integer.parseInt(k22_ids);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","koposw");
	Statement stmt =conn.createStatement();
	
	String sql="insert into gongji values("+id+",'"+ k22_title+"',curdate(),'"+k22_text+"');";
	stmt.executeUpdate( sql );
	stmt.close();
	conn.close();
	
%>
<script>
document.location="gongji_list.jsp";
</script>
</body>
</html>