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
JSONArray  reservations = new JSONArray();
JSONObject reservation;

%>

<c:forEach items="${reservList}" var="res">
	<c:set var="id" value="${res.id}"/>
	<c:set var="chargeId" value="${res.chargeBoxId}"/>
	<c:set var="ocppId" value="${res.ocppIdTag}"/>
	<c:set var="connectorId" value="${res.connectorId}"/>
	<c:set var="start" value="${res.startDatetime}"/>
	<c:set var="stop" value="${res.expiryDatetime}"/>
	<c:set var="status" value="${res.status}"/>
	<%
	String rTransId = "";
	%>
	<c:if test="${not empty res.transactionId}">
		<c:set var="transId" value="${res.transactionId}"/>
		<%
		rTransId = rTransId + Integer.toString((Integer)pageContext.getAttribute("id"));
		%>
	</c:if>

			
	<%
    	String rID = "";
    	rID = rID + Integer.toString((Integer)pageContext.getAttribute("id"));   
    	String rChargeId = "";
    	rChargeId = rChargeId + (String)pageContext.getAttribute("chargeId");
    	String rOcppId = "";
    	rOcppId = rOcppId + (String)pageContext.getAttribute("ocppId"); 
	String rConnectId = "";
    	rConnectId = rConnectId + Integer.toString((Integer)pageContext.getAttribute("connectorId")); 
    	String rStat = "";
    	rStat = rStat + (String)pageContext.getAttribute("status"); 
    	String rExp = "";
    	rExp = rExp + (String)pageContext.getAttribute("stop");
    	String rStart = "";
    	rStart = rStart + (String)pageContext.getAttribute("start"); 
 
	reservation = new JSONObject();
	reservation.put("Reservation ID"     , rID);
	reservation.put("Transaction ID"     , rTransId);
	reservation.put("OCPP ID Tag"     , rOcppId);	
	reservation.put("ChargeBox ID"        , rChargeId);
	reservation.put("Connector ID"     , rConnectId);
	reservation.put("Start Date/Time"     , rStart);
	reservation.put("Expiry Date/Time"           , rExp);
	reservation.put("Status"            , rStat);
	reservations.put(reservation);
	%> 
			
			
</c:forEach>

<%
json.put("Reservations Information", reservations);

response.setContentType("application/json");
response.getWriter().write(json.toString());


 %>
