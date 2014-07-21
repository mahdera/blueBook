<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long id = Long.parseLong(request.getParameter("id"));
	AppealDecision.delete(id);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<p class="msg done">
	<label id="lblappealdecisiondeletedsuccessfully">
		<%
			String lblAppealDecisionDeletedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealdecisiondeletedsuccessfully");
			label = Label.getLabelUsingLabelId("lblappealdecisiondeletedsuccessfully");
			out.print(lblAppealDecisionDeletedSuccessfully != null ? lblAppealDecisionDeletedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>