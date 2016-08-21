<!-제목: 관리자용 얘약상황 리스트에서 레코드삭제->
<!-날짜: 2016.07.19->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<!--예약 삭제-->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>예약내역 삭제</h1>
<%
	String k22_id = new String( request.getParameter("id").getBytes("8859_1"),"utf-8"); //  id
	String k22_dates = request.getParameter("dates"); //  id
	String k22_sleeps = request.getParameter("sleep"); //  id
	String k22_place = request.getParameter("place"); //  id
	String k22_persons = request.getParameter("person"); //  id
	String k01=k22_dates.substring(0,4);
	String k02=k22_dates.substring(4,6);
	String k03=k22_dates.substring(6,8);

	int k22_person= Integer.parseInt(k22_persons);
	int k22_sleep= Integer.parseInt(k22_sleeps);
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql="";
	int i=0;
	ResultSet rset=null;
	try{
	String gone[]=new String[k22_sleep]; //숙박기간을 구하기 위한 배열선언
	
	for(i=0;i<k22_sleep;i++){  //숙박기간을 구한다.
		sql="select '"+k22_dates+"'+ interval "+i+" day from dual;";
		rset = stmt.executeQuery(sql);
		rset.next();
		gone[i]=rset.getString(1);
	}
	for(i=0;i<k22_sleep;i++){ //숙박기간을 예약테이블에서 지운다.
		sql="delete from book where place='"+k22_place+"' and dates='"+gone[i]+"' and id='"+k22_id+"' ;";
		stmt.executeUpdate(sql);
	}
	
	sql="delete from operate where id='"+k22_id+"' and dates='"+k22_dates+"' and place='"+k22_place+"';";
	stmt.executeUpdate( sql );
	}catch(Exception e){
		%>
		<script>
		alert("<%=e%>");
		</script>
		<%
	}
	rset.close();
	stmt.close();
	conn.close();
	
%>

예약이 삭제가 되었습니다.
<script>
alert("<%=k22_dates%>일자 장소는<%=k22_place%>인 회원id<%=k22_id%>가 삭제되었습니다.");
document.location="f_01.jsp";
</script>
</body>
</html>