<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<MenuTranslation> menuTranslationList = MenuTranslation.getAllMenuTranslations();
	if(!menuTranslationList.isEmpty()){
	Iterator<MenuTranslation> menuTranslationItr = menuTranslationList.iterator();
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<table border="0" width="100%">
	<tr style="background:#eee;font-weight:bolder">
		<td><label id="lblserialnumber"><%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
					out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
				%></label></td>
		<td><label id="lbllanguage"><%
					String lblLanguage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllanguage");
					label = Label.getLabelUsingLabelId("lbllanguage");
					out.print(lblLanguage != null ? lblLanguage : label.getLabelCaption());
				%></label></td>
		<td><label id="lblmenu"><%
					String lblMenu = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmenu");
					label = Label.getLabelUsingLabelId("lblmenu");
					out.print(lblMenu != null ? lblMenu : label.getLabelCaption());
				%></label></td>
		<td><label id="lbltranslatedvalue"><%
					String lblTranslatedValue = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltranslatedvalue");
					label = Label.getLabelUsingLabelId("lbltranslatedvalue");
					out.print(lblTranslatedValue != null ? lblTranslatedValue : label.getLabelCaption());
				%></label></td>
		<td><label id="lbldelete"><%
					String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
					label = Label.getLabelUsingLabelId("lbldelete");
					out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
				%></label></td>
	</tr>
	<%
		int ctr=1;
		while(menuTranslationItr.hasNext()){
			MenuTranslation menuTranslation = menuTranslationItr.next();
			Language language = Language.getLanguage(menuTranslation.getLanguageId());
			Functionality menu = Functionality.getFunctionality(menuTranslation.getMenuId());
			%>
				<tr>
					<td><%=ctr++ %></td>
					<td><%=language.getLanguage() %></td>
					<td><%=menu.getFunctionalityName() %></td>
					<td><%=menuTranslation.getTranslatedValue() %></td>
					<td>
						<a href="#.jsp" onclick="deleteThisMenuTranslation(<%=menuTranslation.getId() %>);">Delete Menu Translation</a>						
					</td>
				</tr>				
			<%
		}//end while loop
	%>
</table>
<%
	}else{
		%>
			<p class="msg warning">No menu translation found!</p>
		<%
	}
%>
<script type="text/javascript">
	function deleteThisMenuTranslation(id){
		if(window.confirm('Are you sure you want to delete this menu translation?')){
			var dataString = "id="+id;
			$.ajax({					
			    url: 'deletemenutranslation.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){			    		
			    		$('#menuTranslationDiv').load("showlistofmenutranslationsfordelete.jsp");				    		
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}//end if confirmation condition
	}
</script>