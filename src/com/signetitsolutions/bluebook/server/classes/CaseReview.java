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
public class CaseReview {
	private long id;
	private long applicantId;
	private long caseId;
	private int respondentId;
	private String caseTheme;
	private boolean investigationRequired;
	private String reason;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * @param applicantId
	 * @param caseId
	 * @param respondentId
	 * @param caseTheme
	 * @param investigationRequired
	 * @param reason
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public CaseReview(long applicantId, long caseId, int respondentId,
			String caseTheme, boolean investigationRequired, String reason,
			int modifiedBy,Date modificationDate) {
		this.applicantId = applicantId;
		this.caseId = caseId;
		this.respondentId = respondentId;
		this.caseTheme = caseTheme;
		this.investigationRequired = investigationRequired;
		this.reason = reason;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param applicantId
	 * @param caseId
	 * @param respondentId
	 * @param caseTheme
	 * @param investigationRequired
	 * @param reason
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public CaseReview(long id, long applicantId, long caseId, int respondentId,
			String caseTheme, boolean investigationRequired, String reason,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.applicantId = applicantId;
		this.caseId = caseId;
		this.respondentId = respondentId;
		this.caseTheme = caseTheme;
		this.investigationRequired = investigationRequired;
		this.reason = reason;
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
	 * @return the caseTheme
	 */
	public String getCaseTheme() {
		return caseTheme;
	}
	/**
	 * @param caseTheme the caseTheme to set
	 */
	public void setCaseTheme(String caseTheme) {
		this.caseTheme = caseTheme;
	}
	/**
	 * @return the investigationRequired
	 */
	public boolean isInvestigationRequired() {
		return investigationRequired;
	}
	/**
	 * @param investigationRequired the investigationRequired to set
	 */
	public void setInvestigationRequired(boolean investigationRequired) {
		this.investigationRequired = investigationRequired;
	}
	/**
	 * @return the reason
	 */
	public String getReason() {
		return reason;
	}
	/**
	 * @param reason the reason to set
	 */
	public void setReason(String reason) {
		this.reason = reason;
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
			String sqlStr = "insert into tbl_case_review values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getApplicantId());
			pStmt.setLong(3, this.getCaseId());
			pStmt.setInt(4, this.getRespondentId());
			pStmt.setString(5, this.getCaseTheme());
			pStmt.setBoolean(6, this.isInvestigationRequired());
			pStmt.setString(7, this.getReason());
			pStmt.setInt(8, this.getModifiedBy());
			pStmt.setDate(9, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(CaseReview caseReview){
		try {
			String sqlStr = "update tbl_case_review set applicant_id = ?, case_id = ?, respondent_id = ?," +
					"case_theme = ?, investigation_required = ?, reason = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, caseReview.getApplicantId());
			pStmt.setLong(2, caseReview.getCaseId());
			pStmt.setInt(3, caseReview.getRespondentId());
			pStmt.setString(4, caseReview.getCaseTheme());
			pStmt.setBoolean(5, caseReview.isInvestigationRequired());
			pStmt.setString(6, caseReview.getReason());
			pStmt.setInt(7, caseReview.getModifiedBy());
			pStmt.setDate(8, caseReview.getModificationDate());
			pStmt.setLong(9, caseReview.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {

		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long id){
		try {
			String sqlStr = "delete from tbl_case_review where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<CaseReview> getAllCaseReviewsForThisApplicant(long applicantId){
		List<CaseReview> list = new ArrayList<CaseReview>();
		CaseReview caseReview = null;
		try {
			String query = "select * from tbl_case_review where applicant_id = "+applicantId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				caseReview = new CaseReview(rSet.getLong("id"), rSet.getLong("applicant_id"), 
						rSet.getLong("case_id"), rSet.getInt("respondent_id"), rSet.getString("case_theme"), 
						rSet.getBoolean("investigation_required"), rSet.getString("reason"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(caseReview);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<CaseReview> getAllCaseReviews(){
		List<CaseReview> list = new ArrayList<CaseReview>();
		CaseReview caseReview = null;
		try {
			String query = "select * from tbl_case_review";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				caseReview = new CaseReview(rSet.getLong("id"), rSet.getLong("applicant_id"), 
						rSet.getLong("case_id"), rSet.getInt("respondent_id"), rSet.getString("case_theme"), 
						rSet.getBoolean("investigation_required"), rSet.getString("reason"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(caseReview);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static CaseReview getCaseReview(long id){
		CaseReview caseReview = null;
		try {
			String query = "select * from tbl_case_review where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				caseReview = new CaseReview(rSet.getLong("id"), rSet.getLong("applicant_id"), 
						rSet.getLong("case_id"), rSet.getInt("respondent_id"), rSet.getString("case_theme"), 
						rSet.getBoolean("investigation_required"), rSet.getString("reason"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return caseReview;
	}
}//end class
