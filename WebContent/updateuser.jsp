<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.Date" %>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	
	int userId = Integer.parseInt(request.getParameter("userId"));
	String fullName = request.getParameter("fullName");
	String userType = request.getParameter("userType");
	
	//now update this particualr user with the value sent to it...
	User user = User.getUser(userId);
	user.setFullName(fullName);
	user.setUserType(userType);
	user.setModifiedBy(modifiedBy);
	user.setModificationDate(modificationDate);
	User.update(user);
%>