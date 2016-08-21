<!-제목: 이용후기 글 보기->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script>
   function submitForm(mode, key, rootid, nodeid,commentnum)
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
      }  else if(mode=="comdel")
	  { 
         myform.action = "gongji_comdel.jsp?commentnum="+commentnum; 
         myform.submit(); 
      }  else if(mode=="comadd")
	  {  
         myform.action = "gongji_comadd.jsp?commentnum="+commentnum; 
         myform.submit(); 
      } 
   } 
 </script>
</head>
<body>

<h1>이용후기 보기</h1>
<%
	String commentnums = request.getParameter("commentnum"); // 선택된 페이지 번호 참조
	String k22_ids = request.getParameter("id"); // 선택된 페이지 번호 참조
	String k22_nodeids = request.getParameter("nodeid"); // 선택된 페이지 번호 참조
	String k22_rootids = request.getParameter("rootid"); // 선택된 페이지 번호 참조
	int id= Integer.parseInt(k22_ids);
	int nodeid=0;  //파일출력을 위한 부분
	int rootid=0;  //파일출력을 위한 부분
	if(k22_nodeids==null){
		k22_nodeids="0";
	}else{
	}if(k22_rootids==null){
		k22_rootids="1";
	}else{
	}
	nodeid= Integer.parseInt(k22_nodeids);
	rootid= Integer.parseInt(k22_rootids);
	int commentnum=0;
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.0.6:33060/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql=null;
	int count=0, filecount=0, i=0; // count 조회수 , filecount 파일의 갯수, i for를 위한 변수
	boolean Fopen=false;  //파일이 글 안에 없으면 false
	sql="select count(name) from hugifile where id="+id+";";
	ResultSet rset = stmt.executeQuery(sql);
	rset.next();
	filecount=rset.getInt(1);
	String []file=new String[filecount];
	
	if(commentnums==null){
	}else{
	commentnum= Integer.parseInt(commentnums);
	
	}
	if(filecount ==0){
		
	}else{
		Fopen= true;
		sql="select name from hugifile where id='"+id+"';";
		rset = stmt.executeQuery(sql);
		for(i=0;i<filecount;i++){
			rset.next();
			file[i]=rset.getString(1);
		}
	}
	commentnum=1;
	sql="select max(contentnum) from comment where id="+id+";";
	rset  =stmt.executeQuery( sql );
	rset.next();
	commentnum=rset.getInt(1);
	
	String []content=new String[commentnum];
	sql="select content from comment where id="+id+";";
	rset  =stmt.executeQuery( sql );
	
	i=0;
	while(rset.next()){
	content[i++]=rset.getString(1);
	}
	
	sql="select * from hugi where id="+id+" and rootid="+rootid+" and nodeid="+nodeid+";";
	rset  =stmt.executeQuery( sql );
%>
<table border="1">
<%
	while(rset.next())
	{		
	count = rset.getInt(7)+1; // 조회수를 증가시킨다.
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
		<td><input type="number" value="<%=rset.getInt(5)%>" name="rootid" hidden><%=rset.getString(5)%></td>  
		</tr>

<%
if(Fopen==true){

	for(i=0;i<filecount;i++){
%>
	<td align=center>파일보기</td>
		<td><input type="text" value="<%=file[i]%>" name="files" hidden><img src ="/fileupload/<%=file[i]%>"></td>  
		</tr>
<%
	}
}
%>		
		<tr>
		<td align=center>댓글레벨</td>
		<td><input type="number" value="<%=rset.getString(6)%>" name="nodeid" hidden><%=rset.getString(6)%></td>  
		</tr>
		<br><td colspan=2 align=right>
	<input type=button  value="목록" OnClick="submitForm('list',0,0,0,0)">
	<input type=button  value="수정" OnClick="submitForm('update',<%=id%>,0,0,0)">
	<input type=button  value="삭제" OnClick="submitForm('delete',<%=id%>,0,0,0)">
	<input type=button  value="댓글" OnClick="submitForm('add',<%=id%>,<%=rset.getString(5)%>,<%=rset.getString(6)%>,0,0)">
	</td>
	</tr>
	<tr><td colspan=2><textarea cols="100" rows="5" type="text" value="" name="comadd" >댓글을 써주세요^^
	</textarea><input type=button  value="추가" OnClick="submitForm('comadd',<%=id%>,0,0,'<%=commentnum+1%>')"></td>
	</tr>
	<% //댓글 보이기
	for(i=0;i<commentnum;i++){ //여기서 i 주의 테이블에서는 1부터 댓글이 시작된다. 그래서 commentnum은 보낼때 1을 더한다.
		%><tr>
	<td colspan=2><textarea cols="100" rows="5" type="text" value="<%=content[i]%>" name="comdel" readonly><%=content[i]%>
	</textarea><input type=button  value='삭제' OnClick="submitForm('comdel',<%=id%>,0,0,<%=i+1%>)"></td> 	
	<!- 보여지는 댓글을 삭제하는 버튼이다. ->
	<%
	}
%>	
	</tr>
</form>	
</tr>
<%		
	
	}
	sql="update  hugi set viewcnt=viewcnt+1 where id="+id+";";
	stmt.executeUpdate( sql );
	stmt.close();
	conn.close();
	rset.close();
%>	
</table>
</body>
</html>