<!-제목: 펜션예약 입력 폼->
<!-날짜: 2016.07.25->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>펜션예약</h1> <!- operate은 날짜계산 테이블 book은 예약완료된 테이블 ->
<%
	String k22_date = request.getParameter("date"); //  회원이 입력한 숙박시작날짜	
	String k22_sleeps = request.getParameter("sleep"); //  숙박기간
	String k22_persons = request.getParameter("person"); //  인원수
	String k22_place =new String( request.getParameter("place").getBytes("8859_1"),"utf-8"); //  장소 
	String k22_id = new String( request.getParameter("id").getBytes("8859_1"),"utf-8"); //  회원번호
	String k01=k22_date.substring(0,4);
	String k02=k22_date.substring(4,6);
	String k03=k22_date.substring(6,8);
	int dates = Integer.parseInt(k22_date);
	k22_date=k01+"-"+k02+"-"+k03; //날짜를 받아올 때 '-'가 안되서 숫자를 입력받아 다시 붙임
   

	if(k22_date.length()<=0 ||k22_sleeps.length()<=0 ||k22_persons.length()<=0 ||k22_id.length()<=0){
	%>
	
	<script>
	alert("입력사항이 부족합니다.");
	document.location="main.htm";
	</script>
	<%
	return;
	}

	
	int k22_sleep= Integer.parseInt(k22_sleeps);
	int k22_person= Integer.parseInt(k22_persons);
	int i=0,k=0;
	String [] gone=new	String[k22_sleep];
	

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql="";
	ResultSet rset=null;
	try{	//새로 예약을 입력받기를 시도한다.
		sql="insert into operate values('"+k22_date+"',"+k22_sleep+",'"+k22_id+"','"+k22_place+"');";//숙박날짜계산 테이블에 자료를 우선 넣는다.
		stmt.executeUpdate(sql);
		for(i=0;i<k22_sleep;i++,k++){
			
			sql="insert into book (dates,person,place,id) values('"+k22_date+"'+ interval "+i+" day,"+k22_person+",'"+k22_place+"','"+k22_id+"');";
			stmt.executeUpdate(sql);//예약테이블에 자료를 넣는다.
			
			sql="select fee from fee where place = '"+k22_place+"';";
			rset = stmt.executeQuery(sql);
			rset.next();
			int fee = rset.getInt(1);
			
			int totalfee =  k22_person * k22_sleep * fee ;
	%><script>
	alert("합계금액은 <%=totalfee%>원입니다. ");
	</script><%
		}
	}catch(Exception e){
	
	for(i=0;i<k;i++){ //숙박기간을 예약테이블에서 지운다.
	
		sql="delete from book where place='"+k22_place+"' and dates='"+k22_date+"' + interval "+i+" day ;";
		stmt.executeUpdate(sql);
	}
	
	sql="delete from operate where id='"+k22_id+"' and dates='"+k22_date+"' and place='"+k22_place+"';";
	stmt.executeUpdate( sql );
	%>
	<script>
	alert("중복되는 방이 날짜에 있습니다.<%=e%>");
	document.location = "d_01.jsp";
	</script>
	<%
	}
	stmt.close();
	conn.close();

%>
<script>
alert("<%=k22_date%>부터 <%=k22_sleep-1%>박 <%=k22_sleep%>일 동안 <%=k22_place%> 인원<%=k22_person%>의 예약이 정상적으로 등록이 되었습니다.");
document.location="d_01.jsp";
</script>
</body>
</html>