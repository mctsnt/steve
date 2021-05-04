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

JSONObject details;
JSONArray  results = new JSONArray();
JSONObject result;

%>

<c:set var="name" value="${task.ocppVersion.value}"/>
<c:set var="origin" value="${task.origin}"/>
<c:set var="opName" value="${task.operationName}"/>
<c:set var="caller" value="${task.caller}"/>
<c:set var="start" value="${task.startTimestamp}"/>
<c:set var="end" value="${task.endTimestamp}"/>
<c:set var="requests" value="${task.resultMap.size()}"/>
<c:set var="response" value="${task.responseCount}"/>
<c:set var="errors" value="${task.errorCount}"/>



<%
	String dname = "";
    	dname = dname + (pageContext.getAttribute("name")).toString() + " " + (pageContext.getAttribute("opName")).toString();   
    	String dorigin = "";
    	dorigin = dorigin + (pageContext.getAttribute("origin")).toString() + " (" + (pageContext.getAttribute("caller")).toString() + ")";
    	String dreq = "";
    	dreq = dreq + (pageContext.getAttribute("requests")).toString(); 
    	String dres = "";
    	dres = dres + (pageContext.getAttribute("response")).toString();    	
    	String derr = "";
    	derr = derr + (pageContext.getAttribute("errors")).toString(); 
    	
    	String dstart = ""; 
    	DateTime startDate=null;
	startDate = (DateTime)pageContext.getAttribute("start");
	if (startDate!=null)
		dstart = startDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
	else
		dstart = "null";
    	
    	String dend = ""; 
    	DateTime endDate=null;
	endDate = (DateTime)pageContext.getAttribute("end");
	if (endDate!=null)
		dend = endDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
	else
		dend = "null";	


	details = new JSONObject();
	details.put("Operation name"     , dname);
	details.put("Origin"     , dorigin);
	details.put("Start timestamp"        , dstart);
	details.put("End timestamp"        , dend);
	details.put("# of charge point requests"        , dreq);
	details.put("# of responses"        , dres);
	details.put("# of errors"        , derr);
%>

<c:forEach items="${task.resultMap}" var="result">
	<c:set var="chargeboxid" value="${result.key}"/>

	<%
	String rres = "";
	%>
	<c:if test="${not empty result.value.response}">
		<c:set var="response" value="${result.value.response}"/>
		<%
		rres = rres + (pageContext.getAttribute("response")).toString();
		%>
	</c:if>
	
	<%
	String rerror = "";
	%>
	<c:if test="${not empty result.value.errorMessage}">
		<c:set var="resultError" value="${result.value.errorMessage}"/>
		<%
		rerror = rerror + (pageContext.getAttribute("resultError")).toString(); 
		%>
	</c:if>

	
	<%
	String rid = "";
    	rid = rid + (pageContext.getAttribute("chargeboxid")).toString();    	

	
	
	result = new JSONObject();
	result.put("ChargeBox ID"     , rid);	
	result.put("Response"   , rres);
	result.put("Error"        , rerror);
	results.put(result);
	%>

</c:forEach>


<%
	details.put("Task Results", results);

	response.setContentType("application/json");
	response.getWriter().write(details.toString());


 %>
