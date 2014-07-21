<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long id = Long.parseLong(request.getParameter("id"));
	int appealDecisionId = Integer.parseInt(request.getParameter("appealDecisionId"));
	
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	AppealDecision appealDecision = AppealDecision.getAppealDecision(id);
	appealDecision.setAppealDecisionId(appealDecisionId);
	appealDecision.setModifiedBy(modifiedBy);
	appealDecision.setModificationDate(modificationDate);
	AppealDecision.update(appealDecision);
%>
<p class="msg done">
	<label id="lblappealdecisionupdatedsuccessfully">
		<%
			String lblAppealDecisionUpdatedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealdecisionupdatedsuccessfully");
			label = Label.getLabelUsingLabelId("lblappealdecisionupdatedsuccessfully");
			out.print(lblAppealDecisionUpdatedSuccessfully != null ? lblAppealDecisionUpdatedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>