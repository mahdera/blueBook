/**
 * 
 */

package com.signetitsolutions.bluebook.server.classes;

import java.sql.Date;
import java.sql.ResultSet;

/**
 * @author Mahder on macbook Pro
 *
 */
public class ReportUtility {
	public ReportUtility(){
		
	}
	
	public static int countHowManyCasesGotAcceptedFromThisRegionDuring(int regionId, Date startDate, Date endDate){
		int countVal = 0;
		try{
			String query = "select count(*) as countVal from tbl_decision d, tbl_applicant a, tbl_applicant_address ad " +
					"where d.applicant_id = a.id and a.id = ad.applicant_id and ad.region_id = "+regionId+" and d.modification_date between " +
							"'"+startDate+"' and '"+endDate+"' and (d.decision_given = 'Accepted' or d.decision_given = 'ተቀበል')";
			//System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				countVal = rSet.getInt("countVal");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return countVal;
	}
	

	public static int countHowManyCasesGotAcceptedFromThisRegionDuringAndSex(int regionId, Date startDate, Date endDate, String sex){
		int countVal = 0;
		try{
			String query = "select count(*) as countVal from tbl_decision d, tbl_applicant a, tbl_applicant_address ad " +
					"where d.applicant_id = a.id and a.id = ad.applicant_id and ad.region_id = "+regionId+" and d.modification_date between " +
							"'"+startDate+"' and '"+endDate+"' and a.sex = '"+sex+"'";
			//System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				countVal = rSet.getInt("countVal");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return countVal;
	}
}//end class
