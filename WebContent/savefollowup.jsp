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
	String whatToRecord = request.getParameter("whatToRecord");
	String whatToRecordContent = request.getParameter("whatToRecordContent");
	int fileStatusId = Integer.parseInt(request.getParameter("fileStatusId"));
	String nextAction = request.getParameter("nextAction");
	String decisionMainPoint = request.getParameter("decisionMainPoint");
	Date deadline = Date.valueOf(request.getParameter("deadline"));
	
	Followup followup = new Followup(fileNumber,decisionMainPoint,deadline,whatToRecord,fileStatusId,
			nextAction,modifiedBy,modificationDate);
	followup.save();
	
	//now get the followup object you have saved just right now...
	Followup fetchedFollowup = Followup.getFollowupObjectUsing(fileNumber,whatToRecord,fileStatusId,modifiedBy,modificationDate);
	WhatToRecordContent whatToRecordContentObj = new WhatToRecordContent(fetchedFollowup.getId(),whatToRecord,
			whatToRecordContent,modifiedBy,modificationDate);
	whatToRecordContentObj.save();	
%>
<p class="msg done">
	<label id="lblfollowupsavedsuccessfully">
		<%
			String lblFollowupSavedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfollowupsavedsuccessfully");
			label = Label.getLabelUsingLabelId("lblfollowupsavedsuccessfully");
			out.print(lblFollowupSavedSuccessfully != null ? lblFollowupSavedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>