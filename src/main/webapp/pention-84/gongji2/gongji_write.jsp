<!-제목: 이용후기 글 입력하기->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@ page import ="com.oreilly.servlet.MultipartRequest" %>
<%@ page import ="com.oreilly.servlet.multipart.FileRenamePolicy" %>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>이용후기 글/댓글 입력</h1>
<%////////////////////////////////////////////////////////////////////파일 업로드를 위한 작업	

	String saveDirectory=application.getRealPath("/fileupload");
	int maxPostSize=10*1024*1024;
	String encoding="utf-8";
	FileRenamePolicy policy=new DefaultFileRenamePolicy();
	MultipartRequest multi=new MultipartRequest(request,saveDirectory,maxPostSize,encoding);
	
	String fileName=multi.getOriginalFileName("file");
	String k22_ids = multi.getParameter("id"); //  id
	String k22_adds = multi.getParameter("add"); //  댓글을 추가할 것인지를 판단함
	String k22_rootids = "0"; //초기값 대입함
	String k22_nodeids = "0";
	String k22_title=null; //그냥 초기값을 넣어준 것임
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql="";
	ResultSet rset = null;
	int id=0;
	k22_rootids = multi.getParameter("rootid"); //  rootid
	k22_nodeids = multi.getParameter("nodeid"); //  nodeid
    k22_title = multi.getParameter("title"); 
	//한글이 깨지지 않게 옮겨담는 정신	
	String k22_text = multi.getParameter("text"); //  
	
	sql="select max(id) from hugi ;";
	rset = stmt.executeQuery(sql);
	rset.next();
	id = rset.getInt(1);	
	id +=1;
	
	if(k22_rootids==null || k22_nodeids==null )
	{ //이 경우는 댓글이 아닐경우에 해당함
		k22_nodeids="0";
	}else{
		
	}
	if(k22_title.length()<=0){
	%>	
	<script>
	alert("제목을 쓰라규~~~<%=k22_text%>");
	document.location="gongji_list.jsp";
	</script>
	<%
	return;
	}
	else{}
	
	int rootid= Integer.parseInt(k22_rootids);
	int nodeid= Integer.parseInt(k22_nodeids);
	
	
	Integer.parseInt(k22_nodeids);

	int numb = 1;


	
	

///////////////////////////////////////////////////파일 업로드일 때
if(fileName==null){
	//파일업로드가 없으면 그냥 무시
}else{

	sql = "select max(numb) from hugifile where id="+id+";";
	rset = stmt.executeQuery(sql);
	rset.next();
	numb= rset.getInt(1)+1 ;
	


	sql="insert into hugifile (id, name, numb) values("+id+",'"+fileName+"',"+numb+");";
	stmt.executeUpdate(sql);
}

	
	 
	sql="insert into hugi values("+id+",'"+ k22_title+"',curdate(),'"+k22_text+"',"+rootid+","+nodeid+",0);";
	stmt.executeUpdate( sql );
		%>
		<Script>
		alert("<%=id%>--<%=rootid%>--<%=nodeid%>");
		document.location="gongji_list.jsp";
		</Script>
		<%
	
	
	
	if(rset != null){rset.close();}
	stmt.close();
	conn.close();

%>
<script>
alert("<%=k22_title%>이(가) 정상적으로 등록이 되었습니다.");
document.location="gongji_list.jsp";
</script>
</body>
</html>