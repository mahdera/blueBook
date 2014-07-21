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
public class Agreement {
	private long id;
	private String fileNumber;
	private String investigatorSuggestion;
	private String applicantPosition;
	private String respondentPosition;
	private String agreementText;
	private Date agreementDate;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public Agreement() {
	}

	/**
	 * @param fileNumber
	 * @param investigatorSuggestion
	 * @param applicantPosition
	 * @param respondentPosition
	 * @param agreementText
	 * @param agreementDate
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Agreement(String fileNumber, String investigatorSuggestion,
			String applicantPosition, String respondentPosition,
			String agreementText, Date agreementDate, int modifiedBy,
			Date modificationDate) {
		this.fileNumber = fileNumber;
		this.investigatorSuggestion = investigatorSuggestion;
		this.applicantPosition = applicantPosition;
		this.respondentPosition = respondentPosition;
		this.agreementText = agreementText;
		this.agreementDate = agreementDate;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param fileNumber
	 * @param investigatorSuggestion
	 * @param applicantPosition
	 * @param respondentPosition
	 * @param agreementText
	 * @param agreementDate
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Agreement(long id, String fileNumber, String investigatorSuggestion,
			String applicantPosition, String respondentPosition,
			String agreementText, Date agreementDate, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.fileNumber = fileNumber;
		this.investigatorSuggestion = investigatorSuggestion;
		this.applicantPosition = applicantPosition;
		this.respondentPosition = respondentPosition;
		this.agreementText = agreementText;
		this.agreementDate = agreementDate;
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
	 * @param id
	 *            the id to set
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
	 * @param fileNumber
	 *            the fileNumber to set
	 */
	public void setFileNumber(String fileNumber) {
		this.fileNumber = fileNumber;
	}

	/**
	 * @return the investigatorSuggestion
	 */
	public String getInvestigatorSuggestion() {
		return investigatorSuggestion;
	}

	/**
	 * @param investigatorSuggestion
	 *            the investigatorSuggestion to set
	 */
	public void setInvestigatorSuggestion(String investigatorSuggestion) {
		this.investigatorSuggestion = investigatorSuggestion;
	}

	/**
	 * @return the applicantPosition
	 */
	public String getApplicantPosition() {
		return applicantPosition;
	}

	/**
	 * @param applicantPosition
	 *            the applicantPosition to set
	 */
	public void setApplicantPosition(String applicantPosition) {
		this.applicantPosition = applicantPosition;
	}

	/**
	 * @return the respondentPosition
	 */
	public String getRespondentPosition() {
		return respondentPosition;
	}

	/**
	 * @param respondentPosition
	 *            the respondentPosition to set
	 */
	public void setRespondentPosition(String respondentPosition) {
		this.respondentPosition = respondentPosition;
	}

	/**
	 * @return the agreementText
	 */
	public String getAgreementText() {
		return agreementText;
	}

	/**
	 * @param agreementText
	 *            the agreementText to set
	 */
	public void setAgreementText(String agreementText) {
		this.agreementText = agreementText;
	}

	/**
	 * @return the agreementDate
	 */
	public Date getAgreementDate() {
		return agreementDate;
	}

	/**
	 * @param agreementDate
	 *            the agreementDate to set
	 */
	public void setAgreementDate(Date agreementDate) {
		this.agreementDate = agreementDate;
	}

	/**
	 * @return the modifiedBy
	 */
	public int getModifiedBy() {
		return modifiedBy;
	}

	/**
	 * @param modifiedBy
	 *            the modifiedBy to set
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
	 * @param modificationDate
	 *            the modificationDate to set
	 */
	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_agreement values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getFileNumber());
			pStmt.setString(3, this.getInvestigatorSuggestion());
			pStmt.setString(4, this.getApplicantPosition());
			pStmt.setString(5, this.getRespondentPosition());
			pStmt.setString(6, this.getAgreementText());
			pStmt.setDate(7, this.getAgreementDate());
			pStmt.setInt(8, this.getModifiedBy());
			pStmt.setDate(9, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Agreement agreement) {
		try {
			String sqlStr = "update tbl_agreement set file_number = ?, investigator_suggestion = ?," +
					"applicant_position = ?, respondent_position = ?, agreement_text = ?, agreement_date = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, agreement.getFileNumber());
			pStmt.setString(2, agreement.getInvestigatorSuggestion());
			pStmt.setString(3, agreement.getApplicantPosition());
			pStmt.setString(4, agreement.getRespondentPosition());
			pStmt.setString(5, agreement.getAgreementText());
			pStmt.setDate(6, agreement.getAgreementDate());
			pStmt.setInt(7, agreement.getModifiedBy());
			pStmt.setDate(8, agreement.getModificationDate());
			pStmt.setLong(9, agreement.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_agreement where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Agreement> getAllAgreements() {
		List<Agreement> list = new ArrayList<Agreement>();
		Agreement agreement = null;
		try {
			String query = "select * from tbl_agreement order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				agreement = new Agreement(rSet.getLong("id"),rSet.getString("file_number"),
						rSet.getString("investigator_suggestion"),rSet.getString("applicant_position"),
						rSet.getString("respondent_position"),rSet.getString("agreement_text"),
						rSet.getDate("agreement_date"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(agreement);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Agreement> getAllAgreementsModifiedBy(int userId){
		List<Agreement> list = new ArrayList<Agreement>();
		Agreement agreement = null;
		try {
			String query = "select * from tbl_agreement where modified_by = "+userId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				agreement = new Agreement(rSet.getLong("id"),rSet.getString("file_number"),
						rSet.getString("investigator_suggestion"),rSet.getString("applicant_position"),
						rSet.getString("respondent_position"),rSet.getString("agreement_text"),
						rSet.getDate("agreement_date"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(agreement);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Agreement getAgreement(long id) {
		Agreement agreement = null;
		try {
			String query = "select * from tbl_agreement where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				agreement = new Agreement(rSet.getLong("id"),rSet.getString("file_number"),
						rSet.getString("investigator_suggestion"),rSet.getString("applicant_position"),
						rSet.getString("respondent_position"),rSet.getString("agreement_text"),
						rSet.getDate("agreement_date"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return agreement;
	}
}// end class
