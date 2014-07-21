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
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	String caseIdNumber = request.getParameter("caseIdNumber");
	String caseTheme = request.getParameter("caseTheme");
	String reliefSought = request.getParameter("reliefSought");
	long applicantId = Integer.parseInt(request.getParameter("applicantId"));
	int caseCategoryId = Integer.parseInt(request.getParameter("caseCategoryId"));
	int linkageId = Integer.parseInt(request.getParameter("linkage"));
	int evidenceTypeId = Integer.parseInt(request.getParameter("evidenceType"));
	int numberOfPages = Integer.parseInt(request.getParameter("numberOfPages"));
	int meansOfApplicationId = Integer.parseInt(request.getParameter("meansOfApplication"));
	int appliedById = Integer.parseInt(request.getParameter("appliedBy"));	
	
	Case theCase = new Case(caseIdNumber,caseTheme,reliefSought,caseCategoryId,
			linkageId,evidenceTypeId,numberOfPages,meansOfApplicationId,appliedById,modificationDate,
			applicantId,modifiedBy,modificationDate);
	theCase.save();
%>
<p class="msg done">
	<label id="lblcasesavedsuccessfully">
		<%
			String lblCaseSavedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasesavedsuccessfully");
			label = Label.getLabelUsingLabelId("lblcasesavedsuccessfully");
			out.print(lblCaseSavedSuccessfully != null ? lblCaseSavedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>