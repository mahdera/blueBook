<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
	
	String categoryName = request.getParameter("categoryName");
	String description = request.getParameter("description");
	
	CaseCategory caseCategory = new CaseCategory(categoryName,description,modifiedBy,modificationDate);
	caseCategory.save();
%>
<p class="msg done">Case category saved successfully/የጉዳይ ምድብ ተመዝግቦአል</p>