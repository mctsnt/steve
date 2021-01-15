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
JSONArray  transactions = new JSONArray();
JSONObject transaction;

%>

<c:forEach items="${transList}" var="ta">
	<c:set var="id" value="${ta.id}"/>
	<c:set var="chargeId" value="${ta.chargeBoxId}"/>
	<c:set var="ocppId" value="${ta.ocppIdTag}"/>
	<c:set var="connectorId" value="${ta.connectorId}"/>
	<c:set var="startValue" value="${ta.startValue}"/>
	<c:set var="start" value="${ta.startTimestamp}"/>
	<c:set var="stop" value="${ta.stopTimestamp}"/>
	<c:set var="stopValue" value="${ta.stopValue}"/>
	<c:set var="stopReason" value="${ta.stopReason}"/>
	
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
 
	transaction = new JSONObject();
	transaction.put("Transaction ID"     , tId);
	transaction.put("ChargeBox ID"     , tChargeId);
	transaction.put("Connector ID"     , tConnectId);
	transaction.put("OCPP ID Tag"     , tOcppId);	
	transaction.put("Start Date/Time"     , tStartD);
	transaction.put("Start Value"        , tStartV);
	transaction.put("Stop Date/Time"           , tStopD);
	transaction.put("Stop Value"            , tStopV);
	transaction.put("Stop Reason"            , tStopR);
	transactions.put(transaction);
	%> 
	
	
</c:forEach>
<%
json.put("Transactions information", transactions);

response.setContentType("application/json");
response.getWriter().write(json.toString());


 %>
