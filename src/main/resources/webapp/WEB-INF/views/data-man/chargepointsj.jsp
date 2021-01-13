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
JSONArray  chargepoints = new JSONArray();
JSONObject chargePoint;

%>

<c:forEach items="${cpList}" var="cp">
	<c:set var="id" value="${cp.chargeBoxId}"/>
	<c:set var="desc" value="${cp.description}"/>
	<c:set var="protoc" value="${cp.ocppProtocol}"/>
	<c:set var="heartb" value="${cp.lastHeartbeatTimestamp}"/>

 	<%
    	String cbid = ""; 
    	cbid = cbid + (String)pageContext.getAttribute("id");   
    	String cbdesc = ""; 
    	cbdesc = cbdesc + (String)pageContext.getAttribute("desc");
    	String cbprot = ""; 
    	cbprot = cbprot + (String)pageContext.getAttribute("protoc"); 
    	String cbheart = ""; 
    	cbheart = cbheart + (String)pageContext.getAttribute("heartb"); 

 
	chargePoint = new JSONObject();
       chargePoint.put("chargeboxid"     , cbid);
       chargePoint.put("description"        , cbdesc);
       chargePoint.put("protocol"           , cbprot);
       chargePoint.put("heartbeat"            , cbheart);
       chargepoints.put(chargePoint);
	%>                       
</c:forEach>

<%
json.put("Chargepoints information", chargepoints);

response.setContentType("application/json");
response.getWriter().write(json.toString());


 %>


