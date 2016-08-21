<!-제목: 공지사항 삭제->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>공지사항 삭제</h1>
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

글이 삭제가 되었습니다.
<script>
document.location="gongji_list.jsp";
</script>
</body>
</html>