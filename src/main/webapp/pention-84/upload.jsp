<%@page import="java.io.*, java.sql.*,javax.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<html>
<head>
</head>
<body>
<form action= "upload_go.jsp" enctype="multipart/form-data" method="post">
올린이: <input type="text" name="name">
file: <input type="file" name="file">
<input type=submit value="전송">
</form>
</body>
</html>