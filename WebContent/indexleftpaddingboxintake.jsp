<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<div class="padding box">

	<!-- Logo (Max. width = 200px) -->
	<p id="logo">
		
			<img src="images/logo.jpg" width="10%" alt="Our logo" />
		
	</p>
	
	<!-- Create a new project 
	<p id="btn-create" class="box">
		<a href="#.jsp">		
			<span>Create a new project</span>
		</a>		
	</p>-->

	<p class="box">		 
		<form name="frmlogin" id="frmlogin" method="post" action="validateintakeofficer.jsp">				
					<table border="1" width="100%">
							<tr>
								<td colspan="2">
									<div id="loginErrorDiv" align="center" style="color:red">
										<%
											if (request.getParameter("msg") != null) {
												out.print(request.getParameter("msg"));
											}
										%>
									</div></td>
							</tr>
							<tr>
								<td style="width: 70px;">Username:</td>
								<td><input type="text" size="15" name="txtusername"
									id="txtusername" class="input-text" />
								</td>
							</tr>
							<tr>
								<td>Password:</td>
								<td><input type="password" size="15" name="txtpassword"
									id="txtpassword" class="input-text" />
								</td>
							</tr>	
							<tr>
								<td>Language:</td>
								<td>
									<select name="slctlanguage" id="slctlanguage" style="width:100%">
									<option value="" selected="selected">--Select--</option>
									<%
										List<Language> languageList = Language.getAllLanguages();										
										Iterator<Language> languageItr = null;
										if(!languageList.isEmpty()){
											languageItr = languageList.iterator();
											while(languageItr.hasNext()){
												Language lang = languageItr.next();
												%>
												<option value="<%=lang.getId() %>"><%=lang.getLanguage() %></option>
												<%
											}//end while loop
										}//end if condition
									%>
									</select>
								</td>
							</tr>						
							<tr>
								<td></td>
								<td ><input type="submit"
									value="Login" class="input-submit"/>									
									<input type="reset"  value="Clear" class="input-submit"/></td>
							</tr>
						</table>					
					</form>
		</p>
</div>
<!-- /padding -->
<script type="text/javascript">
	$(document).ready(function(){
		$('#txtusername').focus();
		
		$('#frmlogin').submit(function(){
			var username = $('#txtusername').val();
			var password = $('#txtpassword').val();
			var langaugeId = $('#slctlanguage').val();
			
			if(username != "" && password != "" && langaugeId != ""){
				return true;
			}else{
				$('#loginErrorDiv').html("<p class='msg error'>Please enter all the required data fileds!</p>");
				return false;
			}
		});
	});//end document.ready function
</script>