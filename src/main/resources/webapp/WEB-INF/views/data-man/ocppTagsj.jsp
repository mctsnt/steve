<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONException"%>
<%@page import="org.json.JSONString"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

JSONObject json      = new JSONObject();
JSONArray  tags = new JSONArray();
JSONObject tag;

%>
<c:forEach items="${ocppTagList}" var="item">
	<c:set var="id" value="${item.idTag}"/>
	<c:set var="parentId" value="${item.parentIdTag}"/>
	<c:set var="expiry" value="${item.expiryDate}"/>
	<c:set var="trans" value="${item.inTransaction}"/>
	<c:set var="blocked" value="${item.blocked}"/>
	
	<%
    	String tId = "";
    	tId = tId + (String)pageContext.getAttribute("id");   
    	String tParentId = "";
    	tParentId = tParentId + (String)pageContext.getAttribute("parentId");
    	String tExp = "";
    	tExp = tExp + (String)pageContext.getAttribute("expiry"); 
    	String tTransaction = "";
    	tTransaction = tTransaction + Boolean.toString((Boolean)pageContext.getAttribute("trans")); 
    	String tBlock = "";
    	tBlock = tBlock + Boolean.toString((Boolean)pageContext.getAttribute("blocked")); 
    	
 
	tag = new JSONObject();
	tag.put("ID Tag"     , tId);
	tag.put("Parent ID Tag"        , tParentId);
	tag.put("Expiry Date/Time"           , tExp);
	tag.put("In Transaction?"            , tTransaction);
	tag.put("Blocked?"            , tBlock);
	tags.put(tag);
	%> 
	
</c:forEach>

<%
json.put("OCPP Tags information", tags);

response.setContentType("application/json");
response.getWriter().write(json.toString());


 %>
