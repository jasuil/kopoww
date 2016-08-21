<!-제목: 예약 테이블생성->
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
		String k22_in="create table gongji(id int, title varchar(70), date date, content text, rootid int, nodeid int, viewcnt int)";
		//이 테이블은 일반적인 예약상황을 보여준다.
		
		try{k22_stmt.execute(k22_in); //예외가 발생시 메시지를 직접 보여준다.
		}catch(Exception e1){
			out.print("첫 번째"+e1+"<br>");
		}
		try{k22_in="create table file(id int, name varchar(100));";
		//이 테이블은 에약일 수를 보여준다. 나중에 계산하는 명령어를 써서 book, operate테이블에 있는 레코드를 둘 다 지우게 된다.
		k22_stmt.execute(k22_in);
%>
<script>
alert("이제 테이블은 생성되었습니다.(it's made.)");
</script>
<%
}catch(Exception e2){
			out.println(e2);
		}
		

k22_stmt.close();
conn.close();
%>
<script>
history.go(-1);
</script>
</body>
</html>