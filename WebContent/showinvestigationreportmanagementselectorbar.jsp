<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<form>
	<table border="0" width="100%" style="background:#eee">
		<tr>
			<td width="10%">Select Specific Report/የተፈለገውን ሪፖርት ምረጥ:</td>
			<td width="60%" colspan="3">
				<select name="slctinvestigationdetailreport" id="slctinvestigationdetailreport" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<option value="showinvestigationcasesnotopenedreport.jsp">Cases not opened report/ገና ያልተከፈቱ ጉዳዮች/አቤቱታዎች ሪፖርት</option>
					<option value="showinvestigationacceptedcasesreport.jsp">Accepted cases report/ተቀባይነት ያገኙ ጉዳዮች/አቤቱታ ሪፖርት</option>
					<option value="showinvestigationunacceptedcasesreport.jsp">Unaccepted cases report/ውድቅ የተደረጉ ጉዳዮች/አቤቱታ ሪፖርት</option>
					<option value="showinvestigationcasessolvedbyagreementreport.jsp">Cases solved by agreement report/በሥምምነት የተዘጉ ሪፖርቶች</option>
					<option value="showinvestigationcaseinvestigationinprogressreport.jsp">Case investigation in-progress report/በሥራ ሂደት ውስጥ ያሉ ጉዳዮች/አቤቱታዎች ሪፖርት</option>
					<option value="showinvestigationterminatedcasesreport.jsp">Terminated cases report/የተቋረጡ ጉዳዮች/አቤቱታዎች ሪፖርት</option>
					<option value="showinvestigationsolvedcasereport.jsp">Solved case report/እልባት ያጉኙ ጉዳዮች/አቤቱታዎች ሪፖርት</option>										
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
						document.getElementById('slctinvestigationdetailreport').value,document.getElementById('txtfromdate').value,
						document.getElementById('txttodate').value);"/>
				<input type="reset" value="Clear/አፅዳ" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<div id="TheReportDetailDiv"></div>
