<!-제목: 예약받기 폼->
<!-날짜: 2016.07.19->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*,java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<head>
</head>
<body>
<center>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql = "";
	ResultSet rset = null;
	String dates = request.getParameter("date");
	String places = request.getParameter("places");
	String []booked = new String [4];
	String []bookedplace = new String[4];
	booked[0] = request.getParameter("booked1");  //예약된 방을 받아온다.
	booked[1] = request.getParameter("booked2");
	booked[2] = request.getParameter("booked3");
	booked[3] = request.getParameter("booked4");
	int i=0, count=0;
	while(i<4){  //예약된 방이 있는 경우에만 문자열을 저장하도록 한다.
		if(booked[i]==null || booked[i].equals("null")){
			//0은 메뉴에서 바로 예약하기로 들어갈 때 nullpointer를 방지하기 위함이다.
	}
		else{
			bookedplace[i]=booked[i]; //예약된 방이 여기에 저장된다.
		count++;
		}	
		i++;
	}

	
for(i=0;i<count;i++){

}
	int date=0;
	
	if(dates==null ){
		sql = "select curdate() from dual;";
	
	}else{
		sql = "select curdate() +  interval "+dates+" day from dual;";				
	}
	
	rset = stmt.executeQuery(sql);
	rset.next();
	dates= rset.getString(1).trim().replace("-","");
	date= Integer.parseInt(dates);

%>
예약하기
<table>
<tr><td></td><td>날짜</td><td>숙박일</td><td>인원수</td><td>장소</td><td>회원번호</td></tr>
<form method="post" action="book_go.jsp">
<tr>
<td>
숫자만 입력하시오 예:</td><td><input type="number" name="date" value="<%=date%>" cols="10" title="꼭 <%=date%>형식으로 입력하시오"></td>
<td><input type="number" name="sleep" value="1" max="100" min="1" step="1"></td>
<td><input type="number" name="person" value="1" size=10></td>
<td><select name="place"> <%--장소에 대한 선택 버튼 --%>
<%
if(places==null){
%>
		<option value="도미토리"  selected>도미토리</option>
		<option value="루왁" >루왁</option>
		<option value="블루마운틴">블루마운틴</option>
		<option value="수프리모">수프리모</option>
<%
}else{
		
		%>
		<option value="<%=places%>" selected><%=places%></option>
		<%
			for(i=0;i<4;i++){
			booked[i]=null;
		}
		i=0;
		sql = "select distinct place from book where not place in (";
		while(i<count){
		sql += 	"'"+bookedplace[i]+"',";
			i++;
		}
		sql += "'"+places+"');";
		rset = stmt.executeQuery(sql);
		
		int k=0;
		while(rset.next()){			
			booked[k++] = rset.getString(1);	
		}      
		
		for(i=0; i<k;i++){ 
			%>
<option value="<%=booked[i]%>" ><%=booked[i]%></option>
<%
		}
		
	}
%>
</td>
</select>
<td><input type="text" name="id" value="" size=10></td>
</tr>
<tr>
<td colspan=6 align=right><input type=submit  value='예약하기'></td>
</tr>
</form>
</table>
</center>

<%
rset.close();
stmt.close();
conn.close();
%>
</body>
</html>