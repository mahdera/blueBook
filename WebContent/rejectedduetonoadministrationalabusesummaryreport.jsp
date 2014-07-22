<form>
	<table border="0" width="100%">
		<tr style="background:#eeeeee">
			<td>Start Date:</td>
			<td>
				<input type="text" name="txtfromdate" id="txtfromdate"/>
			</td>
			<td>End Date:</td>
			<td>
				<input type="text" name="txtenddate" id="txtenddate"/>
			</td>
			<td>
				<button type="button" id="btnshowreportdetail">Show Report</button>
				<button type="reset">Reset</button>
			</td>
		</tr>
	</table>
</form>
<div id="innerReportDetailDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#txtfromdate').Zebra_DatePicker();
		$('#txtenddate').Zebra_DatePicker();
		
		$('#btnshowreportdetail').click(function(){
			var startDate = $('#txtfromdate').val();
			var endDate = $('#txtenddate').val();
			
			if(startDate !== "" && endDate !== ""){
				$('#innerReportDetailDiv').load('showrejectedduetonoadministrationalabusesummaryreportindaterange.jsp?startDate='+startDate+'&endDate='+endDate);
			}
		});//end button.click function
	});//end document.ready function
</script>