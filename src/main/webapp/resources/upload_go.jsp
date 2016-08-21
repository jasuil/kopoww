
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="com.oreilly.servlet.MultipartRequest" %>
<%@ page import ="com.oreilly.servlet.multipart.FileRenamePolicy" %>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*, java.sql.*,javax.sql.*"%>
<html>
<head>
</head>
<body>

<%


String saveDirectory=application.getRealPath("/fileupload");
int maxPostSize=10*1024*1024;
String encoding="utf-8";
FileRenamePolicy policy=new DefaultFileRenamePolicy();
MultipartRequest multi=new MultipartRequest(request,saveDirectory,maxPostSize,encoding);
String fileName=multi.getOriginalFileName("file");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","koposw");
Statement stmt =conn.createStatement();
String sql="nsert into file values(h);";
stmt.executeUpdate(sql);


if(fileName==null){
	out.println("실패");
}else
%>
<script>
alert("<%=fileName%>");
</script>
<table border ="1">
<tr>
<td>이름</td>
<td><%=multi.getParameter("name")%></td>
<td>저장공간</td>
<td><%=saveDirectory%></td>
<td>파일명</td>
<td><%=fileName%></td>
</tr>
</table>
<%
stmt.close();
conn.close();
%>
</body>
</html>