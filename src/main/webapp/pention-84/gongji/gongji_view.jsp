<!-제목: 공지사항 보기->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script>
   function submitForm(mode, key, rootid, nodeid)
   { 
      if(mode== "update")
	  { 
         myform.action = "gongji_update.jsp?key="+key; 
         myform.submit(); 
      }else if(mode=="delete")
	  { 
         myform.action = "gongji_delete.jsp?key="+key; 
         myform.submit(); 
      }else if(mode=="add")
	  { 
         myform.action = "gongji_add.jsp?key="+key+"&rootid="+rootid+"&nodeid="+nodeid; 
         myform.submit(); 
      }  
	  else if(mode=="list")
	  { 
         myform.action = "gongji_list.jsp"; 
         myform.submit(); 
      } 
   } 
 </script>
</head>
<body>
</body>
<h1>공지사항 보기</h1>
<%
	String k22_ids = request.getParameter("id"); // 선택된 페이지 번호 참조
	int id= Integer.parseInt(k22_ids);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	
	int count=0;
	

	
	String sql="select * from gongji where id="+id+";";
	 ResultSet rset  =stmt.executeQuery( sql );
%>
<table border="1">
<%
	while(rset.next())
	{		
	count = rset.getInt(7)+1;
%>
<!--공지사항 리스트 출력부분-->
<tr>
<form method='post' name="myform">
		<td align=center>번호</td>
		<td width=700px><input type="number" value="<%=rset.getInt(1)%>" name="id" hidden ><%=rset.getInt(1)%></td>
		</tr>
		<tr>
		<td align=center>제목</td>
		<td align=center><input type="text" value="<%=rset.getString(2)%>" name="title" hidden><%=rset.getString(2)%></td>
		</tr>
		<tr>
		<td  align=center>일자</td>
		<td><input type="text" value="<%=rset.getString(3)%>" name="date" hidden><%=rset.getString(3)%></td>  
		</tr>
		<tr>
		<td  align=center>조회수</td>
		<td><input type="number" value="<%=count%>" name="viewcnt" hidden><%=count%></td>  
		</tr>
		<tr>
		<td  align=center>내용</td>
		<td align=center>
		<textarea cols="100" rows="10" type="text" value="<%=rset.getString(4)%>" name="text" readonly><%=rset.getString(4)%>
		</textarea></td>  
		<tr>
		<tr>
		<td align=center>원글집합</td>
		<td><input type="number" value="<%=rset.getInt(5)%>" name="viewcnt" hidden><%=rset.getString(5)%></td>  
		</tr>
		<tr>
		<td align=center>댓글레벨</td>
		<td><input type="number" value="<%=rset.getInt(6)%>" name="viewcnt" hidden><%=rset.getString(6)%></td>  
		</tr>
		<br><td colspan=2 align=right>
	<input type=button  value="목록" OnClick="submitForm('list',0,0,0)">
	<input type=button  value="수정" OnClick="submitForm('update',<%=id%>,0,0)">
	<input type=button  value="삭제" OnClick="submitForm('delete',<%=id%>,0,0)">
	<input type=button  value="댓글" OnClick="submitForm('add',<%=id%>,<%=rset.getString(5)%>,<%=rset.getString(6)%>)">
	</td>
	
	</tr>
</form>	
</tr>
<%		
	
	}
	sql="update  gongji set viewcnt=viewcnt+1 where id="+id+";";
	stmt.executeUpdate( sql );
	stmt.close();
	conn.close();
	rset.close();
%>	
</table>
</html>