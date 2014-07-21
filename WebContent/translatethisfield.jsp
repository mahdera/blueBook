<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%	
	int adminFieldId = Integer.parseInt(request.getParameter("adminFieldId"));
	int languageId = Integer.parseInt(request.getParameter("languageId"));
	String translatedValue = request.getParameter("translatedValue");
	
	AdminFieldTranslation fetchAdminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(languageId, adminFieldId);
	if(fetchAdminFieldTranslation != null){
		//record exists so update the record...
		fetchAdminFieldTranslation.setAdminFieldId(adminFieldId);
		fetchAdminFieldTranslation.setLanguageId(languageId);
		fetchAdminFieldTranslation.setTranslatedValue(translatedValue);
		AdminFieldTranslation.update(fetchAdminFieldTranslation);
	}else{
		//insert new record...
		AdminFieldTranslation adminFieldTranslation = new AdminFieldTranslation(adminFieldId,languageId,translatedValue);
		adminFieldTranslation.save();
	}
%>
<p class="msg done">Admin field value translated successfully!</p>