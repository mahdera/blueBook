<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	long appealId = Long.parseLong(request.getParameter("appealId"));
	Appeal.delete(appealId);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<p class="msg done">
	<label id="lblappealdeletedsuccessfully">
		<%
			String lblAppealDeletedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealdeletedsuccessfully");
			label = Label.getLabelUsingLabelId("lblappealdeletedsuccessfully");
			out.print(lblAppealDeletedSuccessfully != null ? lblAppealDeletedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>