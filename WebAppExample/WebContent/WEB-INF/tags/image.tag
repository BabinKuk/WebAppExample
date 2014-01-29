<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="width" required="false" type="java.lang.Integer" description="The width of the tag" %>
<%@ attribute name="stem" required="true" type="java.lang.String" description="The file name without extension" rtexprvalue="true" %>
<%@ attribute name="extension" required="true" type="java.lang.String" description="The file extension" rtexprvalue="true" %>

<%-- set default width --%>
<c:if test="${empty width}" >
	<c:set var="width" value="200" />
</c:if>

<%-- set image name --%>
<c:set scope="page" var="imgName" value="${stem}.${extension}"></c:set>

<%-- form the path to files from columns from c:set variable --%>
<!-- this was from jsp file img src="${pageContext.request.contextPath}/pics/${imgName}"-->

<img width=${width} src="${pageContext.request.contextPath}/pics/${imgName}" />