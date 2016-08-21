<!-제목: 공지사항 글 입력->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>공지사항 글/댓글 입력</h1>
<%
	String k22_ids = request.getParameter("key"); //  id
	String k22_rootids = "0";
	String k22_nodeids = "0";
	String k22_title="??";
	k22_rootids = request.getParameter("rootid"); //  rootid
	k22_nodeids = request.getParameter("nodeid"); //  nodeid
    k22_title = new String(request.getParameter("title").getBytes("8859_1"),"utf-8"); //  
	String k22_text = new String(request.getParameter("text").getBytes("8859_1"),"utf-8"); //  

	if(k22_rootids==null || k22_nodeids==null )
	{
		k22_nodeids="0";
	}else{
		
	}
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
	
	int rootid= Integer.parseInt(k22_rootids);
	int nodeid= Integer.parseInt(k22_nodeids);
	int id=0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql="";
	if(k22_ids==null){
	sql="select max(id) from gongji;";
	ResultSet rset = stmt.executeQuery(sql);
	rset.next();
	id = rset.getInt(1);
	}
	else{
		id= Integer.parseInt(k22_ids);
	}

	
	 id+=1;
	sql="insert into gongji values("+id+",'"+ k22_title+"',curdate(),'"+k22_text+"',"+rootid+","+nodeid+",0);";
	stmt.executeUpdate( sql );
	stmt.close();
	conn.close();

%>
<script>
alert("<%=k22_title%>이(가) 정상적으로 등록이 되었습니다.");
document.location="gongji_list.jsp";
</script>
</body>
</html>