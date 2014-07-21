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
public class Followup {
	private long id;
	private String fileNumber;
	private String decisionMainPoint;
	private Date deadline;
	private String whatToRecord;
	private int fileStatusId;
	private String nextAction;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public Followup() {
	}

	/**
	 * @param fileNumber
	 * @param decisionMainPoint
	 * @param deadline
	 * @param whatToRecord
	 * @param fileStatusId
	 * @param nextAction
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Followup(String fileNumber, String decisionMainPoint, Date deadline,
			String whatToRecord, int fileStatusId, String nextAction,
			int modifiedBy, Date modificationDate) {
		this.fileNumber = fileNumber;
		this.decisionMainPoint = decisionMainPoint;
		this.deadline = deadline;
		this.whatToRecord = whatToRecord;
		this.fileStatusId = fileStatusId;
		this.nextAction = nextAction;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param fileNumber
	 * @param decisionMainPoint
	 * @param deadline
	 * @param whatToRecord
	 * @param fileStatusId
	 * @param nextAction
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Followup(long id, String fileNumber, String decisionMainPoint,
			Date deadline, String whatToRecord, int fileStatusId,
			String nextAction, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.fileNumber = fileNumber;
		this.decisionMainPoint = decisionMainPoint;
		this.deadline = deadline;
		this.whatToRecord = whatToRecord;
		this.fileStatusId = fileStatusId;
		this.nextAction = nextAction;
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
	 * @return the decisionMainPoint
	 */
	public String getDecisionMainPoint() {
		return decisionMainPoint;
	}

	/**
	 * @param decisionMainPoint
	 *            the decisionMainPoint to set
	 */
	public void setDecisionMainPoint(String decisionMainPoint) {
		this.decisionMainPoint = decisionMainPoint;
	}

	/**
	 * @return the deadline
	 */
	public Date getDeadline() {
		return deadline;
	}

	/**
	 * @param deadline
	 *            the deadline to set
	 */
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	/**
	 * @return the whatToRecord
	 */
	public String getWhatToRecord() {
		return whatToRecord;
	}

	/**
	 * @param whatToRecord
	 *            the whatToRecord to set
	 */
	public void setWhatToRecord(String whatToRecord) {
		this.whatToRecord = whatToRecord;
	}

	/**
	 * @return the fileStatusId
	 */
	public int getFileStatusId() {
		return fileStatusId;
	}

	/**
	 * @param fileStatusId
	 *            the fileStatusId to set
	 */
	public void setFileStatusId(int fileStatusId) {
		this.fileStatusId = fileStatusId;
	}

	/**
	 * @return the nextAction
	 */
	public String getNextAction() {
		return nextAction;
	}

	/**
	 * @param nextAction
	 *            the nextAction to set
	 */
	public void setNextAction(String nextAction) {
		this.nextAction = nextAction;
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
			String sqlStr = "insert into tbl_followup values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getFileNumber());
			pStmt.setString(3, this.getDecisionMainPoint());
			pStmt.setDate(4, this.getDeadline());
			pStmt.setString(5, this.getWhatToRecord());
			pStmt.setInt(6, this.getFileStatusId());
			pStmt.setString(7, this.getNextAction());
			pStmt.setInt(8, this.getModifiedBy());
			pStmt.setDate(9, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Followup followup) {
		try {
			String sqlStr = "update tbl_followup set file_number = ?, decision_main_point = ?," +
					"deadline = ?, what_to_record = ?, file_status_id = ?, next_action = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, followup.getFileNumber());
			pStmt.setString(2, followup.getDecisionMainPoint());
			pStmt.setDate(3, followup.getDeadline());
			pStmt.setString(4, followup.getWhatToRecord());
			pStmt.setInt(5, followup.getFileStatusId());
			pStmt.setString(6, followup.getNextAction());
			pStmt.setInt(7, followup.getModifiedBy());
			pStmt.setDate(8, followup.getModificationDate());
			pStmt.setLong(9, followup.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_followup where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Followup> getAllFollowups() {
		List<Followup> list = new ArrayList<Followup>();
		Followup followup = null;
		try {
			String query = "select * from tbl_followup order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				followup = new Followup(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("decision_main_point"), rSet.getDate("deadline"), 
						rSet.getString("what_to_record"), rSet.getInt("file_status_id"), 
						rSet.getString("next_action"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));
				list.add(followup);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Followup getFollowup(long id) {
		Followup followup = null;
		try {
			String query = "select * from tbl_followup where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				followup = new Followup(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("decision_main_point"), rSet.getDate("deadline"), 
						rSet.getString("what_to_record"), rSet.getInt("file_status_id"), 
						rSet.getString("next_action"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return followup;
	}
	
	public static Followup getFollowupObjectUsing(String fileNumber, String whatToRecord, int fileStatusId,
			int modifiedBy, Date modificationDate){
		Followup followup = null;
		try {
			String query = "select * from tbl_followup where file_number = '"+fileNumber+
					"' and what_to_record = '"+whatToRecord+"' and file_status_id = "+fileStatusId+
					" and modified_by = "+modifiedBy+" and modification_date = '"+modificationDate+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				followup = new Followup(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("decision_main_point"), rSet.getDate("deadline"), 
						rSet.getString("what_to_record"), rSet.getInt("file_status_id"), 
						rSet.getString("next_action"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return followup;
	}
	
	public static List<Followup> getAllFollowupsForFileNumber(String fileNumber){
		List<Followup> list = new ArrayList<Followup>();
		Followup followup = null;
		try {
			String query = "select * from tbl_followup where file_number = '"+fileNumber+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				followup = new Followup(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("decision_main_point"), rSet.getDate("deadline"), 
						rSet.getString("what_to_record"), rSet.getInt("file_status_id"), 
						rSet.getString("next_action"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));
				list.add(followup);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
