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

	String caseTheme = request.getParameter("caseTheme");
	String reliefSought = request.getParameter("reliefSought");
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	int caseCategoryId = Integer.parseInt(request.getParameter("caseCategoryId"));
	int linkageId = Integer.parseInt(request.getParameter("linkage"));
	int evidenceTypeId = Integer.parseInt(request.getParameter("evidenceType"));
	int numberOfPages = Integer.parseInt(request.getParameter("numberOfPages"));
	int meansOfApplicationId = Integer.parseInt(request.getParameter("meansOfApplication"));
	int appliedById = Integer.parseInt(request.getParameter("appliedBy"));
	long caseId = Long.parseLong(request.getParameter("caseId"));
	//now find this object and set its data fields with the new value and update it back to the database...
	Case fetchedCase = Case.getCase(caseId);
	fetchedCase.setTheme(caseTheme);
	fetchedCase.setReliefSought(reliefSought);
	fetchedCase.setApplicantId(applicantId);
	fetchedCase.setCaseCategoryId(caseCategoryId);
	fetchedCase.setLinkageId(linkageId);
	fetchedCase.setEvidenceTypeId(evidenceTypeId);
	fetchedCase.setNumberOfPages(numberOfPages);
	fetchedCase.setMeansOfApplicationId(meansOfApplicationId);
	fetchedCase.setAppliedById(appliedById);
	fetchedCase.setModifiedBy(modifiedBy);
	fetchedCase.setModificationDate(modificationDate);
	Case.update(fetchedCase);
%>
<p class="msg done">Case updated successfully/የአቤቱታ ጉዳይ በተሳካ ሁኔታ ታድሶአል</p>