<!-제목: 공지사항 수정->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*,java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script>
function ck(mode,key){
	if (mode=="no"){
		insert.action = "gongji_list.jsp";
		insert.submit();
		
	}
		else{
			insert.action = "gongji_update_go.jsp?key="+key;
			insert.submit();	
		}
}


</script>
</head>
<body>

<h1>공지사항 수정</h1>
<%
	String k22_ids = request.getParameter("key"); //  id
	String k22_title = new String(request.getParameter("title").getBytes("8859_1"),"utf-8"); //  제목
	String k22_text = new String(request.getParameter("text").getBytes("8859_1"),"utf-8"); //  내용
	int id= Integer.parseInt(k22_ids);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR))+"-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH+1))+"-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE));
	
	String sql = "select * from gongji where id="+id+";";
	ResultSet rset = stmt.executeQuery(sql);
	rset.next();
	
	int insert = rset.getInt(1);
	String title=rset.getString(2);
	String text= rset.getString(3);
	//일단 내용을 보여준다.
	%>
	<form method ='post' name='insert'>
<table border="1" cellpadding="1" cellspacing="0">
<tr>
<td align=center>번호</td>
<td width=700px><%=k22_ids%></td>
</tr>
<tr>
<td align=center>제목</td>
<td width=700px><input type="text" name="title" value="<%=k22_title%>" size=120 maxlength=120></td>
</tr>

<tr>
<td align=center>일자</td>
<td><%=indate%></td>
</tr>

<tr>
<td align=center>내용</td>
<td><textarea name="text" rows="20" cols="100" ><%=k22_text%></textarea></td>
</tr>


<tr>
<td  colspan=2 width=450px align=right><input type=button value="수정" OnClick="ck('yes',<%=k22_ids%>)">
<input type=button value="취소" OnClick="ck('no',<%=k22_ids%>)">
</td></tr>
</table>
</form>

<%			
	stmt.close();
	conn.close();
	rset.close();
%>	
</body>
</html>