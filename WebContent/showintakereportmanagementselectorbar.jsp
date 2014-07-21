<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<form>
	<table border="0" width="100%" style="background:#eee">
		<tr>
			<td width="10%">Select Specific Report/የተፈለገውን ሪፖርት ምረጥ:</td>
			<td width="60%" colspan="3">
				<select name="slctintakereportdetail" id="slctintakereportdetail" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<option value="shownumberofregisteredcasesreport.jsp">Number of registered cases report/የተመዘገቡ ጉዳዮች/አቤቱታ ብዛት ሪፖርት</option>
					<option value="shownumberofrejectedcasesreport.jsp">Number of rejected cases report/ውድቅ የተደረጉ ጉዳዮች/አቤቱታ ብዛት ሪፖርት</option>
					<option value="shownumberofacceptedcasesreport.jsp">Number of accepted cases report/ተቀባይነት ያገኙ ጉዳዮች/አቤቱታ ብዛት ሪፖርት</option>
					<option value="shownnumberofassignedcasestoinvestigatorsreport.jsp">Number of assigned cases to investigators report/መርማሪ የተመደበላቸው ጉዳዮች/አቤቱታ ብዛት ሪፖርት</option>
					<option value="shownnumberofresolvedcasesatearlyresolutionstagereport.jsp">Number of resolved cases at early resolution stage report/በቅድመ ምርመራ እልባት ያገኙ ጉዳዮች/አቤቱታ ብዛት ሪፖርት</option>
					<option value="showndisabilityreport.jsp">Disability report/የአካል ጉዳተኛ ሪፖርት</option>
					<option value="shownmeansofapplicationreport.jsp">Means of application report/ማመልከቻ የቀረበበት መንገድ ሪፖርት</option>
					<option value="shownrolesreport.jsp">Roles report/የአመልካች ሚና ሪፖርት</option>
					<option value="showncasecategoryreport.jsp">Case category report/የጉዳይ/አቤቱታ ምድብ ሪፖርት</option>
					<option value="shownlinkagereport.jsp">Linkage report/የተያያዥነት ሪፖርት</option>
					<option value="shownoccupationreport.jsp">Occupation report/የአመልካች ሥራ መጠሪያ ሪፖርት</option>
					<option value="shownreasonreport.jsp">Reason report/የምክንያት ሪፖርት</option>
					<option value="shownsectorreport.jsp">Sector report/የዘርፍ ሪፖርት</option>					
				</select>
			</td>
		</tr>
		<tr>
			<td>From Date/መነሻ ቀን:</td>
			<td colspan="1">
				<input type="text" name="txtfromdate" id="txtfromdate"/><img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtfromdate')" />
			</td>
			<td>To Date/መዳረሻ ቀን:</td>
			<td colspan="1">
				<input type="text" name="txttodate" id="txttodate"/><img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txttodate')" />
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="Show/አሳይ" class="input-submit" onclick="showTheReportDetailForSelectedReportTypeDuring(
						document.getElementById('slctintakereportdetail').value,document.getElementById('txtfromdate').value,
						document.getElementById('txttodate').value);"/>
				<input type="reset" value="Clear/አፅዳ" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<div id="TheReportDetailDiv"></div>
