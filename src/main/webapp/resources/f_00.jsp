<meta charset="UTF-8">
<html>
<head>
<script>
function log(){
	if(manager.pass.value=="1212"){
	document.location="f_01.jsp";	
	}else{
		alert("틀렸음");
		return;
	}
}
</script>
</head>
<body>
비밀번호을 넣으시오<br/>
<form name="manager" >
<input type="password" name="pass">
<input type="button" value="입력" onclick="log()">
</form>
</body>
</html>