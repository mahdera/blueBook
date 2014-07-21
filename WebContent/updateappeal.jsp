<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	long appealId = Long.parseLong(request.getParameter("appealId"));
	String appealReason = request.getParameter("appealReason");
	Date registrationDate = Date.valueOf(request.getParameter("registrationDate"));
	
	Appeal appeal = Appeal.getAppeal(appealId);
	appeal.setAppealReason(appealReason);
	appeal.setRegistrationDate(registrationDate);
	appeal.setModifiedBy(modifiedBy);
	appeal.setModificationDate(modificationDate);
	Appeal.update(appeal);
%>
<p class="msg done">
	<label id="lblappealupdatedsuccessfully">
		<%
			String lblAppealUpdatedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealupdatedsuccessfully");
			label = Label.getLabelUsingLabelId("lblappealupdatedsuccessfully");
			out.print(lblAppealUpdatedSuccessfully != null ? lblAppealUpdatedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>