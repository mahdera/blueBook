<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<form>
	<table border="0" width="100%" style="background:#eee">
		<tr>
			<td>Select Report Type/የሪፖርት ዓይነት ምረጥ:</td>
			<td>
				<select name="slctreporttype" id="slctreporttype" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<option value="intakeReportManagement">In take Report/የቅበላ ሪፖርት</option>
					<option value="investigationReportManagement">Investigation Report/የምርመራ ሪፖርት</option>
				</select>
			</td>
			<td>
				<input type="button" value="Show/አሳይ" onclick="showReportDetailSelectionForThisReport(document.getElementById('slctreporttype').value);" class="input-submit"/>
				<input type="reset" value="Clear/አፅዳ" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<div id="reportDetailDiv"></div>