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

JSONObject transaction;
JSONArray  interMeterValues = new JSONArray();
JSONObject interMeterValue;

%>

<c:set var="id" value="${details.transaction.id}"/>
<c:set var="chargeId" value="${details.transaction.chargeBoxId}"/>
<c:set var="connectorId" value="${details.transaction.connectorId}"/>
<c:set var="ocppId" value="${details.transaction.ocppIdTag}"/>
<c:set var="start" value="${details.transaction.startTimestamp}"/>
<c:set var="startValue" value="${details.transaction.startValue}"/>
<c:set var="stop" value="${details.transaction.stopTimestamp}"/>
<c:set var="stopValue" value="${details.transaction.stopValue}"/>
<c:set var="stopReason" value="${details.transaction.stopReason}"/>
<c:set var="stopEvent" value="${details.transaction.stopEventActor}"/>




<%
	String tId = "";
    	tId = tId + Integer.toString((Integer)pageContext.getAttribute("id"));   
    	String tChargeId = "";
    	tChargeId = tChargeId + (String)pageContext.getAttribute("chargeId");
    	String tOcppId = "";
    	tOcppId = tOcppId + (String)pageContext.getAttribute("ocppId"); 
	String tConnectId = "";
    	tConnectId = tConnectId + Integer.toString((Integer)pageContext.getAttribute("connectorId")); 
    	String tStopR = "";
    	tStopR = tStopR + (String)pageContext.getAttribute("stopReason");    	
    	String tStartV = "";
    	tStartV = tStartV + (String)pageContext.getAttribute("startValue"); 	
    	String tStopV = "";
    	tStopV = tStopV + (String)pageContext.getAttribute("stopValue"); 
    	String tStopD = "";
    	tStopD = tStopD + (String)pageContext.getAttribute("stop");
    	String tStartD = "";
    	tStartD = tStartD + (String)pageContext.getAttribute("start"); 
    	String tStopE = "";
    	tStopE = tStopE + ((Enum)pageContext.getAttribute("stopEvent")).name(); 

	transaction = new JSONObject();
	transaction.put("Transaction ID"     , tId);
	transaction.put("ChargeBox ID"     , tChargeId);
	transaction.put("Connector ID"        , tConnectId);
	transaction.put("OCPP ID Tag"        , tOcppId);
	transaction.put("Start Date/Time"        , tStartD);
	transaction.put("Start Value"        , tStartV);
	transaction.put("Stop Date/Time"        , tStopD);
	transaction.put("Stop Value"        , tStopV);
	transaction.put("Stop Reason"        , tStopR);
	transaction.put("Stop Event Actor"        , tStopE);
%>

<c:forEach items="${details.values}" var="v">
	<c:set var="valueTimestamp" value="${v.valueTimestamp}"/>
	<c:set var="value" value="${v.value}"/>
	<c:set var="readContext" value="${v.readingContext}"/>
	<c:set var="format" value="${v.format}"/>
	<c:set var="measurand" value="${v.measurand}"/>
	<c:set var="location" value="${v.location}"/>
	<c:set var="unit" value="${v.unit}"/>
	<c:set var="phase" value="${v.phase}"/>
	
	<%
	String mValueT = "";
    	mValueT = mValueT + (String)pageContext.getAttribute("valueTimestamp");    	
    	String mValue = "";
    	mValue = mValue + (String)pageContext.getAttribute("value"); 	
    	String mCont = "";
    	mCont = mCont + (String)pageContext.getAttribute("readContext"); 
    	String mForm = "";
    	mForm = mForm + (String)pageContext.getAttribute("format");
    	String mMeas = "";
    	mMeas = mMeas + (String)pageContext.getAttribute("measurand"); 
    	String mLoc = "";
    	mLoc = mLoc + (String)pageContext.getAttribute("location");
    	String mUnit = "";
    	mUnit = mUnit + (String)pageContext.getAttribute("unit");
    	String mPhase = "";
    	mPhase = mPhase + (String)pageContext.getAttribute("phase");
	
	
	
	interMeterValue = new JSONObject();
	interMeterValue.put("Value Timestamp"     , mValueT);
	interMeterValue.put("Value"     , mValue);
	interMeterValue.put("Reading Context"     , mCont);
	interMeterValue.put("Format"     , mForm);	
	interMeterValue.put("Measurand"   , mMeas);
	interMeterValue.put("Location"        , mLoc);
	interMeterValue.put("Unit"            , mUnit);
	interMeterValue.put("Phase"            , mPhase);
	interMeterValues.put(interMeterValue);
	%>

</c:forEach>


<%
	transaction.put("Intermediate Meter Values information", interMeterValues);

	response.setContentType("application/json");
	response.getWriter().write(transaction.toString());


 %>
