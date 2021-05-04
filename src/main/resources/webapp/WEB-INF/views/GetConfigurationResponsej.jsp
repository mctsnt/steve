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
JSONArray  configInfo = new JSONArray();
JSONObject configParams;

%>

<c:forEach items="${response.configurationKeys}" var="element">
	<c:set var="key" value="${element.key}"/>
	<c:set var="value" value="${element.value}"/>
	<c:set var="read" value="${element.readonly}"/>
	
	

 	<%
    	String ckey = ""; 
    	ckey = ckey + (pageContext.getAttribute("key")).toString();   
    	String cvalue = ""; 
    	cvalue = cvalue + (pageContext.getAttribute("value")).toString();
    	String cread = ""; 
    	cread = cread + (pageContext.getAttribute("read")).toString(); 


    
 
	configParams = new JSONObject();
       configParams.put("Key"     , ckey);
       configParams.put("Value"        , cvalue);
       configParams.put("Read Only?"           , cread);
       configInfo.put(configParams);
	%>                       
</c:forEach>

<%
json.put("Configuration Information", configInfo);

response.setContentType("application/json");
response.getWriter().write(json.toString());


 %>
