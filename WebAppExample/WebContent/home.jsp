<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%-- import ext files --%>
<c:import url="header.jsp">
	<%--set title as parameter --%>
	<c:param name="title" value="Home Page"></c:param>
</c:import>
	
<%-- Doing a SQL query in JSTL --%>
<sql:setDataSource var="ds" dataSource="jdbc/servletdatabase" />

<sql:query dataSource="${ds}" sql="select * from images limit 10" var="results"/>

<%-- Creating grids from SQL queries using arithmetic operators --%>
<table class="images">

<c:set var="tableWidth" value="5" />

<c:forEach var="image" items="${results.rows}" varStatus="row">
	
	<%-- create row with 2 images per row --%>
	<c:if test="${row.index % tableWidth == 0}">
		<tr>
	</c:if>
	
		<%-- creating scoped variables in JSTL from columns from table --%>
		<c:set scope="page" var="imgName" value="${image.item}.${image.extension}"></c:set>
		
		<%-- The HTML image tag --%>
		<%-- form the path to files from columns from c:set variable --%>
		<td>
			<!-- link to image.jsp -->
			<a href="<c:url value="/gallery?action=image&image=${image.id}" /> ">
				<img width="160" src="${pageContext.request.contextPath}/pics/${imgName}">
			</a>
		</td>
	
	<%-- close row after 5. image --%>
	<c:if test="${row.index+1 % tableWidth == 0}">
		</tr>
	</c:if>

</c:forEach>

</table>
<%-- import ext files --%>
<c:import url="footer.jsp"></c:import>
