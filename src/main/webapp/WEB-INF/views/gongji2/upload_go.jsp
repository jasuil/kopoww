
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="com.oreilly.servlet.MultipartRequest" %>
<%@ page import ="com.oreilly.servlet.multipart.FileRenamePolicy" %>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File, java.sql.*,javax.sql.*"%>
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
String fileName=multi.getOriginalFileName("filename");
String k22_ids = multi.getParameter("id"); //  id
	int id= Integer.parseInt(k22_ids);


if(fileName==null){
	out.println("실패");
}else{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.0.6:33060/koposw22", "root","1212");
Statement stmt =conn.createStatement();

String sql = "select max(numb) from hugifile where id="+id+";";
ResultSet rset = stmt.executeQuery(sql);
rset.next();
int numb = rset.getInt(1) + 1;
sql="insert into hugifile (id, name, numb) values("+id+",'"+fileName+"',"+numb+");";
stmt.executeUpdate(sql);
}
%>

<table border ="1">
<tr>
<td>이름</td>
<td><%=multi.getParameter("name")%></td>
<td>저장공간</td>
<td><%=saveDirectory%></td>
<td>파일명</td>
<td><%=fileName%></td>
</tr>
</table><script>
alert("<%=fileName%>");
document.location="gongji_list.jsp";
</script>
</body>
</html>