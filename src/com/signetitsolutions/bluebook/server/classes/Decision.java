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
public class Decision {
	private long id;
	private String fileNumber;
	private long applicantId;
	private long caseId;
	private int respondentId;
	private String decisionGiven;
	private String notes;
	private String focus;
	private int caseTypeId;
	private Date registrationDate;
	private int userId;
	private int modifiedBy;
	private Date modificationDate;
	
	
	
	/**
	 * 
	 */
	public Decision() {
	}
	
	

	/**
	 * @param fileNumber
	 * @param applicantId
	 * @param caseId
	 * @param respondentId
	 * @param decisionGiven
	 * @param notes
	 * @param focus
	 * @param caseTypeId
	 * @param registrationDate
	 * @param userId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Decision(String fileNumber, long applicantId, long caseId,
			int respondentId, String decisionGiven, String notes, String focus,
			int caseTypeId, Date registrationDate, int userId, int modifiedBy,
			Date modificationDate) {
		this.fileNumber = fileNumber;
		this.applicantId = applicantId;
		this.caseId = caseId;
		this.respondentId = respondentId;
		this.decisionGiven = decisionGiven;
		this.notes = notes;
		this.focus = focus;
		this.caseTypeId = caseTypeId;
		this.registrationDate = registrationDate;
		this.userId = userId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	

	/**
	 * @param id
	 * @param fileNumber
	 * @param applicantId
	 * @param caseId
	 * @param respondentId
	 * @param decisionGiven
	 * @param notes
	 * @param focus
	 * @param caseTypeId
	 * @param registrationDate
	 * @param userId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Decision(long id, String fileNumber, long applicantId, long caseId,
			int respondentId, String decisionGiven, String notes, String focus,
			int caseTypeId, Date registrationDate, int userId, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.fileNumber = fileNumber;
		this.applicantId = applicantId;
		this.caseId = caseId;
		this.respondentId = respondentId;
		this.decisionGiven = decisionGiven;
		this.notes = notes;
		this.focus = focus;
		this.caseTypeId = caseTypeId;
		this.registrationDate = registrationDate;
		this.userId = userId;
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
	 * @return the applicantId
	 */
	public long getApplicantId() {
		return applicantId;
	}



	/**
	 * @param applicantId the applicantId to set
	 */
	public void setApplicantId(long applicantId) {
		this.applicantId = applicantId;
	}



	/**
	 * @return the caseId
	 */
	public long getCaseId() {
		return caseId;
	}



	/**
	 * @param caseId the caseId to set
	 */
	public void setCaseId(long caseId) {
		this.caseId = caseId;
	}



	/**
	 * @return the respondentId
	 */
	public int getRespondentId() {
		return respondentId;
	}



	/**
	 * @param respondentId the respondentId to set
	 */
	public void setRespondentId(int respondentId) {
		this.respondentId = respondentId;
	}



	/**
	 * @return the decisionGiven
	 */
	public String getDecisionGiven() {
		return decisionGiven;
	}



	/**
	 * @param decisionGiven the decisionGiven to set
	 */
	public void setDecisionGiven(String decisionGiven) {
		this.decisionGiven = decisionGiven;
	}



	/**
	 * @return the notes
	 */
	public String getNotes() {
		return notes;
	}



	/**
	 * @param notes the notes to set
	 */
	public void setNotes(String notes) {
		this.notes = notes;
	}



	/**
	 * @return the focus
	 */
	public String getFocus() {
		return focus;
	}



	/**
	 * @param focus the focus to set
	 */
	public void setFocus(String focus) {
		this.focus = focus;
	}



	/**
	 * @return the caseTypeId
	 */
	public int getCaseTypeId() {
		return caseTypeId;
	}



	/**
	 * @param caseTypeId the caseTypeId to set
	 */
	public void setCaseTypeId(int caseTypeId) {
		this.caseTypeId = caseTypeId;
	}



	/**
	 * @return the registrationDate
	 */
	public Date getRegistrationDate() {
		return registrationDate;
	}



	/**
	 * @param registrationDate the registrationDate to set
	 */
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
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
			String sqlStr = "insert into tbl_decision values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getFileNumber());
			pStmt.setLong(3, this.getApplicantId());
			pStmt.setLong(4, this.getCaseId());
			pStmt.setInt(5, this.getRespondentId());
			pStmt.setString(6, this.getDecisionGiven());
			pStmt.setString(7, this.getNotes());
			pStmt.setString(8, this.getFocus());
			pStmt.setInt(9, this.getCaseTypeId());
			pStmt.setDate(10, this.getRegistrationDate());
			pStmt.setInt(11, this.getUserId());
			pStmt.setInt(12, this.getModifiedBy());
			pStmt.setDate(13, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(Decision decision){
		try {
			String sqlStr = "update tbl_decision set file_number = ?, applicant_id = ?, case_id = ?," +
					"respondent_id = ?, decision_given = ?, notes = ?, focus = ?, case_type_id = ?, registration_date = ?, user_id = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, decision.getFileNumber());
			pStmt.setLong(2, decision.getApplicantId());
			pStmt.setLong(3, decision.getCaseId());
			pStmt.setInt(4, decision.getRespondentId());
			pStmt.setString(5, decision.getDecisionGiven());
			pStmt.setString(6, decision.getNotes());
			pStmt.setString(7, decision.getFocus());
			pStmt.setInt(8, decision.getCaseTypeId());
			pStmt.setDate(9, decision.getRegistrationDate());
			pStmt.setInt(10, decision.getUserId());
			pStmt.setInt(11, decision.getModifiedBy());
			pStmt.setDate(12, decision.getModificationDate());
			pStmt.setLong(13, decision.getId());
			DBConnection.writeToDatabase(pStmt);
			System.out.println(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long id){
		try {
			String sqlStr = "delete from tbl_decision where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<Decision> getAllDecisionsForThisApplicant(long applicantId){
		List<Decision> list = new ArrayList<Decision>();
		Decision decision = null;
		try {
			String query = "select * from tbl_decision where applicant_id = "+applicantId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				decision = new Decision(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getLong("applicant_id"), rSet.getLong("case_id"), rSet.getInt("respondent_id"), 
						rSet.getString("decision_given"), rSet.getString("notes"), rSet.getString("focus"),rSet.getInt("case_type_id"), rSet.getDate("registration_date"), 
						rSet.getInt("user_id"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(decision);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Decision> getAllDecisions(){
		List<Decision> list = new ArrayList<Decision>();
		Decision decision = null;
		try {
			String query = "select * from tbl_decision";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				decision = new Decision(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getLong("applicant_id"), rSet.getLong("case_id"), rSet.getInt("respondent_id"), 
						rSet.getString("decision_given"), rSet.getString("notes"), rSet.getString("focus"),rSet.getInt("case_type_id"), rSet.getDate("registration_date"), 
						rSet.getInt("user_id"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(decision);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Decision getDecisionForThisCase(long caseId){
		Decision decision = null;
		try {
			String query = "select * from tbl_decision where case_id = "+caseId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				decision = new Decision(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getLong("applicant_id"), rSet.getLong("case_id"), rSet.getInt("respondent_id"), 
						rSet.getString("decision_given"), rSet.getString("notes"), rSet.getString("focus"),rSet.getInt("case_type_id"), rSet.getDate("registration_date"), 
						rSet.getInt("user_id"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return decision;
	}
	
	public static Decision getDecision(long id){
		Decision decision = null;
		try {
			String query = "select * from tbl_decision where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				decision = new Decision(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getLong("applicant_id"), rSet.getLong("case_id"), rSet.getInt("respondent_id"), 
						rSet.getString("decision_given"), rSet.getString("notes"), rSet.getString("focus"),rSet.getInt("case_type_id"), rSet.getDate("registration_date"), 
						rSet.getInt("user_id"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return decision;
	}
	
	public static Decision fetchDecisionUsingFileNumber(String fileNumber){
		Decision decision = null;
		try {
			String query = "select * from tbl_decision where file_number = '"+fileNumber.trim()+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				decision = new Decision(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getLong("applicant_id"), rSet.getLong("case_id"), rSet.getInt("respondent_id"), 
						rSet.getString("decision_given"), rSet.getString("notes"), rSet.getString("focus"),rSet.getInt("case_type_id"), rSet.getDate("registration_date"), 
						rSet.getInt("user_id"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return decision;
	}
	
	public static long getMaxDecisionIdNow(){
		long id = 0;
		try{
			String query = "select max(id) as m from tbl_decision";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				id = rSet.getLong("m");
				id++;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return id;
	}
	
	public static long getTotalNumberOfCasesOfThisDecisionTypeDuring(Date fromDate,Date toDate,String decisionGiven){
		long countVal = 0;
		try{
			String query = "select count(*) as cnt from tbl_decision where registration_date between '"+fromDate+"' and '"+toDate+"' and decision_given = '"+
		decisionGiven+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				countVal = rSet.getLong("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return countVal;
	}
	
	public static long getHowManyCasesOfThisDecisionTypeDuringThesePeriodAndBySex(Date fromDate,Date toDate,String sex,String decisionGiven){
		long countVal=0;
		try{
			String query = "select count(*) as cnt from tbl_decision,tbl_case,tbl_applicant where registration_date between '"+
		fromDate+"' and '"+toDate+"' and decision_given = '"+decisionGiven+"' and tbl_decision.case_id = tbl_case.id and tbl_case.applicant_id = tbl_applicant.id and sex = '"+sex+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				countVal = rSet.getLong("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return countVal;
	}
}//end class
