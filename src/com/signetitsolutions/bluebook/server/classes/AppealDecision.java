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
public class AppealDecision {
	private long id;
	private String fileNumber;
	private int appealDecisionId;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public AppealDecision() {
	}

	/**
	 * @param fileNumber
	 * @param appealDecisionId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public AppealDecision(String fileNumber, int appealDecisionId,
			int modifiedBy, Date modificationDate) {
		this.fileNumber = fileNumber;
		this.appealDecisionId = appealDecisionId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param fileNumber
	 * @param appealDecisionId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public AppealDecision(long id, String fileNumber, int appealDecisionId,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.fileNumber = fileNumber;
		this.appealDecisionId = appealDecisionId;
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
	 * @return the appealDecisionId
	 */
	public int getAppealDecisionId() {
		return appealDecisionId;
	}

	/**
	 * @param appealDecisionId
	 *            the appealDecisionId to set
	 */
	public void setAppealDecisionId(int appealDecisionId) {
		this.appealDecisionId = appealDecisionId;
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
			String sqlStr = "insert into tbl_appeal_decision values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getFileNumber());
			pStmt.setInt(3, this.getAppealDecisionId());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(AppealDecision appealDecision) {
		try {
			String sqlStr = "update tbl_appeal_decision set file_number = ?, appeal_decision_id = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, appealDecision.getFileNumber());
			pStmt.setInt(2, appealDecision.getAppealDecisionId());
			pStmt.setInt(3, appealDecision.getModifiedBy());
			pStmt.setDate(4, appealDecision.getModificationDate());
			pStmt.setLong(5, appealDecision.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_appeal_decision where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<AppealDecision> getAllAppealDecisions() {
		List<AppealDecision> list = new ArrayList<AppealDecision>();
		AppealDecision appealDecision = null;
		try {
			String query = "select * from tbl_appeal_decision order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appealDecision = new AppealDecision(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getInt("appeal_decision_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(appealDecision);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static AppealDecision getAppealDecision(long id) {
		AppealDecision appealDecision = null;
		try {
			String query = "select * from tbl_appeal_decision where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appealDecision = new AppealDecision(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getInt("appeal_decision_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return appealDecision;
	}
	
	public static List<AppealDecision> getAllAppealDecisionsForFileNumber(String fileNumber){
		List<AppealDecision> list = new ArrayList<AppealDecision>();
		AppealDecision appealDecision = null;
		try {
			String query = "select * from tbl_appeal_decision where file_number = '"+fileNumber+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appealDecision = new AppealDecision(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getInt("appeal_decision_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(appealDecision);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
