<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	User editUser = User.getUser(userId);
	//define the control names in here...
	String fullNameControlName = "txteditfullname" + userId;
	String userTypeControlName = "slcteditusertype" + userId;
%>
<form>
	<table border="0" width="100%" style="background:lightgreen">
		<tr>
			<td>Full Name/ሙሉ ሥም:</td>
			<td>
				<input type="text" name="<%=fullNameControlName %>" id="<%=fullNameControlName %>" value="<%=editUser.getFullName() %>"/>
			</td>
		</tr>
		<tr>
			<td>User Type/የተጠቃሚ አይነት:</td>
			<td>
				<select name="<%=userTypeControlName %>" id="<%=userTypeControlName %>" style="width:34%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<AdminField> adminFieldList = AdminField.getAllOptionValuesForThisFieldName("User Type");
						if(!adminFieldList.isEmpty()){
							Iterator<AdminField> adminFieldItr = adminFieldList.iterator();
							while(adminFieldItr.hasNext()){
								AdminField adminField = adminFieldItr.next();
								if(editUser.getUserType().equalsIgnoreCase(adminField.getOptionValue())){
								%>
								<option value="<%=adminField.getOptionValue() %>" selected="selected"><%=adminField.getOptionValue() %></option>
								<%
								}else{
									%>
									<option value="<%=adminField.getOptionValue() %>"><%=adminField.getOptionValue() %></option>
									<%
								}
							}//end while loop
						}
					%>
				</select>
			</td>
		</tr>		
		<tr>
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + userId;
				%>
				<input type="button" value="Update/አድስ" id="<%=buttonId %>" class="input-submit"/>
				<input type="reset" value="Undo/ወደ ቀድሞ ይዘት መልስ" class="input-submit"/>
			</td>
		</tr>		
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var userId = "<%=userId%>";
		var buttonId = "btnupdate" + userId;
		
		$('#'+buttonId).click(function(){
			var fullNameControlName = "txteditfullname" + userId;
			var userTypeControlName = "slcteditusertype" + userId;
			var fullName = $('#'+fullNameControlName).val();
			var userType = $('#'+userTypeControlName).val();
			var dataString = "userId="+userId+"&fullName="+fullName+"&userType="+userType;
			
			$.ajax({
			    url: 'updateuser.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){		
			    		$('#subTabDetailDiv').load('showusermanagement.jsp');				
			    },
			    error:function(error){
					alert(error);
			    }
			 });	
		});
	});//end document.ready function
</script>