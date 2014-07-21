<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
	String prefix = "DEC/";	
	Calendar cal = Calendar.getInstance();
	long maxId = Decision.getMaxDecisionIdNow();
	String generatedId = prefix+maxId+cal.getTime();
	out.print(generatedId);
%>