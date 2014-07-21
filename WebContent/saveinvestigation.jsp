<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	String fileNumber = request.getParameter("fileNumber");
	String whatToRegister = request.getParameter("whatToRegister");
	String whatToRegisterContent = request.getParameter("whatToRegisterContent");
	int fileStatusId = Integer.parseInt(request.getParameter("fileStatusId"));
	String nextActionAndDate = request.getParameter("nextActionAndDate");

	Investigation investigation = new Investigation(fileNumber,whatToRegister,fileStatusId,nextActionAndDate,
			modifiedBy,modificationDate);
	investigation.save();
	//now get the investigation object you have saved just right now...
	Investigation fetchedInvestigation = Investigation.getInvestigationObjectUsing(fileNumber,whatToRegister,fileStatusId,
			modifiedBy,modificationDate);
	WhatToRegisterContent whatToRegisterContentObj = new WhatToRegisterContent(fetchedInvestigation.getId(),
			whatToRegister,whatToRegisterContent,modifiedBy,modificationDate);
	whatToRegisterContentObj.save();
%>
<p class="msg done">
	<label id="lblinvestigationsavedsuccessfully">
		<%
			String lblInvestigationSavedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigationsavedsuccessfully");
			label = Label.getLabelUsingLabelId("lblinvestigationsavedsuccessfully");
			out.print(lblInvestigationSavedSuccessfully != null ? lblInvestigationSavedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>