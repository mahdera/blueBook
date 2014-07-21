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
	
	String fileNumber = request.getParameter("fileNumber");
	int appealDecisionId = Integer.parseInt(request.getParameter("appealDecision"));
		
	AppealDecision appealDecision = new AppealDecision(fileNumber,appealDecisionId,modifiedBy,modificationDate);
	appealDecision.save();
%>
<p class="msg done">
	<label id="lblappealdecisionregisteredsuccessfully">
		<%
			String lblAppealDecisionRegisteredSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealdecisionregisteredsuccessfully");
			label = Label.getLabelUsingLabelId("lblappealdecisionregisteredsuccessfully");
			out.print(lblAppealDecisionRegisteredSuccessfully != null ? lblAppealDecisionRegisteredSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>