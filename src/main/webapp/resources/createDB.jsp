﻿<!-제목: DB 테이블생성->
<!-날짜: 2016.07.24->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
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
		String k22_sql="create table book(dates date, person int, place varchar(20), id varchar(20), constraint book_pk primary key (dates, place))";
		PrintWriter pw = response.getWriter();

		
		try{k22_stmt.execute(k22_sql); //예외가 발생시 메시지를 직접 보여준다.
		   }catch(Exception e){
			   pw.printf(e+"<br>");
		  }	
			try{k22_sql="create table operate(dates date, sleep int, id varchar(20), place varchar(20) ,constraint book_pk primary key (dates, place))";
				k22_stmt.execute(k22_sql);}catch(Exception e2){
					pw.printf(e2+"%d번째 예외발생\n",2);
					}
			
		k22_sql="insert into book values('1990-01-01',1,'블루마운틴',1);";
		k22_stmt.execute(k22_sql);
		k22_sql="insert into book values('1990-01-01',1,'루왁',1);";
		k22_stmt.execute(k22_sql);
		k22_sql="insert into book values('1990-01-01',1,'수프리모',1);";
		k22_stmt.execute(k22_sql);
		k22_sql="insert into book values('1990-01-01',1,'도미토리',1);	";
		k22_stmt.execute(k22_sql);
		


		k22_stmt.close();
		conn.close();
%>
<script>
document.location="f_01.jsp";
</script>
</body>
</html>