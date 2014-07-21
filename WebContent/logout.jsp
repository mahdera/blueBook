<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
            session.setAttribute("account", null);
            //session.setAttribute("langId", null);            
%>
<jsp:forward page="index.jsp">
    <jsp:param name="mahder" value="mahder"/>
</jsp:forward>
