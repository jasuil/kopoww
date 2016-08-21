<!-제목: 관리자용 얘약상황 리스트에서 레코드수정->
<!-날짜: 2016.07.19->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*,java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script>
function ck(mode,id,goneplace,gonedates,goneperson,gonesleep){
	if(mode=="yes"){
		insert.action = "f_update_go.jsp?&gonedate="+gonedates+"&id="+id+"&goneplace="+goneplace+"&gonesleep="+gonesleep+"&goneperson="+goneperson; 
		insert.submit();		
	}else{
		insert.action="f_01.jsp";
		insert.submit();		
	}
		
}


</script>
</head>
<body>

<h1>펜션예약 수정</h1>
<%
	String k22_id = request.getParameter("id"); //  회원id	
	String k22_persons = request.getParameter("person"); //  인원
	String k22_dates = request.getParameter("date"); //  날짜
	String k22_sleeps = request.getParameter("sleep"); //  숙박일
	String k22_place = request.getParameter("place");
	int date=Integer.parseInt(k22_dates); //이것은 입력폼에 이전에 있던 것을 붙여넣는 것임
	String k01=k22_dates.substring(0,4);
	String k02=k22_dates.substring(4,6);
	String k03=k22_dates.substring(6,8);
	String k22_gonedate=k22_dates; //이것은 수정된 것을 보낼 때 쓰일 날짜임
	k22_dates=k01+"-"+k02+"-"+k03;

	int k22_person= Integer.parseInt(k22_persons);
	int k22_sleep= Integer.parseInt(k22_sleeps);
	String []room = new String[4]; //빈방을 확인하기 위한 배열
	int i=0; //반복문을 위한 변수
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql = ""; ResultSet rset = null;
	
	sql = "select distinct place from book where not place='"+k22_place+"';";
	rset = stmt.executeQuery(sql);
	while(rset.next()){
		room[i++] = rset.getString(1);
	}
	
	
	//일단 내용을 보여준다.
	%>
	<script>
	alert("<%=k22_place%>");
	</script>
<form method ='post' name='insert'>
<table border="1" cellpadding="1" cellspacing="0">
<tr>
<td align=center colspan=2>회원id</td>
<td width=70px><input type="text" name="id" value="<%=k22_id%>" hidden><%=k22_id%></td>
</tr>
<tr>
<td align=center>장소</td>
<td><select name="place"> <%--장소에 대한 선택 버튼 --%>
<option value="<%=k22_place%>"  selected><%=k22_place%><-예약했던 장소</option> <!- 이것은 html 주석임 ->
<%
for (i=0; i<3;i++){
%>
<option value="<%=room[i]%>" ><%=room[i]%></option>
<%	
}
%>
</td>
</select>
<br>
<td align=center>인원</td>
<td width=10px><input type="number" name="person" value="<%=k22_person%>"></td>
<br>
<td align=center>시작날짜</td>
<td><input type="text" name="dates" value="<%=date%>"></td>
<br>
<td align=center>숙박일</td>
<td><input type="number" name="sleep" value="<%=k22_sleeps%>"></td>
<br>
<td  colspan=2 width=50px align=right><input type=button value="수정" OnClick="ck('yes','<%=k22_id%>',
'<%=k22_place%>','<%=k22_gonedate%>','<%=k22_person%>','<%=k22_sleeps%>')">
<input type=button value="취소" OnClick="ck('no',0,0,0,0,0)">
</tr>
</form>
</table>
</body>
</html>