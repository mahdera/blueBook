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
	
	int id = Integer.parseInt(request.getParameter("id"));
	String optionValue = request.getParameter("optionValue");
	String description = request.getParameter("description");
	
	AdminField adminField = AdminField.getAdminField(id);
	adminField.setOptionValue(optionValue);
	adminField.setDescription(description);
	adminField.setModifiedBy(modifiedBy);
	adminField.setModificationDate(modificationDate);
	
	AdminField.update(adminField);
%>
<p class="msg done">Admin field option value updated successfully!</p>