<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
	
	String caseCategoryName = request.getParameter("caseCategoryName");
	String description = request.getParameter("description");
	int caseCategoryId = Integer.parseInt(request.getParameter("caseCategoryId"));
	//now find this particular case category object and set the values with the new data and update it back to the database...
	CaseCategory caseCategory = CaseCategory.getCaseCategory(caseCategoryId);
	caseCategory.setCaseCategoryName(caseCategoryName);
	caseCategory.setDescription(description);
	caseCategory.setModifiedBy(modifiedBy);
	caseCategory.setModificationDate(modificationDate);
	CaseCategory.update(caseCategory);
%>
<p class="msg done">Case category information updated successfully/የጉዳይ ምድብ መረጃ በተሳካ ሁኔታ ታድሷል</p>