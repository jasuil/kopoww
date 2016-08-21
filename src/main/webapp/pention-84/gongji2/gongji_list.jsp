<!-제목: 이용후기 글 목록->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<style>
body{text-align:center}
table.list{ margin:0 auto; <!-- 중앙에 배치 -->
align:center; background-color:yellow; font-family:굴림;}
td.list{text-align:center;border:0; border-bottom:2px solid green;  }
</style>
</head>
<body>

<h1>이용후기 목록</h1>
<%	
	String k22_type=request.getParameter("type");
	String k22_content=request.getParameter("content");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql=null;
		
	if(k22_type==null){
		sql="select * from hugi order by rootid desc, nodeid asc;";
	}else if(k22_type.equals("title")){
		sql="select * from hugi where title like '%"+k22_content+"%' order by rootid desc, nodeid asc ;";
	}else if(k22_type.equals("titleText")){
		sql="select * from hugi where title like '%"+k22_content+"%' or content like '%"+k22_content+"%' order by rootid desc, nodeid asc ;";
	}else{
		sql="select * from hugi where content like '%"+k22_content+"%' order by rootid desc, nodeid asc ;";
	}
	ResultSet rset =stmt.executeQuery( sql );
%>
<table class="list" cellspacing="0" >
<tr>
<td class="list" align=center>번호</td><td class="list" width="70%" align=center>제목</td><td class="list" align=center >조회수</td>
<td class="list" width=100px align=center>등록일</td>
</tr>
<%
	while(rset.next())
	{
%>
<tr><!--공지사항 리스트 출력부분-->
		<td class="list" align=center><%=rset.getInt(1)%></td>
		<td class="list" align=center><a href="gongji_view.jsp?id=<%=rset.getInt(1)%>&rootid=<%=rset.getInt(5)%>&nodeid=<%=rset.getInt(6)%>" style="text-decoration:none !important"><%=rset.getString(2)%></td>
		<td class="list" align=center><%=rset.getInt(7)%></td>  
		<td class="list" align=center><%=rset.getString(3)%></td>  
		</td>
</tr>
<%		
	}
	stmt.close();
	conn.close();
	rset.close();
%>	
<tr><td align="right" bgcolor="white" colspan='4'>
</form>
<form action="gongji_insert.jsp">
<input type=submit  value='추가'></td>
</form></td>
</table>

<table  align=center><tr>
<form action="gongji_list.jsp">
<td align=center>
<select name="type"> <%--찾는 부분을 라디오 버튼으로 함, -% 이것은 jsp주석임 --%>
<option value="title"  selected>제목</option> <!- 이것은 html 주석임 ->
<option value="text" >내용</option>
<option value="titleText">제목+내용</option>
</select>
<input type="text" name="content" value="" size="50%" ></td>

<td align=right>
<input type=submit  value='찾기'>
</tr>
</table>
</body>
</html>