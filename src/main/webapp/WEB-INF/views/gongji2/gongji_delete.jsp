<!-����: �̿��ı� �� ����->
<!-��¥: 2016.07.25->
<!-����: ¯����->
<!-�ϰ���� ��: jsp�� ���� �� �վȿ� �ּ��̴�!->
<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>

<h1>�̿��ı� �� ����</h1>
<%
	String k22_ids = request.getParameter("id"); //  id
	int id= Integer.parseInt(k22_ids);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.0.6:33060/koposw22", "root","1212");
	Statement stmt =conn.createStatement();
	
	String sql="delete from hugi where id="+id+";";
	stmt.executeUpdate( sql );
	sql="delete from comment where id="+id+";";
	stmt.executeUpdate( sql );
	/////////////////////////////////////////////////////////////////////////������ʹ� ������ ���϶�����
	sql = "select max(numb) from hugifile where id="+id+";";
	rset = stmt.executeQuery(sql);
	rset.next();
	int numb = rset.getInt(1) + 1;
	sql="delete  from hugifile where id="+id+" and name='"+fileName+"';";
	stmt.executeUpdate(sql);
	sql="update hugifile set numb=numb-1 where numb>="+numb+";";
	stmt.executeUpdate(sql);
	File f = new File("/var/lib/tomcat7/webapps/ROOT/fileupload/"+fileName); //�۹�ȣ�� ���� �տ� �پ��ִ�.
	if(f.exists()) f.delete();
	stmt.close();
	conn.close();
	
%>
<script>
alert("���� ������ �Ǿ����ϴ�.");
document.location="gongji_list.jsp";
</script>
</body>
</html>