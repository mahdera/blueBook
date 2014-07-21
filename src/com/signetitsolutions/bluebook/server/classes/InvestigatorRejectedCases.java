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
public class InvestigatorRejectedCases {
	private long id;
	private String fileNumber;
	private String rejectionReason;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public InvestigatorRejectedCases() {
	}

	/**
	 * @param fileNumber
	 * @param rejectionReason
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public InvestigatorRejectedCases(String fileNumber, String rejectionReason,
			int modifiedBy, Date modificationDate) {
		this.fileNumber = fileNumber;
		this.rejectionReason = rejectionReason;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param fileNumber
	 * @param rejectionReason
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public InvestigatorRejectedCases(long id, String fileNumber,
			String rejectionReason, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.fileNumber = fileNumber;
		this.rejectionReason = rejectionReason;
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
	 * @return the rejectionReason
	 */
	public String getRejectionReason() {
		return rejectionReason;
	}

	/**
	 * @param rejectionReason
	 *            the rejectionReason to set
	 */
	public void setRejectionReason(String rejectionReason) {
		this.rejectionReason = rejectionReason;
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
			String sqlStr = "insert into tbl_investigator_rejected_cases values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getFileNumber());
			pStmt.setString(3, this.getRejectionReason());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(InvestigatorRejectedCases investigatorRejectedCases) {
		try {
			String sqlStr = "update tbl_investigator_rejected_cases set file_number = ?, rejection_reason = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, investigatorRejectedCases.getFileNumber());
			pStmt.setString(2, investigatorRejectedCases.getRejectionReason());
			pStmt.setInt(3, investigatorRejectedCases.getModifiedBy());
			pStmt.setDate(4, investigatorRejectedCases.getModificationDate());
			pStmt.setLong(5, investigatorRejectedCases.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_investigator_rejected_cases where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<InvestigatorRejectedCases> getAllInvestigatorRejectedCases() {
		List<InvestigatorRejectedCases> list = new ArrayList<InvestigatorRejectedCases>();
		InvestigatorRejectedCases investigatorRejectedCases = null;
		try {
			String query = "select * from tbl_investigator_rejected_cases order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorRejectedCases = new InvestigatorRejectedCases(rSet.getLong("id"), 
						rSet.getString("file_number"), rSet.getString("rejection_reason"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(investigatorRejectedCases);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static InvestigatorRejectedCases getInvestigatorRejectedCases(long id) {
		InvestigatorRejectedCases investigatorRejectedCases = null;
		try {
			String query = "select * from tbl_investigator_rejected_cases where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorRejectedCases = new InvestigatorRejectedCases(rSet.getLong("id"), 
						rSet.getString("file_number"), rSet.getString("rejection_reason"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigatorRejectedCases;
	}
}// end class
