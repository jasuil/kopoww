<!--글/댓글 입력-->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>펜션예약</h1> <!- operate은 날짜계산 테이블 book은 예약완료된 테이블 ->
<%
	String k22_date = request.getParameter("date"); //  회원이 입력한 숙박시작날짜	
	k22_sleeps = request.getParameter("sleep"); //  숙박기간
	k22_persons = request.getParameter("person"); //  인원수
	k22_place = request.getParameter("place"); //  장소
	k22_ids = request.getParameter("id"); //  회원번호
	
    k22_title = new String(request.getParameter("title").getBytes("8859_1"),"utf-8"); //  
	String k22_text = new String(request.getParameter("text").getBytes("8859_1"),"utf-8"); //  

	if(k22_place.equals("cat") )
	{
		k22_place="냥이방";
	}else if(k22_place.equals("rabbit")){
		k22_place="토끼방";
	}else if(k22_place.equals("deer")){
		k22_place="사슴방";
	}else{
		k22_place="남극곰방";
	}
	if(k22_date.length()<=0 ||k22_sleeps.length()<=0 ||k22_persons.length()<=0 ||k22_ids.length()<=0  ){
	%>
	
	<script>
	alert("입력사항이 부족합니다.");
	document.location="index.jsp";
	</script>
	<%
	return;
	}

	
	int k22_sleep= Integer.parseInt(k22_sleeps);
	int k22_person= Integer.parseInt(k22_persons);
	int k22_id= Integer.parseInt(k22_ids);
	
	Calendar dateIn = Calendar.getInstance();
	String indate = Integer.toString(dateIn.get(Calendar.YEAR))+"-";
	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH+1))+"-";
	indate = indate + Integer.toString(dateIn.get(Calendar.DATE));
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	String sql="";
	
	try{
		sql="insert into operate values('"+k22_date+"',"+k22_sleep","+k22_id");";
		stmt.executeUpdate(sql);
		for(int i=0;i<=k22_sleep;i++){
			sql="insert into book (dates,person,place,id) values('"+k22_date+"'+ interval "+i+"day,"+k22_person",'"+k22_place+"',"+k22_id+");";
			stmt.executeUpdate(sql);
		}
	}catch(Exception e){
		out.prontln(e);
	}		
	
	

	stmt.close();
	conn.close();

%>
<script>
alert("<%=k22_title%>이(가) 정상적으로 등록이 되었습니다.");
document.location="index.jsp";
</script>
</body>
</html>