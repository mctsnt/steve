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
JSONArray  chargingProfiles = new JSONArray();
JSONObject chargingProfile;

%>

<c:forEach items="${profileList}" var="cp">
	<c:set var="id" value="${cp.chargingProfilePk}"/>
	<c:set var="desc" value="${cp.description}"/>
	<c:set var="stack" value="${cp.stackLevel}"/>
	<c:set var="purpose" value="${cp.profilePurpose}"/>	
	<c:set var="Profkind" value="${cp.profileKind}"/>
	<c:set var="Reckind" value="${cp.recurrencyKind}"/>	
	<c:set var="validFr" value="${cp.validFrom}"/>
        <c:set var="validTo" value="${cp.validTo}"/>
	
	
	

 	<%
    	String cpid = ""; 
    	cpid = cpid + (pageContext.getAttribute("id")).toString();   
    	String cpdesc = ""; 
    	cpdesc = cpdesc + (String)pageContext.getAttribute("desc");
    	String cpstack = ""; 
    	cpstack = cpstack + (pageContext.getAttribute("stack")).toString(); 
    	String cppurp = ""; 
    	cppurp = cppurp + (String)pageContext.getAttribute("purpose"); 
    	String cppkind = ""; 
    	cppkind = cppkind + (String)pageContext.getAttribute("Profkind");   
    	String cprkind = ""; 
    	cprkind = cprkind + (String)pageContext.getAttribute("Reckind");
    	
    	String cpvalidF = ""; 
    	DateTime validFromDate=null;
	validFromDate = (DateTime)pageContext.getAttribute("validFr");
	if (validFromDate!=null)
		cpvalidF = validFromDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
	else
		cpvalidF = "null";
    	
    	String cpvalidT = ""; 
    	DateTime validToDate=null;
	validToDate = (DateTime)pageContext.getAttribute("validTo");
	if (validToDate!=null)
		cpvalidT = validToDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
	else
		cpvalidT = "null";







 
	chargingProfile = new JSONObject();
       chargingProfile.put("Charging Profile ID"     , cpid);
       chargingProfile.put("Description"        , cpdesc);
       chargingProfile.put("Stack Level"           , cpstack);
       chargingProfile.put("Profile Purpose"            , cppurp);
       chargingProfile.put("Profile Kind"        , cppkind);
       chargingProfile.put("Recurrency Kind"        , cprkind);
       chargingProfile.put("Valid From"        , cpvalidF);
       chargingProfile.put("Valid To"        , cpvalidT);
       chargingProfiles.put(chargingProfile);
	%>                       
</c:forEach>

<%
json.put("Charging Profiles information", chargingProfiles);

response.setContentType("application/json");
response.getWriter().write(json.toString());


 %>


