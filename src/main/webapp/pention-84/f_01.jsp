<!-제목: 관리자용 얘약상황 리스트->
<!-날짜: 2016.07.19->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<style>
table.list{border="0"; background-color:yellow;}
td.jasuil{text-align:center; border-bottom:2px solid green;}
</style>
</head>
<body>

<h1>관리자용 예약상황 리스트</h1>
<%	
	String k22_type=request.getParameter("type");
	String k22_content=request.getParameter("content");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql=null;
/////////////////////////////////////////////////////////////////////////////////여기부터 페이지뷰 입력을 받을 곳		
	int k22_LastLine=0;//목록 갯수를 파악하기 위한 변수 선언
	int k22_LineCnt=0; //리스트 출력갯수 제한
	int k22_PG=1; //리스트 1~10개가 담긴 페이지
	int k22_PG_get=0; //리스트 1~10개가 담긴 페이지 
	int k22_MG=0; //PG의 최댓값
	int k22_MGG=0; //GG의 최댓값
	String k22_pg = request.getParameter("PG"); // 선택된 페이지 번호 참조
	if (k22_pg == null) { //주소창에 f_01.jsp만 넣거나 제대로 PG변수를 입력 안 한 경우 null값이 들어가게 되는데 이때 대처법이다.
	k22_pg = "1"; //문자열로 입력받게 된다.
	k22_PG_get = Integer.parseInt(k22_pg); //숫자로 변환한다.
	}
	else{
		k22_PG_get = Integer.parseInt(k22_pg); //아니면 말구
	}

	String k22_gg = request.getParameter("GG"); //입력값을 주소창에서 받게 된다.
	int k22_GG = 0; // PG가 1~10모인 것의 단위
	//GG는 리스트를 최대 10개씩 출력하는 페이지를 10개로 묶는 단위 즉, 1~100개의 리스트가 들어있다.
	if(k22_gg == null){
		k22_gg = "1";
		k22_GG = Integer.parseInt(k22_gg); 
	}
	else{
		k22_GG = Integer.parseInt(k22_gg); 
	}
/////////////////////////////////////////////////////////////////////////////////여기까지가 페이지뷰 입력을 받는 곳		
	ResultSet rset=null;
	try{if(k22_type==null ||  k22_content.length()<=0){
		sql="select count(*) from operate;";
		rset= stmt.executeQuery(sql);
		rset.next();
		k22_LastLine= rset.getInt(1);//목록 갯수를 우선 파악
		sql="select distinct a.dates, a.sleep, a.id, a.place, b.person from operate a, book b where b.id=a.id and b.dates=a.dates and b.place=a.place;";
		
	}else if(k22_type.equals("dates")){ //날짜로 검색
		sql="select count(*) from book where dates like '%"+k22_content+"%';";
		rset= stmt.executeQuery(sql);
		rset.next();
		k22_LastLine= rset.getInt(1);//목록 갯수를 우선 파악
		sql="select distinct a.dates, a.sleep, a.id, b.place, b.person from operate a, book b where b.dates=a.dates and b.id=a.id and a.dates like '%"+k22_content+"%';";

	}else if(k22_type.equals("id")){ //예약 id로 검색
			sql="select count(*) from book where id like '%"+k22_content+"%';";
		rset= stmt.executeQuery(sql);
		rset.next();
		k22_LastLine= rset.getInt(1);//목록 갯수를 우선 파악
		sql="select distinct a.dates, a.sleep, a.id, b.place, b.person from operate a, book b where  b.dates=a.dates and a.id=b.id and a.id like '%"+k22_content+"%' ;";
	}else{ //방으로 검색
			sql="select count(id) from book where place like '%"+k22_content+"%' ;";
		rset= stmt.executeQuery(sql);
		rset.next();
		k22_LastLine= rset.getInt(1);//목록 갯수를 우선 파악
			sql="select distinct a.dates, a.sleep, a.id, b.place, b.person from operate a, book b where b.dates=a.dates and b.id=a.id and b.place like '%"+k22_content+"%';";

	}
	rset =stmt.executeQuery( sql );
		
	
	/////////////////////////////////////////////////페이지뷰를 만들기 위한 준비작업
	k22_MGG = 0; //최대 GG의 갯수를 파악하려고 한다.	
	if(k22_LastLine%100==0){  //100으로 나눈 페이지 수를 계산한다.
		k22_MGG = k22_LastLine/100;}
	else{
		k22_MGG = k22_LastLine/100+1;
	}
	k22_MG=0; //한 GG내에서 최대 PG범위 1~10

	if(k22_GG<k22_MGG){ // GG가 최대 GG를 넘지 않는 페이지 뷰에서는...
		k22_MG=10;
	}
	else if(k22_GG==k22_MGG){ // GG가 최대 GG와 같을 경우 = 마지막 페이지가 있는 GG
		k22_MG= ((k22_LastLine/10)%10)+1;  //마지막 페이지인 PG(MG)는 0부터 시작되므로 1을 더한다. 
	}
%>
<table class="list" cellspacing="0">
<tr>
<td class="jasuil">날짜</td><td class="jasuil">숙박일</td><td class="jasuil" width="120px">회원id</td><td class="jasuil">장소</td>
<td width=100px class="jasuil">인원수</td>
</tr>
<%
int k22_com=0;  // 마지막 페이지(GG의 마지막)를 보여주기 위한 변수 선언과 정의
	while(rset.next())
	{
		if(k22_GG==k22_MGG && k22_MG < k22_PG_get){k22_com=k22_MG;}
		else{k22_com=k22_PG_get;}
		if(k22_LineCnt>(k22_GG-1)*100+k22_com*10) { //출력 리스트의 갯수가 10이상이면 그만 보여줌
			break;
		}
		if(k22_LineCnt >= (k22_GG-1)*100+(k22_com-1)*10) {
%>
<tr><!--예약상황 리스트 출력부분-->
		<td class="jasuil"><%=rset.getString(1)%></td>
		<td class="jasuil"><%=rset.getInt(2)%></td>  
		<td class="jasuil"><a href="f_02.jsp?id=<%=rset.getString(3)%>"><%=rset.getString(3)%></td>
		<!- 회원 id별 내용으로 들어가서 삭제나 수정을 한다 ->
		<td class="jasuil"><%=rset.getString(4)%></td>
		<td class="jasuil"><%=rset.getInt(5)%></td>
		</td>
</tr>
<%		
	}
	else{}
	k22_LineCnt++;
	}
	
		
	stmt.close();
	conn.close();
	rset.close();
%>	
</table>
<table><tr>
<form action="f_01.jsp">
<td align=right>
<select name="type"> <%--찾는 부분을 라디오 버튼으로 함, -% 이것은 jsp주석임 --%>
<option value="id" selected>회원id</option> <!- 이것은 html 주석임 ->
<option value="place" >장소</option>
<option value="dates">날짜</option>
</select>
<input type="text" name="content" value="" size=50 maxlength=50>
<input type=submit  value='찾기'></td>
</form>
</tr>
</table>
<%

}catch(Exception e){
	out.print("<h2>"+e+"</h2>");
	}
%>
<!-- 테이블 생성/삭제 -->
<table><tr>
<td align=right>
<a href ="createDB.jsp"><input type=button value='테이블생성'></a>
<a href ="dropDB.jsp"><input type=button value="테이블삭제"></a><br>
<a href ="gongji/createDB.jsp"><input type=button value='공지게시판테이블생성'></a>
<a href ="gongji/dropDB.jsp"><input type=button value='공지게시판테이블삭제'></a><br>
<a href ="gongji2/createDB.jsp"><input type=button value='이용후기테이블생성'></a>
<a href ="gongji2/dropDB.jsp"><input type=button value='이용후기테이블삭제'></a>
</tr>
</table>
<table border="0">
<%
	if(k22_GG>1){
		
%>

<tr>
<th align = right width=400px><a href ="f_01.jsp?GG=<%=k22_GG-1%>&PG=1" style="text-decoration:none !important">이전 10페이지</a></th>
<%		

}
else{
	%>
<tr>
<th align=right width=200px>더 이상 갈 데가 없어</a></th>
<%
}
if(k22_MG<k22_PG_get){
	while(k22_PG<k22_MG){
	%>
	<td text-decoration: none><a  href ="f_01.jsp?PG=<%=k22_PG%>&GG=<%=k22_GG%>" style="text-decoration:none !important" ><%=k22_PG%></a></td>
	<%
	k22_PG = k22_PG+1;
	}
	%>
	<td text-decoration: none><a  href ="f_01.jsp?PG=<%=k22_PG%>&GG=<%=k22_GG%>" ><%=k22_PG%></a></td>
	<%
	k22_PG = k22_PG+1;
}
	else{
	while(k22_PG<k22_PG_get){
	%>
	<td text-decoration: none><a hover href ="f_01.jsp?PG=<%=k22_PG%>&GG=<%=k22_GG%>" style="text-decoration:none !important" ><%=k22_PG%></a></td>
	<%
	k22_PG = k22_PG+1;
	}
	%>
	<td text-decoration: underline><a href ="f_01.jsp?PG=<%=k22_PG_get%>&GG=<%=k22_GG%>" ><%=k22_PG_get%></a></td>
	<%
	k22_PG = k22_PG+1;
	while(k22_PG<=k22_MG){
	%>
	<td text-decoration: none><a  href ="f_01.jsp?PG=<%=k22_PG%>&GG=<%=k22_GG%>" style="text-decoration:none !important" ><%=k22_PG%></a></td>
	<%
	k22_PG = k22_PG+1;
	}
}
if(k22_GG<k22_MGG){
%>
<th align = left width =200px><a href ="f_01.jsp?GG=<%=k22_GG+1%>&PG=<%=k22_MG%>" style="text-decoration:none !important">다음 10페이지</a></th>
</tr>
<%
		}
else{
	
	%>
<th align = left width =200px>끝이야!!!</a></th>
</tr>
</table>
<%
}
%>
</body>
</html>