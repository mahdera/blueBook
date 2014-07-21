<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;	

	long id = Long.parseLong(request.getParameter("id"));
	String whatToRegister = request.getParameter("whatToRegister");
	String whatToRegisterContent = request.getParameter("whatToRegisterContent");
	int fileStatusId = Integer.parseInt(request.getParameter("fileStatusId"));
	String nextActionAndDate = request.getParameter("nextActionAndDate");
	//now get the current investigation object from the database and set it with the modified field values.
	Investigation investigation = Investigation.getInvestigation(id);
	investigation.setWhatToRegister(whatToRegister);
	investigation.setCaseStatusId(fileStatusId);
	investigation.setNextActionAndDate(nextActionAndDate);
	investigation.setModifiedBy(modifiedBy);
	investigation.setModificationDate(modificationDate);
	Investigation.update(investigation);
	//now do the same thing for WhatToRegisterContent object...
	WhatToRegisterContent whatToRegisterContentObj = WhatToRegisterContent.getWhatToRegisterContentsForThisInvestigation(investigation.getId());
	whatToRegisterContentObj.setPointToRegister(whatToRegister);
	whatToRegisterContentObj.setRegisteredContent(whatToRegisterContent);
	whatToRegisterContentObj.setModifiedBy(modifiedBy);
	whatToRegisterContentObj.setModificationDate(modificationDate);
	WhatToRegisterContent.update(whatToRegisterContentObj);
%>
<p class="msg done">
	<label id="lblinvestigationupdatedsuccessfully">
		<%
			String lblInvestigationUpdatedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigationupdatedsuccessfully");
			label = Label.getLabelUsingLabelId("lblinvestigationupdatedsuccessfully");
			out.print(lblInvestigationUpdatedSuccessfully != null ? lblInvestigationUpdatedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>