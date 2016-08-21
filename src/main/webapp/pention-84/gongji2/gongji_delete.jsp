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
	String k22_ids = request.getParameter("id"); //  id
	int id= Integer.parseInt(k22_ids);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	
	String sql="delete from hugi where id="+id+";";
	stmt.executeUpdate( sql );
	sql="delete from comment where id="+id+";";
	stmt.executeUpdate( sql );
	/////////////////////////////////////////////////////////////////////////여기부터는 순전히 파일때문임
	sql = "select max(numb) from hugifile where id="+id+";";
	rset = stmt.executeQuery(sql);
	rset.next();
	int numb = rset.getInt(1) + 1;
	sql="delete  from hugifile where id="+id+" and name='"+fileName+"';";
	stmt.executeUpdate(sql);
	sql="update hugifile set numb=numb-1 where numb>="+numb+";";
	stmt.executeUpdate(sql);
	File f = new File("/var/lib/tomcat7/webapps/ROOT/fileupload/"+fileName); //글번호가 파일 앞에 붙어있다.
	if(f.exists()) f.delete();
	stmt.close();
	conn.close();
	
%>
<script>
alert("글이 삭제가 되었습니다.");
document.location="gongji_list.jsp";
</script>
</body>
</html>