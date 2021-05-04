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

JSONObject CompositeScheduleResponse;
JSONArray  chargingSchedulePeriods = new JSONArray();
JSONObject chargingSchedulePeriod;

%>

<c:set var="chargeboxid" value="${chargeBoxId}"/>
<c:set var="connectorid" value="${response.connectorId}"/>
<c:set var="scheduleStart" value="${response.scheduleStart}"/>
<c:set var="duration" value="${response.chargingSchedule.duration}"/>
<c:set var="startSchedule" value="${response.chargingSchedule.startSchedule}"/>
<c:set var="chargingRateUnit" value="${response.chargingSchedule.chargingRateUnit}"/>
<c:set var="minChargingRate" value="${response.chargingSchedule.minChargingRate}"/>



<%
	String csrchargeid = "";
    	csrchargeid = csrchargeid + (pageContext.getAttribute("chargeboxid")).toString();   
    	String csrconnectid = "";
    	csrconnectid = csrconnectid + (pageContext.getAttribute("connectorid")).toString();
    	String csrchargerate = "";
    	csrchargerate = csrchargerate + (pageContext.getAttribute("minChargingRate")).toString(); 
    	String csrduration = "";
    	csrduration = csrduration + (pageContext.getAttribute("duration")).toString();    	
    	String csrunit = "";
    	csrunit = csrunit + (pageContext.getAttribute("chargingRateUnit")).toString(); 
    	
    	String csrstarts = ""; 
    	DateTime startDate=null;
	startDate = (DateTime)pageContext.getAttribute("startSchedule");
	if (startDate!=null)
		csrstarts = startDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
	else
		csrstarts = "null";
    	
    	String csrschedulestart = ""; 
    	DateTime scheduleStart=null;
	scheduleStart = (DateTime)pageContext.getAttribute("scheduleStart");
	if (scheduleStart!=null)
		csrschedulestart = scheduleStart.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
	else
		csrschedulestart = "null";	


	CompositeScheduleResponse = new JSONObject();
	CompositeScheduleResponse.put("ChargeBox ID"     , csrchargeid);
	CompositeScheduleResponse.put("Connector ID"     , csrconnectid);
	CompositeScheduleResponse.put("Min Charging Rate"        , csrchargerate);
	CompositeScheduleResponse.put("Duration"        , csrduration);
	CompositeScheduleResponse.put("Charging Rate Unit"        , csrunit);
	CompositeScheduleResponse.put("Start Schedule"        , csrstarts);
	CompositeScheduleResponse.put("Schedule Start"        , csrschedulestart);
%>

<c:forEach items="${response.chargingSchedule.chargingSchedulePeriod}" var="element">
	<c:set var="start" value="${element.startPeriod}"/>
	<c:set var="limit" value="${element.limit}"/>
	<c:set var="num" value="${element.numberPhases}"/>
	

	
	<%
	String sstart = "";
    	sstart = sstart + (pageContext.getAttribute("start")).toString();    	
	String slimit = "";
	slimit = slimit + (pageContext.getAttribute("limit")).toString();
	String snum = "";
	snum = snum + (pageContext.getAttribute("num")).toString();
	
	
	chargingSchedulePeriod = new JSONObject();
	chargingSchedulePeriod.put("Start Period"     , sstart);	
	chargingSchedulePeriod.put("Limit"   , slimit);
	chargingSchedulePeriod.put("Number of Phases"        , snum);
	chargingSchedulePeriods.put(chargingSchedulePeriod);
	%>

</c:forEach>


<%
	CompositeScheduleResponse.put("Charging Schedule Periods", chargingSchedulePeriods);

	response.setContentType("application/json");
	response.getWriter().write(CompositeScheduleResponse.toString());


 %>
