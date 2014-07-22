<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Date" %>
<%
	Date startDate = Date.valueOf(request.getParameter("startDate"));
	Date endDate = Date.valueOf(request.getParameter("endDate"));
	
	List<AdminField> regionFieldList = AdminField.getAllOptionValuesForThisFieldName("Region");
	Iterator<AdminField> regionFieldItr = null;	
%>
<div style="font-weight:bolder;font-size:12pt;text-align:center">Accepted & Not Accepted Appeal Summary Report b/n <%=startDate %> and <%=endDate %></div>
<table border="1" width="100%">
	<tr style="font-weight:bolder;font-size:10pt;background-color:#eeeeee;text-align:center">
		<td rowspan="2">Ser.No</td>
		<td colspan="6">
			Total Accepted by Sex
		</td>
		<td colspan="6">
			Total Not Accepted
		</td>
	</tr>
	<tr style="font-weight:bolder;font-size:10pt;background-color:#eeeeee;text-align:center">
		<td>Region From</td>
		<td>Count</td>
		<td>Male</td>
		<td>Female</td>
		<td>Not Identified</td>
		<td>Total</td>
		
		<td>Court Case</td>
		<td>Criminal Case</td>
		<td>Personal Case</td>
		<td>Religious Inistitution</td>
		<td>Others</td>
		<td>Under Standard</td>
	</tr>
	<%
		int ctr=1;
		if(!regionFieldList.isEmpty()){
			regionFieldItr = regionFieldList.iterator();
			while(regionFieldItr.hasNext()){
				AdminField regionField = regionFieldItr.next();
				String region = regionField.getOptionValue();
				int totalAcceptedCasesFromRegion = ReportUtility.countHowManyCasesGotAcceptedFromThisRegionDuring(regionField.getId(),startDate,endDate);
				int totalAcceptedCasesFromRegionMale = ReportUtility.countHowManyCasesGotAcceptedFromThisRegionDuringAndSex(regionField.getId(),startDate,endDate,"Male");
				int totalAcceptedCasesFromRegionFemale = ReportUtility.countHowManyCasesGotAcceptedFromThisRegionDuringAndSex(regionField.getId(),startDate,endDate,"Female");
				int totalAcceptedCasesFromRegionNotIdentified = ReportUtility.countHowManyCasesGotAcceptedFromThisRegionDuringAndSex(regionField.getId(),startDate,endDate,"Not Identified");				
				%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=region %></td>
						<td align="center"><%=totalAcceptedCasesFromRegion %></td>
						<td align="center"><%=totalAcceptedCasesFromRegionMale %></td>
						<td align="center"><%=totalAcceptedCasesFromRegionFemale %></td>
						<td align="center"><%=totalAcceptedCasesFromRegionNotIdentified %></td>
						<td align="center"><%=totalAcceptedCasesFromRegion %></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				<%
			}//end while loop
		}
	%>
	<tr>
		<td colspan="2" align="center">
			Total
		</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>