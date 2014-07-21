<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langIdL = Integer.parseInt(session.getAttribute("langId").toString());
	Label labelL = null;
%>
<div class="padding box"> 
 
				<!-- Logo (Max. width = 200px) --> 
				<p id="logo">
					<a href="#">
						<img src="images/logo.jpg" width="10%" alt="Our logo" />
					</a>
				</p> 
 
				<!-- Search --> 
				    
					<fieldset> 
						<legend>
							<label id="lblsearch">
								<%
									String lblSearch = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langIdL,"lblsearch");
									labelL = Label.getLabelUsingLabelId("lblsearch");
					 				out.print(lblSearch != null ? lblSearch : labelL.getLabelCaption());
					 			%>
							</label>
						</legend>
 						<%
	 						String lblOkButtonLabel = "lblokbutton";
	 						String okButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langIdL,"lblokbutton");
	 						labelL = Label.getLabelUsingLabelId("lblokbutton");
	 						String okButtonCaption = okButtonLabel != null ? okButtonLabel : labelL.getLabelCaption();
 						%>
						<p><input type="text" size="17" name="txtsearchquery" id="txtsearchquery" class="input-text" />&nbsp;<input type="button" value="<%=okButtonCaption %>" class="input-submit-02" onclick="showSearchResult(document.getElementById('txtsearchquery').value);"/><br />
						<!--  
						<a href="javascript:toggle('search-options');" class="ico-drop">Advanced search</a></p> 
 						-->
						 
						<div id="search-options" style="display:none;"> 
 
							<p> 
								<label><a href="#.jsp" onclick="showSearchMemberByIdNumberForm();">Search By Id Number</a></label><br /> 
								<!-- <label><a href="#.jsp" onclick="showSearchMemberByNameForm();">Search By Name</a></label><br /> -->  
							</p> 
 
						</div> 
 
					</fieldset> 
					
 
				<!-- Create a new project --> 
				<p id="btn-create" class="box"><a href="userhome.jsp"><span id="selectedFunctionalitySpan">
					<label id="lbluserhome">
						<%
							String lblUserHome = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langIdL,"lbluserhome");
							labelL = Label.getLabelUsingLabelId("lbluserhome");
			 				out.print(lblUserHome != null ? lblUserHome : labelL.getLabelCaption());
			 			%>
					</label>					
				</span></a></p> 
				
			</div> <!-- /padding --> 