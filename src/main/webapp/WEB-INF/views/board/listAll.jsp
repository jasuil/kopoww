<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%-- <%@include file="../include/header.jsp"%> --%>

<!-- Main content -->

		
					<h3 class="box-title">공지사항</h3>
				
<table class="table table-bordered">
	<tr>
		<th style="width: 10px">번호</th>
		<th>TITLE</th>
		<th>id</th>
		<th>REGDATE</th>
		<th style="width: 40px">조회수</th>
	</tr>


<c:forEach items="${list}" var="boardVO">

	<tr>
		<td>${boardVO.id}</td>
		<td><a href='/board/read?id=${boardVO.id}'>${boardVO.title}</a></td>
		<td>${boardVO.id}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
				value="${boardVO.date}" /></td>
		<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>
	</tr>

</c:forEach>

</table>

	
<script>
    
    var result = '${msg}';
    
    if(result == 'SUCCESS'){
    	alert("처리가 완료되었습니다.");
    }
    
    </script>

<%-- <%@include file="../include/footer.jsp"%> --%>
