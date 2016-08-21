<!-제목:	예약상황->
<!-날짜: 2016.07.19->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<style>
	a{ color:red; font-weight:bold;} <!-- css -->
	table,tr{align:"center"; font-family:궁서;}
	</style>
</head> 
<body>
<center>
<a>한 달치 정도의 예약상황</a>
<%	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.0.6:33060/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql=null;
	int day=0;//day는 30일까지 출력하기 위한 변수
	int CurrentDay=0; //이것은 sql에서 요일을 숫자로 받아 나타내려고 함. 일요일은 1 토요일은 7
	
	sql = "select dayofweek(curdate()) from dual;";
	ResultSet rset = stmt.executeQuery(sql);
	rset.next();
	CurrentDay = rset.getInt(1);//오늘의 요일을 sql로 받아온다.
	String []places= new String[4];//빈 방이 있을 때 클릭하면 방 정보가 넘어가도록 하기 위한 배열
	String []bookedplaces = new String[4]; //예약된 방이 있는 것을 알려주는 배열
	int placesCount=0,i=0,none=0; //순서대로 말하면 배열의 위치, 그냥 for문, 빈방의 갯수 
	
%>
<table border="1">
<tr align="center">
<td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
</tr>
<%
if(CurrentDay==1){} //날짜가 일요일인 경우는 그냥 처음부터 쓰도록 한다. 뒤에 보면 안다.
else if(CurrentDay==2){out.print("<td></td>");} //당연히 그 다음 칸으로 이동 
else if(CurrentDay==3){out.print("<td></td><td></td>");}
else if(CurrentDay==4){out.print("<td></td><td></td><td></td>");}
else if(CurrentDay==5){out.print("<td></td><td></td><td></td><td></td>");}
else if(CurrentDay==6){out.print("<td></td><td></td><td></td><td></td><td></td>");}
else {out.print("<td></td><td></td><td></td><td></td><td></td><td></td>");}
	while(day<30)
	{
	if(CurrentDay%7==1){ //일요일인 경우 한 행을 새로이 시작한다.
%>
<tr  align="center">
<%
	}else{}
	sql="select curdate()+ interval "+day+" day from dual;";
	rset=stmt.executeQuery(sql);
	rset.next();
%>
<td><%=rset.getString(1)%>
<% 
	sql=" select count(distinct place) from book where not place "+
	"in ( select place from book where dates = curdate()+ interval "+day+" day);";//빈 방의 갯수세기
	rset = stmt.executeQuery( sql );
	rset.next();
	none= rset.getInt(1);
	
	sql="select place,id from book where dates=curdate()+ interval "+day+" day;";
	rset =stmt.executeQuery( sql );
%>	
	<br>
<%
	while(rset.next()){		
%>
	<%=rset.getString(1)%><br>
 <%				
	}	
		placesCount=0;//일단 장소 데이터를 입력받기 전에 배열의 위치를 초기화 시켜야 한다.
		for(i=0; i<4;i++){
			places[i]=null; //역시 초기화
		}
		if(none>0){
			i=0;
			for(i=0;i<4;i++){ 
			bookedplaces[i]=null; 
			}
			i=0;
			sql="select distinct  place from book where place in ( select place from book where dates = curdate()+ interval "+day+" day);";
			rset = stmt.executeQuery(sql); //그런데 아래 이 sql을 쓰는 이유는 다음 페이지 입력란에 이미 예약된 것을 없애기 위한 정보를 주기 위함이다.
			while(rset.next()){	
					bookedplaces[i++]=rset.getString(1);
						}
				
			sql="select distinct  place from book where not place in ( select place from book where dates = curdate()+ interval "+day+" day);";
			rset = stmt.executeQuery(sql); //이 sql은 예약안된 방을 구하는 것이다.
			while(rset.next()){	
			places[placesCount++]=rset.getString(1);
			
%>
	<a href="d_02.jsp?date=<%=day%>&places=<%=rset.getString(1)%>&booked1=<%=bookedplaces[0]%>&booked2=<%=bookedplaces[1]%>&booked3=<%=bookedplaces[2]%>&booked4=<%=bookedplaces[3]%>" style="text-decoration:none !important" title="<%=rset.getString(1)%>(으)로 예약하기">
	<%=rset.getString(1)%></a><br> <!-분명 CurrentDay는 아니다.->
<%		
			}  // booked1, booked2 , ... 은 예약된 방을 다음 페이지로 전달해서 선택란에 안 보이게 하기 위한 조치임, place는 선택란에 보이게 하려고...
		}
%>
</td>
<%
		if(CurrentDay%7==0){  //토요일인 경우 한 행을 끝낸다.
%>
</tr>
<%
		}
		else{}
		day++;
		CurrentDay++;
		rset.close();
	}
	stmt.close();
	conn.close();

%>	
</center>
</body>
</html>
</body>
</html>