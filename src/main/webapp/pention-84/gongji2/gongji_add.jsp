<!-제목: 이용후기 댓글입력 폼->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*,java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script>
function ck(mode,id){
	if (mode=="no"){
		insert.action = "gongji_list.jsp";
		insert.submit();
		
	}
		else{
			insert.action = "gongji_write.jsp?id="+id+"&add="+true;
			insert.submit();	
		}
}
</script>
</head>
<body>
</body>
<h1>이용후기 댓글</h1>
<%
	String k22_ids = request.getParameter("key"); //  id
	String k22_rootids = request.getParameter("rootid"); //  rootid
	String k22_nodeids = request.getParameter("nodeid"); //  nodeid
	String k22_title = new String(request.getParameter("title").getBytes("8859_1"),"utf-8"); //  title
	
	int k22_id= Integer.parseInt(k22_ids);
	int k22_rootid= Integer.parseInt(k22_rootids);
	int k22_nodeid= Integer.parseInt(k22_nodeids);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	ResultSet rset=null;
	String sql=null;
	
	sql="select max(nodeid) from hugi where rootid="+k22_rootid+";";
	rset = stmt.executeQuery(sql);
	rset.next();
	int maxnode=rset.getInt(1);
	
	if(k22_nodeid<maxnode){
	sql="select id, max(nodeid) from hugi where rootid="+k22_rootid+" and nodeid="+k22_nodeid+";";
	k22_nodeid=maxnode;
	}else{
		
	}
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR))+"-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)+"-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE));
	
	%>
	<form method ='post' name='insert' enctype="multipart/form-data">
<table border="1" celpadding="0" cellspacing="0">
<tr>
<td align=center>번호</td>
<td width=700px><%=k22_id%></td>
</tr>
<tr>
<td align=center>제목</td>
<td width=700px><input type="text" name="title" 
value="#댓글#<%=k22_title%>" size=120 maxlegnth=120  readonly></td>

</tr>
<tr>
<td align=center>일자</td>
<td><%=indate%></td>
</tr>

<tr>
<td align=center>내용</td>
<td ><textarea name="text" rows="20" cols="100" ></textarea></td>
</tr>

<tr>
<td>사진파일</td>
<td align=cente><input type="file" name="file"></td> <!-파일을 저장할떼 다른글과 구분하기 위함이다.->
</tr>

<tr>
<td align=center>원글</td>
<td width=700px><input type="number" name="rootid" value="<%=k22_rootid%>" hidden><%=k22_rootid%></td>
</tr>

<tr>
<td align=center>댓글레벨</td>
<td width=700px><input type="number" name="nodeid" value="<%=k22_nodeid+1%>" hidden><%=k22_nodeid+1%></td>
</tr>
</table>

<table>
<tr>
<td align=center width=800px><input type=button value="댓글달기" OnClick="ck('yes',<%=k22_id%>)"></td>
</tr>
</table>
</form>

<%			
	stmt.close();
	conn.close();
	
%>	
</body>
</html>