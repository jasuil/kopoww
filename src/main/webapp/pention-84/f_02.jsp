<!-제목: 관리자용 얘약상황 개인별 리스트->
<!-날짜: 2016.07.19->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<!- 예약자 한 명을 보여주고 삭제, 수정가능한 페이지 ->
<!--공지사항 보기-->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<style>
td{text-align:center; border-bottom:2px solid green;}
</style>
<script>
   function submitForm(mode, gonedate, gonesleep, id, goneplace, goneperson )
   { 
      if(mode== "update")
	  { 
         myform.action = "f_update.jsp?date="+gonedate+"&sleep="+gonesleep+"&id="+id+"&place="+goneplace+"&person="+goneperson; 
         myform.submit(); 
      }else if(mode=="delete")
	  { 
         myform.action = "f_delete.jsp?date="+gonedate+"&sleep="+gonesleep+"&id="+id+"&place="+goneplace+"&person="+goneperson;
         myform.submit(); 
      }else if(mode=="list")
	  { 
         myform.action = "f_01.jsp"; 
         myform.submit(); 
      } 
   } 
 </script>
</head>
<body>

<h1>개인id별 보기</h1>
<%
/////////////////////////////////////////////////////////////////////////////////여기부터 페이지뷰 입력을 받을 곳		
	int k22_LastLine=0;//목록 갯수를 파악하기 위한 변수 선언
	int k22_LineCnt=0; //리스트 출력갯수 제한
	int k22_PG=1; //리스트 1~10개가 담긴 페이지
	int k22_PG_get=0; //리스트 1~10개가 담긴 페이지 
	int k22_listnum=0; //배열을 위한 선언과 초기화
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
	String id = request.getParameter("id");		
	if (id	== null) { //주소창에 f_02.jsp만 넣거나 제대로 id변수를 입력 안 한 경우 null값이 들어가게 되는데 이때 대처법이다.
	id = "1"; //문자열로 입력받게 된다.
	}
	else{}
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	ResultSet rset =null;
	
	String sql="select count(id) from operate where id='"+id+"';";
	rset= stmt.executeQuery(sql);
	rset.next();
	k22_LastLine= rset.getInt(1);//목록 갯수를 우선 파악	
	
	sql="select count(id) from book where id='"+id+"';";
	rset= stmt.executeQuery(sql);
	rset.next();
	k22_listnum= rset.getInt(1);//목록 갯수를 우선 파악	
	
	
	sql="select place from book where id='"+id+"';";
	rset= stmt.executeQuery(sql);
	rset.next();
	String k22_place= rset.getString(1);
	
	sql="select distinct a.dates, a.sleep, a.id, a.place, b.person from operate a, book b where b.place=a.place and b.dates=a.dates and a.id=b.id and a.id='"+id+"';"; //여기에는 숙박시작일자, 숙박일, 회원id가 들어있다.
	rset = stmt.executeQuery(sql);
	
	
	
	String dates[]=new String[k22_listnum];
/////////////////////////////////////////////////////////////////////////////////여기까지가 주요data관련 정보 얻기	
	int k22_MGG = 0; //최대 GG의 갯수를 파악하려고 한다.	
	if(k22_LastLine%100==0){  //100으로 나눈 페이지 수를 계산한다.
		k22_MGG = k22_LastLine/100;}
	else{
		k22_MGG = k22_LastLine/100+1;
	}
	int k22_MG=0; //한 GG내에서 최대 PG범위 1~10

	if(k22_GG<k22_MGG){ // GG가 최대 GG를 넘지 않는 페이지 뷰에서는...
		k22_MG=10;
	}
	else if(k22_GG==k22_MGG){ // GG가 최대 GG와 같을 경우 = 마지막 페이지가 있는 GG
		k22_MG= ((k22_LastLine/10)%10)+1;  //마지막 페이지인 PG(MG)는 0부터 시작되므로 1을 더한다. 
	}
////////////////////////////////////////////////////////////////////////////////페이지뷰를 만들기 위한 준비작업	
%>
<table border="0" bordercolor="lightgreen" cellpadding="0" cellspacing="0"  border-bottom="1px" bordercolordark="red" bordercolorlight="blue">
<tr bgcolor="magenta" bordercolordark="red" bordercolorlight="blue" >
<td align=center>날짜</td><td align=center>숙박일</td><td  align=center>회원id</td><td  align=center>장소</td><td  align=center>인원수</td><td>처리방법</td>
</tr>

<form method='post' name="myform">
<%

int k22_com=0;  // 마지막 페이지(GG의 마지막)를 보여주기 위한 변수 선언과 정의
int i=0; // 정보를 저장
	while(rset.next())
	{		

	
		
		if(k22_GG==k22_MGG && k22_MG < k22_PG_get){k22_com=k22_MG;}
		else{k22_com=k22_PG_get;}
		if(k22_LineCnt>(k22_GG-1)*100+k22_com*10) { //출력 리스트의 갯수가 10이상이면 그만 보여줌
				break;
		}
		if(k22_LineCnt >= (k22_GG-1)*100+(k22_com-1)*10) {
		dates[i]=(rset.getString(1));
		String dat=dates[i].replace("-","").trim();
		dates[i]=dat;
	
%>
<!--개인별 회원id 출력부분-->

		<tr>
		<td width=70px><input type="text" value="<%=dates[i]%>" name="dates" hidden ><%=rset.getString(1)%></td>		
		<td align=center><input type="number" value="<%=rset.getInt(2)%>" name="sleep" hidden><%=rset.getInt(2)%></td>		
		<td><input type="text" value="<%=rset.getString(3)%>" name="id" hidden><%=rset.getString(3)%></td>  		
		<td><input type="text" value="<%=rset.getString(4)%>" name="place" hidden><%=rset.getString(4)%></td>  
		<td align=center><input type="number" value="<%=rset.getInt(5)%>" name="person" hidden><%=rset.getInt(5)%></td>  
		<td><input type=button  value="수정" OnClick="submitForm('update','<%=dates[i]%>',<%=rset.getInt(2)%>,'<%=rset.getString(3)%>','<%=rset.getString(4)%>',<%=rset.getInt(5)%>)">
		<input type=button  value="삭제" OnClick="submitForm('delete','<%=dates[i]%>',<%=rset.getInt(2)%>,'<%=rset.getString(3)%>','<%=rset.getString(4)%>',<%=rset.getInt(5)%>)"></td>
		</tr>
<%
		}
		
		i++;
		k22_LineCnt++;
	}	
		%></form>


<tr>
<form action="f_01.jsp">
<td colspan="6" align="right"><input type="submit"  value="목록으로"></td>
</form>
</tr>
</table>
<%		
	
	
	stmt.close();
	conn.close();
	rset.close();
%>	
<table border="0">
<%
	if(k22_GG>1){
		
%>

<tr>
<th align = right width=400px><a href ="f_01.jsp?GG=<%=k22_GG-1%>&id=<%=id%>&PG=1" style="text-decoration:none !important">이전 10페이지</a></th>
<%		

}
else{
	%>
<tr>
<th align = right width=450px>더 이상 갈 데가 없어</a></th>
<%
}
if(k22_MG<k22_PG_get){
	while(k22_PG<k22_MG){
	%>
	<td text-decoration: none><a  href ="f_02.jsp?PG=<%=k22_PG%>&GG=<%=k22_GG%>&id=<%=id%>" style="text-decoration:none !important" ><%=k22_PG%></a></td>
	<%
	k22_PG = k22_PG+1;
	}
	%>
	<td text-decoration: none><a  href ="f_02.jsp?PG=<%=k22_PG%>&GG=<%=k22_GG%>&id=<%=id%>" ><%=k22_PG%></a></td>
	<%
	k22_PG = k22_PG+1;
}
	else{
	while(k22_PG<k22_PG_get){
	%>
	<td text-decoration: none><a hover href ="f_02.jsp?PG=<%=k22_PG%>&GG=<%=k22_GG%>&id=<%=id%>" style="text-decoration:none !important" ><%=k22_PG%></a></td>
	<%
	k22_PG = k22_PG+1;
	}
	%>
	<td text-decoration: underline><a href ="f_02.jsp?PG=<%=k22_PG_get%>&GG=<%=k22_GG%>&id=<%=id%>" ><%=k22_PG_get%></a></td>
	<%
	k22_PG = k22_PG+1;
	while(k22_PG<=k22_MG){
	%>
	<td text-decoration: none><a  href ="f_02.jsp?PG=<%=k22_PG%>&GG=<%=k22_GG%>&id=<%=id%>" style="text-decoration:none !important" ><%=k22_PG%></a></td>
	<%
	k22_PG = k22_PG+1;
	}
}
if(k22_GG<k22_MGG){
%>
<th align = left width =200px><a href ="f_02.jsp?GG=<%=k22_GG+1%>&PG=<%=k22_MG%>&id=<%=id%>" style="text-decoration:none !important">다음 10페이지</a></th>
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