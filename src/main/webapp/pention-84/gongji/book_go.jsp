<!--��/��� �Է�-->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>��ǿ���</h1> <!- operate�� ��¥��� ���̺� book�� ����Ϸ�� ���̺� ->
<%
	String k22_date = request.getParameter("date"); //  ȸ���� �Է��� ���ڽ��۳�¥	
	k22_sleeps = request.getParameter("sleep"); //  ���ڱⰣ
	k22_persons = request.getParameter("person"); //  �ο���
	k22_place = request.getParameter("place"); //  ���
	k22_ids = request.getParameter("id"); //  ȸ����ȣ
	
    k22_title = new String(request.getParameter("title").getBytes("8859_1"),"utf-8"); //  
	String k22_text = new String(request.getParameter("text").getBytes("8859_1"),"utf-8"); //  

	if(k22_place.equals("cat") )
	{
		k22_place="���̹�";
	}else if(k22_place.equals("rabbit")){
		k22_place="�䳢��";
	}else if(k22_place.equals("deer")){
		k22_place="�罿��";
	}else{
		k22_place="���ذ���";
	}
	if(k22_date.length()<=0 ||k22_sleeps.length()<=0 ||k22_persons.length()<=0 ||k22_ids.length()<=0  ){
	%>
	
	<script>
	alert("�Է»����� �����մϴ�.");
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
alert("<%=k22_title%>��(��) ���������� ����� �Ǿ����ϴ�.");
document.location="index.jsp";
</script>
</body>
</html>