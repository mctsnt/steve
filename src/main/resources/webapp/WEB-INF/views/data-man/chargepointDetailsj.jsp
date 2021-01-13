<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.joda.time.DateTime"%>
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

JSONObject chargePoint;

%>


<c:set var="id" value="${chargePointForm.chargeBoxId}"/>
<c:set var="endp" value="${cp.chargeBox.endpointAddress}"/>
<c:set var="protoc" value="${cp.chargeBox.ocppProtocol}"/>
<c:set var="heartb" value="${cp.chargeBox.lastHeartbeatTimestamp}"/>
<c:set var="cpvend" value="${cp.chargeBox.chargePointVendor}"/>
<c:set var="cpmodel" value="${cp.chargeBox.chargePointModel}"/>
<c:set var="cpserial" value="${cp.chargeBox.chargePointSerialNumber}"/>
<c:set var="cdserial" value="${cp.chargeBox.chargeBoxSerialNumber}"/>
<c:set var="fwvers" value="${cp.chargeBox.fwVersion}"/>
<c:set var="fwtime" value="${cp.chargeBox.fwUpdateTimestamp}"/>
<c:set var="ic" value="${cp.chargeBox.iccid}"/>
<c:set var="im" value="${cp.chargeBox.imsi}"/>
<c:set var="mtype" value="${cp.chargeBox.meterType}"/>
<c:set var="mserial" value="${cp.chargeBox.meterSerialNumber}"/>
<c:set var="dstatus" value="${cp.chargeBox.diagnosticsStatus}"/>
<c:set var="dtime" value="${cp.chargeBox.diagnosticsTimestamp}"/>

<%
String cbid = ""; 
cbid = cbid + (String)pageContext.getAttribute("id");   
String cbendp = ""; 
cbendp = cbendp + (String)pageContext.getAttribute("endp");
String cbprot = ""; 
cbprot = cbprot + (String)pageContext.getAttribute("protoc"); 
DateTime heartDateFrom = (DateTime)pageContext.getAttribute("heartb");
String cbheart = heartDateFrom.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
String cbcpvend = ""; 
cbcpvend = cbcpvend + (String)pageContext.getAttribute("cpvend"); 
String cbcpmodel = ""; 
cbcpmodel = cbcpmodel + (String)pageContext.getAttribute("cpmodel"); 
String cbcpserial = ""; 
cbcpserial = cbcpserial + (String)pageContext.getAttribute("cpserial"); 
String cbcdserial = ""; 
cbcdserial = cbcdserial + (String)pageContext.getAttribute("cdserial"); 
String cbfwvers = ""; 
cbfwvers = cbfwvers + (String)pageContext.getAttribute("fwvers"); 

DateTime fwDateFrom=null;
fwDateFrom = (DateTime)pageContext.getAttribute("fwtime");
String cbfwtime = "";
if (fwDateFrom!=null)
	cbfwtime = fwDateFrom.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
else
	cbfwtime = "null";

String cbic = ""; 
cbic = cbic + (String)pageContext.getAttribute("ic"); 
String cbim = ""; 
cbim = cbim + (String)pageContext.getAttribute("im"); 
String cbmtype = ""; 
cbmtype = cbmtype + (String)pageContext.getAttribute("mtype"); 
String cbmserial = ""; 
cbmserial = cbmserial + (String)pageContext.getAttribute("mserial"); 
String cbdstatus = ""; 
cbdstatus = cbdstatus + (String)pageContext.getAttribute("dstatus"); 

DateTime diagDateFrom = null;
String cbdtime = "";
diagDateFrom = (DateTime)pageContext.getAttribute("dtime");
if (diagDateFrom!=null)
	cbdtime = diagDateFrom.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
else
	cbdtime="null";



chargePoint = new JSONObject();
chargePoint.put("Chargeboxid"     , cbid);
chargePoint.put("Endpoint Address"        , cbendp);
chargePoint.put("OCPP Protocol"           , cbprot);
chargePoint.put("Last Heartbeat Stamp"            , cbheart);
chargePoint.put("Charge Point Vendor"     , cbcpvend);
chargePoint.put("Charge Point Model"     , cbcpmodel);
chargePoint.put("Charge Point Serial Number"     , cbcpserial);
chargePoint.put("Charge Box Serial Number"     , cbcdserial);
chargePoint.put("Firmware Version"     , cbfwvers);
chargePoint.put("Firmware Update Timestamp"     , cbfwtime);
chargePoint.put("Iccid"     , cbic);
chargePoint.put("Imsi"     , cbim);
chargePoint.put("Meter Type"     , cbmtype);
chargePoint.put("Meter Serial Number"     , cbmserial);
chargePoint.put("Diagnostics Status"     , cbdstatus);
chargePoint.put("Diagnostics Timestamp"     , cbdtime);


response.setContentType("application/json");
response.getWriter().write(chargePoint.toString());


 %>


