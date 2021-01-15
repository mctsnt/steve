<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="org.joda.time.LocalDateTime"%>
<%@page import="org.joda.time.format.DateTimeFormat"%>
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

JSONObject ocppTag;

%>

<c:set var="id" value="${ocppTagForm.idTag}"/>
<c:set var="parId" value="${ocppTagForm.parentIdTag}"/>
<c:set var="activeTrans" value="${activeTransactionCount}"/>
<c:set var="maxTrans" value="${ocppTagForm.maxActiveTransactionCount}"/>
<c:set var="expiry" value="${ocppTagForm.expiration}"/>

<%


LocalDateTime expDate=null;
expDate = (LocalDateTime)pageContext.getAttribute("expiry");
String tExp = "";
if (expDate!=null)
	tExp = expDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
else
	tExp = "null";





String tId = ""; 
tId = tId + (String)pageContext.getAttribute("id"); 
String tParentId = ""; 
tParentId = tParentId + (String)pageContext.getAttribute("parId");    
String tActT = ""; 
tActT = tActT + (Long)pageContext.getAttribute("activeTrans");
String tMaxT = ""; 
tMaxT = tMaxT + Integer.toString((Integer)pageContext.getAttribute("maxTrans"));

ocppTag = new JSONObject();
ocppTag.put("Id Tag"     , tId);
ocppTag.put("Parent Id Tag"     , tParentId);
ocppTag.put("Active Transaction Count"        , tActT);
ocppTag.put("Max. Active Transaction Count"        , tMaxT);
ocppTag.put("Expiry Date/Time"        , tExp);

response.setContentType("application/json");
response.getWriter().write(ocppTag.toString());


 %>

