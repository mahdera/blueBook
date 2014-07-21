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
public class RejectionReason {
	private long id;
	private long decisionId;
	private int rejectionReasonId;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public RejectionReason() {
	}

	

	/**
	 * @param decisionId
	 * @param rejectionReasonId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public RejectionReason(long decisionId, int rejectionReasonId,
			int modifiedBy, Date modificationDate) {
		this.decisionId = decisionId;
		this.rejectionReasonId = rejectionReasonId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	

	/**
	 * @param id
	 * @param decisionId
	 * @param rejectionReasonId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public RejectionReason(long id, long decisionId, int rejectionReasonId,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.decisionId = decisionId;
		this.rejectionReasonId = rejectionReasonId;
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
	 * @return the decisionId
	 */
	public long getDecisionId() {
		return decisionId;
	}



	/**
	 * @param decisionId the decisionId to set
	 */
	public void setDecisionId(long decisionId) {
		this.decisionId = decisionId;
	}



	/**
	 * @return the rejectionReasonId
	 */
	public int getRejectionReasonId() {
		return rejectionReasonId;
	}



	/**
	 * @param rejectionReasonId the rejectionReasonId to set
	 */
	public void setRejectionReasonId(int rejectionReasonId) {
		this.rejectionReasonId = rejectionReasonId;
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



	public void save() {
		try {
			String sqlStr = "insert into tbl_rejection_reason values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getDecisionId());
			pStmt.setInt(3, this.getRejectionReasonId());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(RejectionReason rejectionReason) {
		try {
			String sqlStr = "update tbl_rejection_reason set decision_id = ?, rejection_reason_id = ?, " +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, rejectionReason.getId());
			pStmt.setInt(2, rejectionReason.getRejectionReasonId());
			pStmt.setInt(3, rejectionReason.getModifiedBy());
			pStmt.setDate(4, rejectionReason.getModificationDate());
			pStmt.setLong(5, rejectionReason.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_rejection_reason where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<RejectionReason> getAllRejectionReasons() {
		List<RejectionReason> list = new ArrayList<RejectionReason>();
		RejectionReason rejectionReason = null;
		try {
			String query = "select * from tbl_rejection_reason order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				rejectionReason = new RejectionReason(rSet.getLong("id"), rSet.getLong("decision_id"), 
						rSet.getInt("rejection_reason_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(rejectionReason);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static RejectionReason getRejectionReason(long id) {
		RejectionReason rejectionReason = null;
		try {
			String query = "select * from tbl_rejection_reason where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				rejectionReason = new RejectionReason(rSet.getLong("id"), rSet.getLong("decision_id"), 
						rSet.getInt("rejection_reason_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return rejectionReason;
	}
	
	public static RejectionReason getRejectionReasonForDecision(long decisionId){
		RejectionReason rejectionReason = null;
		try {
			String query = "select * from tbl_rejection_reason where decision_id = "+decisionId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				rejectionReason = new RejectionReason(rSet.getLong("id"), rSet.getLong("decision_id"), 
						rSet.getInt("rejection_reason_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return rejectionReason;
	}
}// end class
