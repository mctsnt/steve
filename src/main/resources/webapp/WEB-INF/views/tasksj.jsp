<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="org.joda.time.LocalDateTime"%>
<%@page import="org.joda.time.format.DateTimeFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONException"%>
<%@page import="org.json.JSONString"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

JSONObject json      = new JSONObject();
JSONArray  tasks = new JSONArray();
JSONObject task;

%>

<c:forEach items="${taskList}" var="task">
	<c:set var="id" value="${task.taskId}"/>
	<c:set var="origin" value="${task.origin}"/>
	<c:set var="start" value="${task.start}"/>
	<c:set var="end" value="${task.end}"/>	
	<c:set var="response" value="${task.responseCount}"/>
	<c:set var="request" value="${task.requestCount}"/>	
	
	
	

 	<%
    	String tid = ""; 
    	tid = tid + (pageContext.getAttribute("id")).toString();   
    	String torigin = ""; 
    	torigin = torigin + (pageContext.getAttribute("origin")).toString();
    	String tres = ""; 
    	tres = tres + (pageContext.getAttribute("response")).toString(); 
    	String treq = ""; 
    	treq = treq + (pageContext.getAttribute("request")).toString(); 
    	
    	String tstart = ""; 
    	DateTime startDate=null;
	startDate = (DateTime)pageContext.getAttribute("start");
	if (startDate!=null)
		tstart = startDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
	else
		tstart = "null";
    	
    	String tend = ""; 
    	DateTime endDate=null;
	endDate = (DateTime)pageContext.getAttribute("end");
	if (endDate!=null)
		tend = endDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
	else
		tend = "null";

    
 
	task = new JSONObject();
       task.put("Task ID"     , tid);
       task.put("Origin"        , torigin);
       task.put("Start Timestamp"           , tstart);
       task.put("End Timestamp"            , tend);
       task.put("Responses"        , tres);
       task.put("Requests"        , treq);
       tasks.put(task);
	%>                       
</c:forEach>

<%
json.put("Tasks Information", tasks);

response.setContentType("application/json");
response.getWriter().write(json.toString());


 %>
