<!-제목: 곻지사항 리스트->
<!-날짜: 2016.07.14->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>공지사항 게시판 리스트</h1>
<%	
	String k22_type=request.getParameter("type");
	String k22_content=request.getParameter("content");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql=null;

		
	if(k22_type==null){
		sql="select * from gongji order by rootid desc, nodeid asc;";
	}else if(k22_type.equals("title")){
		sql="select * from gongji where title like '%"+k22_content+"%' order by rootid desc, nodeid asc ;";
	}else if(k22_type.equals("titleText")){
		sql="select * from gongji where title like '%"+k22_content+"%' or content like '%"+k22_content+"%' order by rootid desc, nodeid asc ;";
	}else{
		sql="select * from gongji where content like '%"+k22_content+"%' order by rootid desc, nodeid asc ;";
	}
	ResultSet rset =stmt.executeQuery( sql );
%>
<table border="1">
<tr>
<td align=center>번호</td><td width=700px align=center>제목</td><td align=center >조회수</td>
<td width=100px align=center>등록일</td>
</tr>
<%
	while(rset.next())
	{
%>
<tr><!--공지사항 리스트 출력부분-->
		<td align=center><%=rset.getInt(1)%></td>
		<td align=center><a href="gongji_view.jsp?id=<%=rset.getInt(1)%>" style="text-decoration:none !important"><%=rset.getString(2)%></td>
		<td align=center><%=rset.getInt(7)%></td>  
		<td align=center><%=rset.getString(3)%></td>  
		</td>
</tr>
<%		
	}
	stmt.close();
	conn.close();
	rset.close();
%>	
</table>
<table><tr>
<form action="gongji_list.jsp">
<td align=right>
<select name="type"> <%--찾는 부분을 라디오 버튼으로 함, -% 이것은 jsp주석임 --%>
<option value="title"  selected>제목</option> <!- 이것은 html 주석임 ->
<option value="text" >내용</option>
<option value="titleText">제목+내용</option>
</select>
<input type="text" name="content" value="" size=120 maxlength=120>
<input type=submit  value='찾기'></td>
</form>
<form action="gongji_insert.jsp">
<td align=right>
<input type=submit  value='추가'></td>
</form>	
</tr>
</table>
</body>
</html>