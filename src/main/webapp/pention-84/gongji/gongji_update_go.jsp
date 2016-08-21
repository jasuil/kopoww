<!-제목: 공지사항 수정하기->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>공지사항 수정하기</h1>
<%
	String k22_ids = request.getParameter("key"); //  id
	String k22_title = request.getParameter("title"); //  id
	int id= Integer.parseInt(k22_ids);
	
	if(k22_title.length()<=0){
	%>
	
	<script>
	alert("제목을 쓰라규~~~");
	document.location="gongji_list.jsp";
	</script>
	<%
	return;
	}
	else{}

	k22_title = new String(request.getParameter("title").getBytes("8859_1"),"utf-8"); //  제목
	String k22_text = new String(request.getParameter("text").getBytes("8859_1"),"utf-8");  //  내용

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();

	String sql="update gongji set title='"+k22_title+"',content='"+k22_text+"' ,date = curdate() where id="+id+";";
	stmt.executeUpdate( sql );
	
	stmt.close();
	conn.close();
%>
공지사항이 수정이 되었습니다.
<script>
document.location="gongji_list.jsp";
</script>
</body>
</html>