<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--import custom tag --%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ps" %>

<%-- import ext files --%>
<c:import url="header.jsp">
	<%--set title as parameter --%>
	<c:param name="title" value="View Image Page"></c:param>
</c:import>

<center>

	<%-- Fetch the image data --%>
	<%-- Doing a SQL query in JSTL --%>
	<%-- If we also need to update the image rating, we need to
	get the image data and updating the rating in a single transaction --%>
	<sql:transaction dataSource="jdbc/servletdatabase">
	
		<%-- sql using wildcards --%>
		<sql:query sql="select * from images where id=?" var="results">
			<%-- set the wildcard parameter --%>
			<sql:param>${param.image}</sql:param>
		</sql:query>
		
		<%-- creating scoped variables in JSTL from columns from table --%>
		<%-- get the first item from the list --%>
		<c:set scope="page" var="image" value="${results.rows[0]}"></c:set>
		<%-- moved to custom tag c:set scope="page" var="imgName" value="${image.item}.${image.extension}"></c:set--%>
		
		<c:set scope="page" var="average_ranking" value="${image.avg_ranking}" />
		
		<%-- If the user has clicked to rate the image, do the rating. --%>
		<c:if test='${param.action == "rate"}'>
			<c:set scope="page" var="newRating"
				value="${(image.avg_ranking * image.ranking + param.ranking)/(image.ranking + 1)}" />
	
			<c:set scope="page" var="average_ranking" value="${newRating}" />
	
			<%-- update table images --%>
			<sql:update sql="update images set avg_ranking=? where id=?">
				<sql:param>${newRating}</sql:param>
				<sql:param>${param.image}</sql:param>
			</sql:update>
			
			<%-- update table images --%>
			<sql:update sql="update images set ranking=? where id=?">
				<sql:param>${image.ranking+1}</sql:param>
				<sql:param>${param.image}</sql:param>
			</sql:update>
	
		</c:if>
	
	</sql:transaction>
	
	
	<%-- Show the title, first letter capitalized --%>
	<%--                  first letter capitalized                    others not capitalized --%>
	<H2><c:out value="${fn:toUpperCase(fn:substring(image.item, 0,1))}${fn:toLowerCase(fn:substring(image.item, 1, -1))}" /></H2>
	
	<span class="rating">Rated: <fmt:formatNumber value="${average_ranking}" maxFractionDigits="2"/></span>
	
	<%-- create HTML form to display the image --%>
	<table style="border: none;">
		<tr>
			<td>
				<br style="margin-bottom: 1px;">
					<span class="attribution">Image by <a class="attribution" target="_blank" href="${image.url}">${image.name}</a></span>
				<br>
					<%-- The HTML image tag --%>
					<%-- form the path to files from columns from c:set variable --%>
					<%--ps custom tag used instead img src="${pageContext.request.contextPath}/pics/${imgName}" /--%>

				<%-- custom tag --%>
				<ps:image width="200" stem="${image.item}" extension="${image.extension}"/>
			</td>
			<td>
				<form action='<c:url value="/gallery" />' method="post">
					
					<%-- hidden fields when submitting the form --%>
					<input type="hidden" name="action" value="rate" /> 
					<input type="hidden" name="image" value="${image.id}" />
					
					<table style="padding: 20px; border: none;">
						<tr>
							<td><h3>
									<i>Rate It!</i>
								</h3></td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="5">5
								- Amazing</input>
							</td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="4">4
								- Good</input>
							</td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="3"
								checked="checked">3 - Average</input>
							</td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="2">2
								- Bad</input>
							</td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="1">1
								- Horrendous</input>
							</td>
						</tr>
						<tr>
							<td align="left"><input type="submit" name="submit"
								value="OK"></input>
							</td>
						</tr>	
				</form>					
			</td>
		</tr>
	</table>

<center>
<%-- import ext files --%>
<c:import url="footer.jsp"></c:import>
