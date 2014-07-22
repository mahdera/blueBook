<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Date" %>
<%
	Date startDate = Date.valueOf(request.getParameter("startDate"));
	Date endDate = Date.valueOf(request.getParameter("endDate"));
	
	List<AdminField> regionList = AdminField.getAllOptionValuesForThisFieldName("Region");
	Iterator<AdminField> regionItr = null;
	if(!regionList.isEmpty()){
		regionItr = regionList.iterator();
	}
%>
<table border="1" width="100%">
	<tr style="background:#eeeeee;font-weight:bolder;font-size:10pt;text-align:center">
		<td rowspan="2">Ser.No</td>
		<td rowspan="2">Region</td>
		<td colspan="4">Sex</td>
		<td rowspan="2">Total Appeal/Case</td>
	</tr>
	<tr style="background:#eeeeee;font-weight:bolder;font-size:10pt;text-align:center">
		<td>Male</td>
		<td>Female</td>
		<td>Unidentified</td>
		<td>Total</td>
	</tr>
	<%
		int ctr=1;
		while(regionItr.hasNext()){
			AdminField regionField = regionItr.next();
			String region = regionField.getOptionValue();
			%>
				<tr>
					<td><%=ctr++ %></td>
					<td><%=region %></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			<%
		}//end while loop
	%>
	<tr>
		<td></td>
		<td>Total</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>