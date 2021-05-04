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

JSONObject chargingProfile = new JSONObject();
JSONArray  SchedulePeriods = new JSONArray();
JSONObject SchedulePeriod;

%>

	<c:set var="purpose" value="${form.chargingProfilePurpose}"/>
	<c:set var="unit" value="${form.chargingRateUnit}"/>	
	<c:set var="Profkind" value="${form.chargingProfileKind}"/>
	<c:set var="Reckind" value="${form.recurrencyKind}"/>
		
	<c:set var="validFr" value="${form.validFrom}"/>
        <c:set var="validTo" value="${form.validTo}"/>
        <c:set var="duration" value="${form.durationInSeconds}"/>
	<c:set var="startSc" value="${form.startSchedule}"/>
	<c:set var="desc" value="${form.description}"/>
	<c:set var="stack" value="${form.stackLevel}"/>	
	<c:set var="minRate" value="${form.minChargingRate}"/>
	<c:set var="note" value="${form.note}"/>	
        
        
	
	

 	<%
    	String cpdesc = ""; 
    	if (pageContext.getAttribute("desc")!=null)
    		{cpdesc = cpdesc + (String)pageContext.getAttribute("desc");}
    	String cpstack = "";
    	if (pageContext.getAttribute("stack")!=null) 
    		{cpstack = cpstack + (pageContext.getAttribute("stack")).toString();}
    	
    	
    	String cppurp = ""; 
    	if (pageContext.getAttribute("purpose")!=null)
    		{cppurp = cppurp + (pageContext.getAttribute("purpose")).toString(); }
    	String cppkind = ""; 
    	if (pageContext.getAttribute("Profkind")!=null)
    		{cppkind = cppkind + (pageContext.getAttribute("Profkind")).toString();  }
    	String cprkind = ""; 
    	if (pageContext.getAttribute("Reckind")!=null)
    		{cprkind = cprkind + (pageContext.getAttribute("Reckind")).toString();}
    	String cpunit = ""; 
    	if (pageContext.getAttribute("unit")!=null)
    		{cpunit = cpunit + (pageContext.getAttribute("unit")).toString(); }
    	
    	String cpvalidF = ""; 
    	LocalDateTime validFromDate=null;
	validFromDate = (LocalDateTime)pageContext.getAttribute("validFr");
	if (validFromDate!=null)
		cpvalidF = validFromDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
	else
		cpvalidF = "null";
    	
    	String cpvalidT = ""; 
    	LocalDateTime validToDate=null;
	validToDate = (LocalDateTime)pageContext.getAttribute("validTo");
	if (validToDate!=null)
		cpvalidT = validToDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
	else
		cpvalidT = "null";
		
	String cpduration = ""; 
	if (pageContext.getAttribute("duration")!=null)
    		{cpduration = cpduration + (pageContext.getAttribute("duration")).toString();}
    	String cprate = ""; 
    	if (pageContext.getAttribute("minRate")!=null)
    		{cprate = cprate + (pageContext.getAttribute("minRate")).toString(); }
    	String cpnote = ""; 
    	if (pageContext.getAttribute("note")!=null)
    		{cpnote = cpnote + (String)pageContext.getAttribute("note");}
    	
    	String cpstart = ""; 
    	LocalDateTime startScheduleDate=null;
	startScheduleDate = (LocalDateTime)pageContext.getAttribute("startSc");
	if (startScheduleDate!=null)
		cpstart = startScheduleDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy HH:mm"));
	else
		cpstart = "null";
		
 
       chargingProfile.put("Description"        , cpdesc);
       chargingProfile.put("Stack Level"           , cpstack);
       chargingProfile.put("Profile Purpose"            , cppurp);
       chargingProfile.put("Profile Kind"        , cppkind);
       chargingProfile.put("Recurrency Kind"        , cprkind);
       chargingProfile.put("Valid From"        , cpvalidF);
       chargingProfile.put("Valid To"        , cpvalidT);
       chargingProfile.put("Duration(in seconds)"        , cpduration);
       chargingProfile.put("Charging Rate Unit"        , cpunit);
       chargingProfile.put("Min Charging Rate (decimal, multiple of 0.1)"        , cprate);
       chargingProfile.put("Additional Note"        , cpnote);
       chargingProfile.put("Start Schedule"        , cpstart);
       
	%> 
<%------	
<c:forEach items="${form.schedulePeriodMap}" var="schedulePeriodMap">


	<c:set var="key" value="${schedulePeriodMap.key}"/>

	<c:set var="startPeriod" value="${schedulePeriodMap[key].startPeriodInSeconds}"/>
	<c:set var="powerLimit" value="${schedulePeriodMap[key].powerLimitInAmperes}"/>
	<c:set var="numPhases" value="${schedulePeriodMap[key].numberPhases}"/>
	
	<%
	String spstartperiod = "";
    	spstartperiod = spstartperiod + (pageContext.getAttribute("startPeriod")).toString();    	
    	String sppower = "";
    	sppower = sppower + (pageContext.getAttribute("powerLimit")).toString(); 	
    	String spnumphases = "";
    	spnumphases = spnumphases + (pageContext.getAttribute("numPhases")).toString(); 

	
	
	
	SchedulePeriod = new JSONObject();
	SchedulePeriod.put("Start Period (in sec)"        , spstartperiod);
	SchedulePeriod.put("Power Limit (in amperes)"            , sppower);
	SchedulePeriod.put("Number Phases"            , spnumphases);
	SchedulePeriods.put(SchedulePeriod);
	%>

</c:forEach>                      

---------%>
<%
//chargingProfile.put("Charging Profile's Schedule Periods", SchedulePeriods);

response.setContentType("application/json");
response.getWriter().write(chargingProfile.toString());


 %>


