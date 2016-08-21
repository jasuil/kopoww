<!-제목: 이용후기 글 삭제->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>이용후기 글 삭제</h1>
<% 
	String k22_commentnums = request.getParameter("commentnum"); //  id
	String k22_ids = request.getParameter("id"); //  id
	String k22_comments = new String(request.getParameter("comadd").getBytes("8859_1"),"utf-8"); //  id
	int numb= Integer.parseInt(k22_commentnums);
	int id= Integer.parseInt(k22_ids);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.0.6:33060/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	
	String sql="insert into comment values("+id+", '"+k22_comments+"',"+numb+");";
	stmt.executeUpdate( sql );
	stmt.close();
	conn.close();
	
%>

<script>
alert("글이 입력되었습니다.");
document.location="gongji_list.jsp";
</script>
</body>
</html>