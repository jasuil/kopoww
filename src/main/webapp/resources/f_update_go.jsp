<!-제목: 관리자용 리스트 개인별 예약 수정실행->
<!-날짜: 2016.07.19->
<!-저자: 짱성일->
<!-하고싶은 말: jsp은 과연 내 손안에 있소이다!->
<!--예약 수정실행-->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>펜션예약 수정</h1> <!- operate은 날짜계산 테이블 book은 예약완료된 테이블 ->
<%
	String date = request.getParameter("dates"); //  회원이 입력한 숙박시작날짜	
	String gonedate = request.getParameter("gonedate"); //  회원의 얘약했던 숙박시작날짜
	String sleeps = request.getParameter("sleep"); //  숙박기간
	int gonesleep = Integer.parseInt(request.getParameter("gonesleep")); //  숙박기간
	String persons = request.getParameter("person"); //  인원수
	String place =new String(request.getParameter("place").getBytes("8859_1"),"utf-8"); //  장소
	String goneplace =request.getParameter("goneplace"); //  장소	
	int goneperson =Integer.parseInt(request.getParameter("goneperson")); //  장소	
	String id = request.getParameter("id"); //  회원번호
	String k01=date.substring(0,4);
	String k02=date.substring(4,6);
	String k03=date.substring(6,8);
	date=k01+"-"+k02+"-"+k03; //날짜를 받아올 때 '-'가 안되서 숫자를 입력받아 다시 붙임
		
	if(date.length()<=0 ||sleeps.length()<=0 ||persons.length()<=0 ||id.length()<=0  ){
	%>
	
	<script>
	alert("입력사항이 부족합니다.");
	document.location="index.jsp";
	</script>
	<%
	return;
	}
	
	int sleep= Integer.parseInt(sleeps);
	int person= Integer.parseInt(persons);
	int exist=0;  //겹지는 날짜가 있으면 취소할 변수
	String []newdate = new String[sleep];
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql="";
	int i=0;//for를 위한 변수
	int count=0;
	String gone[]=new String[gonesleep];//숙박한 기간을 배열에 저장한다.
	ResultSet rset = null;
	
	//우선 예약날짜가 겹치는지 확인한다.
	
	sql = "select count(place) from book where dates in ('"+date+"' + interval "+sleep+" day, '"+date+"') and place='"+place+"';";
	rset= stmt.executeQuery(sql);
	rset.next();
	exist = rset.getInt(1);
		%>
		<script>
		alert("<%=exist%>");

		</script>
		<%
	if(exist>0){
			%>
		<script>
		alert("중복되는 일자가 있습니다");
		document.location = "f_01.jsp";
		</script>
		<%
		return ;
	}
	else{
	
	for(i=0;i<gonesleep;i++){  //먼저 숙박한 기간을 구한다.
		sql="select '"+gonedate+"'+ interval "+i+" day from dual;";
		rset = stmt.executeQuery(sql);
		rset.next();
		gone[i]=rset.getString(1); //숙박한 기간을 배열에 저장한다.
	}
	for(i=0;i<gonesleep;i++){
		sql="delete from book where place='"+goneplace+"' and dates='"+gone[i]+"' and id='"+id+"' and person="+goneperson+";";
		stmt.executeUpdate(sql);
		
		%>
		<script>
		alert("예외발생 내용: <%=gone[i]%>");
		</script>
		<%
		}
	}
	///////////////////////////////////////////////////////////////////////////////////////지우기 끝
		if(exist<=0){sql = "update operate set dates='"+date+"' , sleep="+sleep+", place='"+place+"' where id='"+id+"' and dates='"+gonedate+"' and place='"+goneplace+"';";
			stmt.executeUpdate(sql);
		
			for(i=0;i<sleep;i++){
				sql="insert into book (dates,person,place,id) values('"+date+"'+ interval "+i+" day,"+person+",'"+place+"','"+id+"');";
				stmt.executeUpdate(sql);
			
				sql="select '"+date+"' + interval "+i+" day from dual;";
				rset = stmt.executeQuery(sql);
				rset.next();			
				newdate[i]=rset.getString(1);
				count++;
			}}
			else{}
	
	stmt.close();
	conn.close();

%>
<script>
alert("<%=date%>부터   <%=sleep-1%>박 <%=sleep%>일 동안 <%=place%> 인원<%=person%>의 예약이 정상적으로 등록이 되었습니다.");
document.location="f_01.jsp";
</script>
</body>
</html>