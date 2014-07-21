<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
	String prefix = "INV/";
	SimpleDateFormat dateFormat = new SimpleDateFormat("MMddhhmmss");
	Calendar cal = Calendar.getInstance();
	String formatedDate = dateFormat.format(cal.getTime());
	long maxId = Investigator.getMaxInvestigatorIdNow();
	String generatedId = prefix+maxId+"/"+formatedDate;
	out.print(generatedId);
%>