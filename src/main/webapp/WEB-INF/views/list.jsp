<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%-- <%@include file="/WEB-INF/views/include/header.jsp"%> --%>

				
<table class="table table-bordered">
	<tr>
		<th style="width: 10px">BNO</th>
		<th>TITLE</th>
		<th>id</th>
		<th>REGDATE</th>
		<th style="width: 40px">VIEWCNT</th>
	</tr>


<c:forEach items="${list}" var="BoardVO">

	<tr>
		<td>${BoardVO.id}</td>
		<td><a href='/board2/read?id=${BoardVO.id}'>${BoardVO.title}</a></td>
		<td>${BoardVO.id}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
				value="${BoardVO.date}" /></td>
		<td><span class="badge bg-red">${BoardVO.viewcnt }</span></td>
	</tr>

</c:forEach>

</table>

<%-- <%@include file="/WEB-INF/views/include/footer.jsp"%> --%>
