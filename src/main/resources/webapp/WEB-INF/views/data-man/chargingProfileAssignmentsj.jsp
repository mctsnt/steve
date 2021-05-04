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
JSONArray  chargingProfAssignments = new JSONArray();
JSONObject chargingProfAssignment;

%>

<c:forEach items="${assignments}" var="a">
	<c:set var="chargeboxid" value="${a.chargeBoxId}"/>
	<c:set var="connector" value="${a.connectorId}"/>
	<c:set var="profileid" value="${a.chargingProfilePk}"/>
	<c:set var="desc" value="${a.chargingProfileDescription}"/>	
	

 	<%
    	String cpid = ""; 
    	if (pageContext.getAttribute("chargeboxid")!=null){
    		cpid = cpid + (pageContext.getAttribute("chargeboxid")).toString();   
    	}
    	String cpconnect = ""; 
    	if (pageContext.getAttribute("connector")!=null){
    		cpconnect = cpconnect + (pageContext.getAttribute("connector")).toString();
    	}
    	String cpprofid = ""; 
    	if (pageContext.getAttribute("profileid")!=null){
    		cpprofid = cpprofid + (pageContext.getAttribute("profileid")).toString(); 
    	}
    	String cpdesc = ""; 
    	if (pageContext.getAttribute("desc")!=null){
    		cpdesc = cpdesc + (pageContext.getAttribute("desc")).toString(); 
    	}



 
	chargingProfAssignment = new JSONObject();
       chargingProfAssignment.put("ChargeBox ID"     , cpid);
       chargingProfAssignment.put("Connector ID"        , cpconnect);
       chargingProfAssignment.put("Charging Profile ID"           , cpprofid);
       chargingProfAssignment.put("Charging Profile Description"            , cpdesc);
       chargingProfAssignments.put(chargingProfAssignment);
	%>                       
</c:forEach>

<%
json.put("Charging Profiles Assignments", chargingProfAssignments);

response.setContentType("application/json");
response.getWriter().write(json.toString());


 %>


