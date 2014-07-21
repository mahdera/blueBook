<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.Date" %>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);

	String fieldName = request.getParameter("fieldName");
	String optionValue = request.getParameter("optionValue");
	String description = request.getParameter("description");
	
	AdminField adminFieldObj = new AdminField(fieldName,optionValue,description,modifiedBy,modificationDate);
	adminFieldObj.save();
%>
