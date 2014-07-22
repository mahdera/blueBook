<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Date" %>
<%
	Date startDate = Date.valueOf(request.getParameter("startDate"));
	Date endDate = Date.valueOf(request.getParameter("endDate"));
	
	
%>
<table border="1" width="100%">
	<tr style="font-weight:bolder;font-size:10pt">
		<td width="10%">Ser.No</td>
		<td width="60%">Appeal Type</td>
		<td>Total</td>
	</tr>
	<tr>
		<td>1</td>
		<td>Related to Property</td>
		<td></td>
	</tr>
	<tr>
		<td>2</td>
		<td>Related to Work</td>
		<td></td>
	</tr>
	<tr>
		<td>3</td>
		<td>Related to Education</td>
		<td></td>
	</tr>
	<tr>
		<td>4</td>
		<td>Related to Pension</td>
		<td></td>
	</tr>
	<tr>
		<td>5</td>
		<td>Related to Ransom</td>
		<td></td>
	</tr>
	<tr>
		<td>6</td>
		<td>Related to Not Being Able to get Service</td>
		<td></td>
	</tr>
	<tr>
		<td>7</td>
		<td>Others</td>
		<td></td>
	</tr>
	<tr>
		<td colspan="2" align="center">Total</td>		
		<td></td>
	</tr>
</table>