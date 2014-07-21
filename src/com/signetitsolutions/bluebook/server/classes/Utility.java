/**
 * 
 */
package com.signetitsolutions.bluebook.server.classes;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 *
 */
public class Utility {
	public Utility(){
		
	}
	
	public static List<String> filterFileNumbersFoundIn(String fromTable, String notInTable){
		List<String> fileNumberList = new ArrayList<String>();
		try{
			String query = "select distinct fT.file_number as fileNumber from "+fromTable+" fT where fT.file_number not in ( select "+notInTable+".file_number from "+notInTable+" )";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				fileNumberList.add(rSet.getString("fileNumber"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return fileNumberList;
	}
	
	public static List<String> filterFileNumberFoundInForUser(String fromTable, String notInTable, String columnName, int userId){
		List<String> fileNumberList = new ArrayList<String>();
		try{
			String query = "select distinct fT.file_number as fileNumber from "+fromTable+" fT where fT.file_number not in ( select nT.file_number from "+notInTable+" nT ) and " +
					"fT."+columnName+" = "+userId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				fileNumberList.add(rSet.getString("fileNumber"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return fileNumberList;
	}
}//end class
