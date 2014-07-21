/**
 * 
 */
package com.signetitsolutions.bluebook.server.classes;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 *
 */
public class EarlyResolution {
	private long id;
	private String fileNumber;
	private String officerEffort;
	private String respondentResponse;
	private String applicantReaction;
	private Date resolutionDate;
	private String result;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * @param fileNumber
	 * @param officerEffort
	 * @param respondentResponse
	 * @param applicantReaction
	 * @param resolutionDate
	 * @param result
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EarlyResolution(String fileNumber, String officerEffort,
			String respondentResponse, String applicantReaction,
			Date resolutionDate, String result,int modifiedBy,Date modificationDate) {
		this.fileNumber = fileNumber;		
		this.officerEffort = officerEffort;
		this.respondentResponse = respondentResponse;
		this.applicantReaction = applicantReaction;
		this.resolutionDate = resolutionDate;
		this.result = result;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param fileNumber
	 * @param officerEffort
	 * @param respondentResponse
	 * @param applicantReaction
	 * @param resolutionDate
	 * @param result
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public EarlyResolution(long id, String fileNumber,
			String officerEffort, String respondentResponse,
			String applicantReaction, Date resolutionDate, String result,int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.fileNumber = fileNumber;		
		this.officerEffort = officerEffort;
		this.respondentResponse = respondentResponse;
		this.applicantReaction = applicantReaction;
		this.resolutionDate = resolutionDate;
		this.result = result;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}
	/**
	 * @return the applicantId
	 */
	
	/**
	 * @return the officerEffort
	 */
	public String getOfficerEffort() {
		return officerEffort;
	}
	/**
	 * @return the fileNumber
	 */
	public String getFileNumber() {
		return fileNumber;
	}
	/**
	 * @param fileNumber the fileNumber to set
	 */
	public void setFileNumber(String fileNumber) {
		this.fileNumber = fileNumber;
	}
	/**
	 * @param officerEffort the officerEffort to set
	 */
	public void setOfficerEffort(String officerEffort) {
		this.officerEffort = officerEffort;
	}
	/**
	 * @return the respondentResponse
	 */
	public String getRespondentResponse() {
		return respondentResponse;
	}
	/**
	 * @param respondentResponse the respondentResponse to set
	 */
	public void setRespondentResponse(String respondentResponse) {
		this.respondentResponse = respondentResponse;
	}
	/**
	 * @return the applicantReaction
	 */
	public String getApplicantReaction() {
		return applicantReaction;
	}
	/**
	 * @param applicantReaction the applicantReaction to set
	 */
	public void setApplicantReaction(String applicantReaction) {
		this.applicantReaction = applicantReaction;
	}
	/**
	 * @return the resolutionDate
	 */
	public Date getResolutionDate() {
		return resolutionDate;
	}
	/**
	 * @param resolutionDate the resolutionDate to set
	 */
	public void setResolutionDate(Date resolutionDate) {
		this.resolutionDate = resolutionDate;
	}
	/**
	 * @return the result
	 */
	public String getResult() {
		return result;
	}
	/**
	 * @param result the result to set
	 */
	public void setResult(String result) {
		this.result = result;
	}
	
	
	
	/**
	 * @return the modifiedBy
	 */
	public int getModifiedBy() {
		return modifiedBy;
	}
	/**
	 * @param modifiedBy the modifiedBy to set
	 */
	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	/**
	 * @return the modificationDate
	 */
	public Date getModificationDate() {
		return modificationDate;
	}
	/**
	 * @param modificationDate the modificationDate to set
	 */
	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}
	
	public void save(){
		try {
			String sqlStr = "insert into tbl_early_resolution values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getFileNumber());			
			pStmt.setString(3, this.getOfficerEffort());
			pStmt.setString(4, this.getRespondentResponse());
			pStmt.setString(5, this.getApplicantReaction());
			pStmt.setDate(6, this.getResolutionDate());
			pStmt.setString(7, this.getResult());
			pStmt.setInt(8, this.getModifiedBy());
			pStmt.setDate(9, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(EarlyResolution earlyResolution){
		try {
			String sqlStr = "update tbl_early_resolution set file_number = ?, officer_effort = ?," +
					"respondent_response = ?, applicant_reaction = ?, resolution_date = ?, result = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, earlyResolution.getFileNumber());			
			pStmt.setString(2, earlyResolution.getOfficerEffort());
			pStmt.setString(3, earlyResolution.getRespondentResponse());
			pStmt.setString(4, earlyResolution.getApplicantReaction());
			pStmt.setDate(5, earlyResolution.getResolutionDate());
			pStmt.setString(6, earlyResolution.getResult());
			pStmt.setInt(7, earlyResolution.getModifiedBy());
			pStmt.setDate(8, earlyResolution.getModificationDate());
			pStmt.setLong(9, earlyResolution.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long id){
		try {
			String sqlStr = "delete from tbl_early_resolution where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<EarlyResolution> getAllEarlyResolutions(){
		List<EarlyResolution> list = new ArrayList<EarlyResolution>();
		EarlyResolution earlyResolution = null;
		try {
			String query = "select * from tbl_early_resolution";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				earlyResolution = new EarlyResolution(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("officer_effort"), rSet.getString("respondent_response"), 
						rSet.getString("applicant_reaction"), rSet.getDate("resolution_date"), rSet.getString("result"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(earlyResolution);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<EarlyResolution> getAllEarlyResolutionsForThisApplicant(long applicantId){
		List<EarlyResolution> list = new ArrayList<EarlyResolution>();
		EarlyResolution earlyResolution = null;
		try {
			String query = "select * from tbl_early_resolution where applicant_id = "+applicantId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				earlyResolution = new EarlyResolution(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("officer_effort"), rSet.getString("respondent_response"), 
						rSet.getString("applicant_reaction"), rSet.getDate("resolution_date"), rSet.getString("result"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(earlyResolution);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static EarlyResolution getEarlyResolution(long id){
		EarlyResolution earlyResolution = null;
		try {
			String query = "select * from tbl_early_resolution where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				earlyResolution = new EarlyResolution(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("officer_effort"), rSet.getString("respondent_response"), 
						rSet.getString("applicant_reaction"), rSet.getDate("resolution_date"), rSet.getString("result"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return earlyResolution;
	}
	
	public static EarlyResolution getAllEarlyResolutionsUsingFileNumber(String fileNumber){
		EarlyResolution earlyResolution = null;
		try {
			String query = "select * from tbl_early_resolution where file_number = '"+fileNumber+"'";			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				earlyResolution = new EarlyResolution(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("officer_effort"), rSet.getString("respondent_response"), 
						rSet.getString("applicant_reaction"), rSet.getDate("resolution_date"), rSet.getString("result"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return earlyResolution;
	}
	
	public static int getTotalNumberOfCasesEarlyResolvedDuring(Date fromDate,Date toDate){
		int countVal=0;
		try{
			String query = "select count(*) as cnt from tbl_early_resolution where resolution_date between '"+fromDate+"' and '"+toDate+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				countVal = rSet.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return countVal;
	}
	
	public static int getHowManyOfThisSexCategoryEarlyResolvedDuring(Date fromDate,Date toDate,String sex){
		int countVal=0;
		try{
			String query = "select count(*) as cnt from tbl_early_resolution,tbl_case,tbl_applicant where resolution_date between '"+
		fromDate+"' and '"+toDate+"' and tbl_early_resolution.case_id = tbl_case.id and tbl_case.applicant_id = tbl_applicant.id and sex = '"+sex+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				countVal = rSet.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return countVal;
	}
}//end class
