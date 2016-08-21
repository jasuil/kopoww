<!-제목: 이용후기 수정 입력->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@ page import ="com.oreilly.servlet.MultipartRequest" %>
<%@ page import ="com.oreilly.servlet.multipart.FileRenamePolicy" %>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*, java.sql.*,javax.sql.*, java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>이용후기 보기</h1>
<%////////////////////////////////////////////////////////////////////파일 업로드를 위한 작업	

	String saveDirectory=application.getRealPath("/fileupload");
	int maxPostSize=10*1024*1024;
	String encoding="utf-8";
	FileRenamePolicy policy=new DefaultFileRenamePolicy();
	MultipartRequest multi=new MultipartRequest(request,saveDirectory,maxPostSize,encoding);
	
	String fileName=new String(multi.getParameter("filename").getBytes("8859_1"),"utf-8");  
	String fileMode=multi.getParameter("filemode");  // 파일을 추가할 것인지 삭제할 것인 가를 판단
	String k22_ids = multi.getParameter("id"); //  id
	int id= Integer.parseInt(k22_ids);
	String sql=null;
	

	String k22_title =multi.getParameter("title"); //  제목
	//String k22_text = new String(multi.getParameter("text").getBytes("8859_1"),"utf-8");  //  내용
	String k22_text = multi.getParameter("text");  //  내용
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	
	if(k22_title.length()<=0){
	%>
	
	<script>
	alert("제목을 쓰라규~~~");
	document.location="gongji_list.jsp";
	</script>
	<%
	return;
	}
	else{}
	
	ResultSet rset=null;
	sql="update hugi set title='"+k22_title+"',content='"+k22_text+"' ,date = curdate() where id="+id+";";
	stmt.executeUpdate( sql );
	
	///////////////////////////////////////////////////파일 업로드일 때
if(fileName==null || fileName.equals("0")){
	//파일업로드가 없으면 그냥 무시
}else{

sql = "select max(numb) from hugifile where id="+id+";";
rset = stmt.executeQuery(sql);
rset.next();
int numb = rset.getInt(1) + 1;

if(fileMode.equals("add")){
	sql="insert into hugifile (id, name, numb) values("+id+",'"+fileName+"',"+numb+");";
	stmt.executeUpdate(sql);
} else if(fileMode.equals("del")){
	%>
	<script>
	alert("<%=fileName%><%=numb%>");
	</script>
	<%
	sql="delete  from hugifile where id="+id+" and name='"+fileName+"';";
	stmt.executeUpdate(sql);
	sql="update hugifile set numb=numb-1 where numb>="+numb+";";
	stmt.executeUpdate(sql);
	File f = new File("/var/lib/tomcat7/webapps/ROOT/fileupload/"+fileName); //글번호가 파일 앞에 붙어있다.
	if(f.exists()) f.delete();
}

}	
	
	stmt.close();
	conn.close();
%>
<script>
alert("이용후기가 수정이 되었습니다.");
document.location="gongji_list.jsp";
</script>
</body>
</html>