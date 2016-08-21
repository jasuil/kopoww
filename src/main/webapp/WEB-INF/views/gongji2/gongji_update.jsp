<!-제목: 이용후기 수정 폼->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*,java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script>
function ck(mode,id,filename){
	if (mode=="no"){
		insert.action = "gongji_list.jsp";
		insert.submit();
		
	}else if(mode=="filedel"){
			insert.action = "gongji_update_go.jsp?id="+id+"&filename="+filename+"&filemode=del";
			insert.submit();	
	}else if(mode=="fileadd"){
			insert.action = "gongji_update_go.jsp?id="+id+"&filemode=add&filename=";
			insert.submit();	
	}
	else{
			insert.action = "gongji_update_go.jsp?id="+id+"&filename=0";
			insert.submit();	
	}
}
</script>
</head>
<body>
<h1>이용후기 수정</h1>
<%
	String k22_ids = request.getParameter("key"); //  id
	String k22_title="", k22_text ="";
	k22_title = new String(request.getParameter("title").getBytes("8859_1"),"utf-8"); //  제목
	k22_text = new String(request.getParameter("text").getBytes("8859_1"),"utf-8");	//  내용
	
	
	int id= Integer.parseInt(k22_ids);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR))+"-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)+"-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE));
	
	String sql = "select * from hugi where id="+id+";";
	ResultSet rset = stmt.executeQuery(sql);
	rset.next();
	
	int insert = rset.getInt(1);
	String title=rset.getString(2);
	String text= rset.getString(3);
	
	sql = "select max(numb) from hugifile where id="+id+";";
	rset = stmt.executeQuery(sql); //파일이 게시글에 몇 개나 있는지 파악해야지
	rset.next();
	int numb=rset.getInt(1);
	
	int i=0;
	String []name = new String[numb]; //파일 이름을 알아야 지우지
	String []ext = new String[numb]; //파일의 확장자 명을 알아야 하니까 만듦
	sql = "select name from hugifile where id="+id+";";
	rset = stmt.executeQuery(sql);
	while(rset.next()){
		name[i] = rset.getString(1);
	}
	
	
	//일단 내용을 보여준다.
	%>
	<form method ='post' name='insert' enctype="multipart/form-data">
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

<%
i=0;
while(i<numb){
%>
<tr>
<td align=center>사진</td>
<td>
<img src="/fileupload/<%=name[i]%>" ><%=name[i]%><input type="button" value="삭제" OnClick="ck('filedel',<%=k22_ids%>,
'<%=name[i]%>')"></td>
</tr>
<%
i++;
}
%>



<td  colspan=2 width=450px align=right><input type=button value="수정" OnClick="ck('yes',<%=k22_ids%>,0)">
<input type=button value="취소" OnClick="ck('no',<%=k22_ids%>,0)">
</td></tr>
</table>
</form>

<form  method="post" enctype="multipart/form-data" action="upload_go.jsp?id=<%=k22_ids%>">
<tr>
<td align=center>사진</td>
<td>
<input type="file" name="filename"><input type="submit" value="사진추가"></td>
</tr>
<%			
	stmt.close();
	conn.close();
	rset.close();
%>	
</body>
</html>