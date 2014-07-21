<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
    int roleIdPara = Integer.parseInt(request.getParameter("roleId"));
    int accountIdPara = Integer.parseInt(request.getParameter("accountId"));
    int functionalityId = Integer.parseInt(request.getParameter("functionalityId"));
    boolean hasReadAccess = Boolean.parseBoolean(request.getParameter("hasReadAccess"));
    boolean hasWriteAccess = Boolean.parseBoolean(request.getParameter("hasWriteAccess"));
    boolean hasUpdateAccess = Boolean.parseBoolean(request.getParameter("hasUpdateAccess"));
    boolean hasDeleteAccess = Boolean.parseBoolean(request.getParameter("hasDeleteAccess"));

    
    Role roleUpdate = new Role(roleIdPara, accountIdPara, hasReadAccess, hasWriteAccess, hasUpdateAccess, hasDeleteAccess, functionalityId);
    Role.updateRole(roleUpdate);
%>
<p class="msg done">Role Updated!</p>