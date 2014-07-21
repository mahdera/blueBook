<%@page import="com.signetitsolutions.bluebook.server.classes.Label"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	String labelId = request.getParameter("labelId");
	String labelCaption = request.getParameter("labelCaption");
	
	Label label = Label.getLabel(id);
	label.setLabelId(labelId);
	label.setLabelCaption(labelCaption);
	Label.update(label);
%>