<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.joda.time.DateTime"%>
<%@page import="org.joda.time.LocalDateTime"%>
<%@page import="org.joda.time.LocalDate"%>
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

JSONObject user;

%>


<c:set var="street" value="${userForm.address.street}"/>
<c:set var="houseNum" value="${userForm.address.houseNumber}"/>
<c:set var="zip" value="${userForm.address.zipCode}"/>
<c:set var="city" value="${userForm.address.city}"/>

<c:set var="country" value="${userForm.address.country.alpha2}"/>

<c:set var="firstName" value="${userForm.firstName}"/>
<c:set var="lastName" value="${userForm.lastName}"/>
<c:set var="birthDay" value="${userForm.birthDay}"/>
<c:set var="sex" value="${userForm.sex.value}"/>
<c:set var="phone" value="${userForm.phone}"/>
<c:set var="email" value="${userForm.EMail}"/>
<c:set var="note" value="${userForm.note}"/>
<c:set var="ocpp" value="${userForm.ocppIdTag}"/>



<%


String usrStreet = ""; 
usrStreet = usrStreet + (String)pageContext.getAttribute("street");
String usrHsNum = ""; 
usrHsNum = usrHsNum + (String)pageContext.getAttribute("houseNum");
String usrCity = ""; 
usrCity = usrCity + (String)pageContext.getAttribute("city");
String usrSex = ""; 
usrSex = usrSex + (String)pageContext.getAttribute("sex");
String usrCount = ""; 
usrCount = usrCount + (String)pageContext.getAttribute("country");

LocalDate BdayDate=null;
BdayDate = (LocalDate)pageContext.getAttribute("birthDay");
String usrBday = "";
if (BdayDate!=null)
	usrBday = BdayDate.toString(DateTimeFormat.forPattern("MMM-dd-yyyy"));
else
	usrBday = "null";

String usrZIP = ""; 
usrZIP = usrZIP + (String)pageContext.getAttribute("zip");
String usrFirstN = ""; 
usrFirstN = usrFirstN + (String)pageContext.getAttribute("firstName");
String usrLastN = ""; 
usrLastN = usrLastN + (String)pageContext.getAttribute("lastName");
String usrPhone= ""; 
usrPhone = usrPhone + (String)pageContext.getAttribute("phone");
String usrEmail = ""; 
usrEmail = usrEmail + (String)pageContext.getAttribute("email");
String usrNote = ""; 
usrNote = usrNote + (String)pageContext.getAttribute("note");
String usrOCPP = ""; 
usrOCPP = usrOCPP + (String)pageContext.getAttribute("ocpp");


user = new JSONObject();
user.put("Street"     , usrStreet);
user.put("House Number"        , usrHsNum);
user.put("City"     , usrCity);
user.put("Country"     , usrCount);
user.put("Zip"     , usrZIP);
user.put("First Name"     , usrFirstN);
user.put("Last Name"        , usrLastN);
user.put("Phone"     , usrPhone);
user.put("Email"     , usrEmail);
user.put("Additional Note"     , usrNote);
user.put("Birthday"     , usrBday);
user.put("Sex"     , usrSex);
user.put("OCPP ID Tag"     , usrOCPP);

response.setContentType("application/json");
response.getWriter().write(user.toString());


 %>


