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
JSONArray  users = new JSONArray();
JSONObject user;

%>

<c:forEach items="${userList}" var="cr">
	<c:set var="id" value="${cr.userPk}"/>
	<c:set var="tag" value="${cr.ocppIdTag}"/>
	<c:set var="name" value="${cr.name}"/>
	<c:set var="phone" value="${cr.phone}"/>
	<c:set var="email" value="${cr.email}"/>

 	<%
    	String usrid = ""; 
    	usrid = usrid + Integer.toString((Integer)pageContext.getAttribute("id"));   
    	String usrocpp = ""; 
    	usrocpp = usrocpp + (String)pageContext.getAttribute("tag");
    	String usrname = ""; 
    	usrname = usrname + (String)pageContext.getAttribute("name"); 
    	String usrph = ""; 
    	usrph = usrph + (String)pageContext.getAttribute("phone"); 
    	String usrem = ""; 
    	usrem = usrem + (String)pageContext.getAttribute("email");  

 
	user = new JSONObject();
       user.put("User ID"     , usrid);
       user.put("OCPP ID Tag"     , usrocpp);
       user.put("name"        , usrname);
       user.put("phone"           , usrph);
       user.put("email"            , usrem);
       users.put(user);
	%>                       
</c:forEach>

<%
json.put("Users information", users);

response.setContentType("application/json");
response.getWriter().write(json.toString());


 %>



