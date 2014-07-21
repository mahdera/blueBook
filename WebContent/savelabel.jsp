<%@page import="com.signetitsolutions.bluebook.server.classes.Label"%>
<%
	String labelId = request.getParameter("labelId");
	String labelCaption = request.getParameter("labelCaption");
	
	Label label = new Label(labelId,labelCaption);
	label.save();
%>