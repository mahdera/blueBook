<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
	String prefix = "DEC/";
	SimpleDateFormat dateFormat = new SimpleDateFormat("MMddhhmmss");
	Calendar cal = Calendar.getInstance();
	String formatedDate = dateFormat.format(cal.getTime());
	long maxId = Decision.getMaxDecisionIdNow();
	String generatedId = prefix+maxId+"/"+formatedDate;
	out.print(generatedId);
%>