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
public class InvestigatorAssignment {
	private long id;
	private String fileNumber;
	private String fileSource;
	private int userId;
	private int investigatorId;
	private String caseStatus;
	private Date dateAssigned;
	private Date openDate;
	private int modifiedBy;
	private Date modificationDate;
	/**	
	 * @param fileNumber
	 * @param fileSource
	 * @param userId
	 * @param investigatorId
	 * @param investigatorLevel
	 * @param caseStatus
	 * @param dateAssigned
	 * @param openDate
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public InvestigatorAssignment(String fileNumber, String fileSource, int userId,
			int investigatorId, String caseStatus,
			Date dateAssigned, Date openDate,int modifiedBy,Date modificationDate) {
		this.fileNumber = fileNumber;
		this.fileSource = fileSource;
		this.userId = userId;
		this.investigatorId = investigatorId;
		this.caseStatus = caseStatus;
		this.dateAssigned = dateAssigned;
		this.openDate = openDate;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param fileNumber 
	 * @param fileSource
	 * @param userId
	 * @param investigatorId
	 * @param caseStatus
	 * @param dateAssigned
	 * @param openDate
	 * @param modifiedBy
	 * @param modifificationDate
	 */
	public InvestigatorAssignment(long id, String fileNumber, String fileSource, int userId,
			int investigatorId, String caseStatus,
			Date dateAssigned, Date openDate,int modifiedBy,Date modificationDate) {
		this.id = id;
		this.fileNumber = fileNumber;
		this.fileSource = fileSource;
		this.userId = userId;
		this.investigatorId = investigatorId;
		this.caseStatus = caseStatus;
		this.dateAssigned = dateAssigned;
		this.openDate = openDate;
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
	 * @return the fileSource
	 */
	public String getFileSource() {
		return fileSource;
	}
	/**
	 * @param fileSource the fileSource to set
	 */
	public void setFileSource(String fileSource) {
		this.fileSource = fileSource;
	}
	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	/**
	 * @return the investigatorId
	 */
	public int getInvestigatorId() {
		return investigatorId;
	}
	/**
	 * @param investigatorId the investigatorId to set
	 */
	public void setInvestigatorId(int investigatorId) {
		this.investigatorId = investigatorId;
	}
	/**
	 * @return the caseStatus
	 */
	public String getCaseStatus() {
		return caseStatus;
	}
	/**
	 * @param caseStatus the caseStatus to set
	 */
	public void setCaseStatus(String caseStatus) {
		this.caseStatus = caseStatus;
	}
	/**
	 * @return the dateAssigned
	 */
	public Date getDateAssigned() {
		return dateAssigned;
	}
	/**
	 * @param dateAssigned the dateAssigned to set
	 */
	public void setDateAssigned(Date dateAssigned) {
		this.dateAssigned = dateAssigned;
	}
	/**
	 * @return the openDate
	 */
	public Date getOpenDate() {
		return openDate;
	}
	/**
	 * @param openDate the openDate to set
	 */
	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
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
			String sqlStr = "insert into tbl_investigator_assignment values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getFileNumber());			
			pStmt.setString(3, this.getFileSource());
			pStmt.setInt(4, this.getUserId());
			pStmt.setInt(5, this.getInvestigatorId());			
			pStmt.setString(6, this.getCaseStatus());
			pStmt.setDate(7, this.getDateAssigned());
			pStmt.setDate(8, this.getOpenDate());
			pStmt.setInt(9, this.getModifiedBy());
			pStmt.setDate(10, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(InvestigatorAssignment investigatorAssignment){
		try {
			String sqlStr = "update tbl_investigator_assignment set file_number = ?, file_source = ?, user_id = ?, investigator_id = ?," +
					"case_status = ?, date_assigned = ?, open_date = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, investigatorAssignment.getFileNumber());			
			pStmt.setString(2, investigatorAssignment.getFileSource());
			pStmt.setInt(3, investigatorAssignment.getUserId());
			pStmt.setInt(4, investigatorAssignment.getInvestigatorId());			
			pStmt.setString(5, investigatorAssignment.getCaseStatus());
			pStmt.setDate(6, investigatorAssignment.getDateAssigned());
			pStmt.setDate(7, investigatorAssignment.getOpenDate());
			pStmt.setInt(8, investigatorAssignment.getModifiedBy());
			pStmt.setDate(9, investigatorAssignment.getModificationDate());
			pStmt.setLong(10, investigatorAssignment.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long id){
		try {
			String sqlStr = "delete from tbl_investigator_assignment where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<InvestigatorAssignment> getAllInvestigatorAssignmentsForThisCase(long caseId){
		List<InvestigatorAssignment> list = new ArrayList<InvestigatorAssignment>();
		InvestigatorAssignment investigatorAssignment = null;
		try {
			String query = "select * from tbl_investigator_assignment where case_id = "+caseId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorAssignment = new InvestigatorAssignment(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("file_source"), rSet.getInt("user_id"), rSet.getInt("investigator_id"), 
						rSet.getString("case_status"), rSet.getDate("date_assigned"), rSet.getDate("open_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(investigatorAssignment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<InvestigatorAssignment> getAllInvestigatorAssignments(){
		List<InvestigatorAssignment> list = new ArrayList<InvestigatorAssignment>();
		InvestigatorAssignment investigatorAssignment = null;
		try {
			String query = "select * from tbl_investigator_assignment";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorAssignment = new InvestigatorAssignment(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("file_source"), rSet.getInt("user_id"), rSet.getInt("investigator_id"), 
						rSet.getString("case_status"), rSet.getDate("date_assigned"), rSet.getDate("open_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(investigatorAssignment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<InvestigatorAssignment> getAllInvestigatorAssignmentsForThisInvestigator(int investigatorId){
		List<InvestigatorAssignment> list = new ArrayList<InvestigatorAssignment>();
		InvestigatorAssignment investigatorAssignment = null;
		try {
			String query = "select * from tbl_investigator_assignment where investigator_id = "+investigatorId;			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorAssignment = new InvestigatorAssignment(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("file_source"), rSet.getInt("user_id"), rSet.getInt("investigator_id"), 
						rSet.getString("case_status"), rSet.getDate("date_assigned"), rSet.getDate("open_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(investigatorAssignment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<InvestigatorAssignment> getAllInvestigatorAssignmentsForThisInvestigatorWithCaseStatus(int investigatorId, String caseStatus){
		List<InvestigatorAssignment> list = new ArrayList<InvestigatorAssignment>();
		InvestigatorAssignment investigatorAssignment = null;
		try {
			String query = "select * from tbl_investigator_assignment where investigator_id = "+investigatorId+" and case_status = '"+caseStatus+"'";			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorAssignment = new InvestigatorAssignment(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("file_source"), rSet.getInt("user_id"), rSet.getInt("investigator_id"), 
						rSet.getString("case_status"), rSet.getDate("date_assigned"), rSet.getDate("open_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(investigatorAssignment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static InvestigatorAssignment fetchInvestigatorAssignmentUsingFileNumber(String fileNumber){
		InvestigatorAssignment investigatorAssignment = null;
		try {
			String query = "select * from tbl_investigator_assignment where file_number = '"+fileNumber+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorAssignment = new InvestigatorAssignment(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("file_source"), rSet.getInt("user_id"), rSet.getInt("investigator_id"), 
						rSet.getString("case_status"), rSet.getDate("date_assigned"), rSet.getDate("open_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigatorAssignment;
	}
	
	public static InvestigatorAssignment getInvestigatorAssignment(long id){
		InvestigatorAssignment investigatorAssignment = null;
		try {
			String query = "select * from tbl_investigator_assignment where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorAssignment = new InvestigatorAssignment(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("file_source"), rSet.getInt("user_id"), rSet.getInt("investigator_id"), 
						rSet.getString("case_status"), rSet.getDate("date_assigned"), rSet.getDate("open_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigatorAssignment;
	}
	
	public static int getTotalNumberOfCasesAssignedToInvestigatorsDuring(Date fromDate,Date toDate){
		int countVal = 0;
		try{
			String query = "select count(*) as cnt from tbl_investigator_assignment where date_assigned between '"+fromDate+"' and '"+toDate+"'";
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
	
	public static int getHowManyOfThisSexGroupAssignedToInvestigatorDuring(Date fromDate,Date toDate,String sex){
		int countVal=0;
		try{
			String query = "select count(*) as cnt from tbl_investigator_assignment,tbl_case,tbl_applicant where date_assigned between '"+
		fromDate+"' and '"+toDate+"' and tbl_investigator_assignment.case_id = tbl_case.id and tbl_case.applicant_id = tbl_applicant.id and sex = '"+sex+"'";
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
	
	public static int getInvestigatorAssignmentCount(int investigatorId){
		int countVal = 0;
		try{
			String query = "select count(*) as cnt from tbl_investigator_assignment where investigator_id = "+investigatorId;
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
	
	public static Date getLastMaxDateAssignedForInvestigator(int investigatorId){
		Date maxDate = null;
		try{
			String query = "select max(date_assigned) as maxDate from tbl_investigator_assignment where investigator_id = "+investigatorId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				maxDate = rSet.getDate("maxDate");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return maxDate;
	}
	
	public static List<InvestigatorAssignment> getAllInvestigatorAssignmentsForFileNumber(String fileNumber){
		List<InvestigatorAssignment> list = new ArrayList<InvestigatorAssignment>();
		InvestigatorAssignment investigatorAssignment = null;
		try{
			String query = "select tbl_investigator_assignment.* from tbl_investigator_assignment,tbl_investigator " +
					"where tbl_investigator_assignment.investigator_id = tbl_investigator.id";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorAssignment = new InvestigatorAssignment(rSet.getLong("id"), rSet.getString("file_number"), 
					rSet.getString("file_source"), rSet.getInt("user_id"), rSet.getInt("investigator_id"), 
					rSet.getString("case_status"), rSet.getDate("date_assigned"), rSet.getDate("open_date"),
					rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(investigatorAssignment);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}//end class
