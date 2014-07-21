<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>

<%
            String username = request.getParameter("txtusername");
            String password = request.getParameter("txtpassword");            
            int languageId = Integer.parseInt(request.getParameter("slctlanguage"));
            
            Account account = Account.getAccount(username,password,"Appeal Officer");           
            
            if (account != null){            	
                session.setMaxInactiveInterval(3600);                               
                session.setAttribute("account",account);                
                session.setAttribute("langId",languageId);
                %>
                		<script type="text/javascript">
	                		document.location.href = "userhome.jsp";
	                </script>
                <%
            }else{
%>
                <jsp:forward page="intakeindexpage.jsp">
                    <jsp:param name="msg" value="<font color='red'><strong>Wrong username or password!<br/>Try again...</strong></font>"/>
                </jsp:forward>
<%
            }
%>