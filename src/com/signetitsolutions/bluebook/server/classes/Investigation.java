/**
 * 
 */
package com.signetitsolutions.bluebook.server.classes;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 * 
 */
public class Investigation {
	private long id;
	private String fileNumber;
	private String whatToRegister;
	private int caseStatusId;
	private String nextActionAndDate;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public Investigation() {
	}

	/**
	 * @param fileNumber
	 * @param whatToRegister
	 * @param caseStatusId
	 * @param nextActionAndDate
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Investigation(String fileNumber, String whatToRegister,
			int caseStatusId, String nextActionAndDate, int modifiedBy,
			Date modificationDate) {
		this.fileNumber = fileNumber;
		this.whatToRegister = whatToRegister;
		this.caseStatusId = caseStatusId;
		this.nextActionAndDate = nextActionAndDate;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param fileNumber
	 * @param whatToRegister
	 * @param caseStatusId
	 * @param nextActionAndDate
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Investigation(long id, String fileNumber, String whatToRegister,
			int caseStatusId, String nextActionAndDate, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.fileNumber = fileNumber;
		this.whatToRegister = whatToRegister;
		this.caseStatusId = caseStatusId;
		this.nextActionAndDate = nextActionAndDate;
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
	 * @return the whatToRegister
	 */
	public String getWhatToRegister() {
		return whatToRegister;
	}

	/**
	 * @param whatToRegister
	 *            the whatToRegister to set
	 */
	public void setWhatToRegister(String whatToRegister) {
		this.whatToRegister = whatToRegister;
	}

	/**
	 * @return the caseStatusId
	 */
	public int getCaseStatusId() {
		return caseStatusId;
	}

	/**
	 * @param caseStatusId
	 *            the caseStatusId to set
	 */
	public void setCaseStatusId(int caseStatusId) {
		this.caseStatusId = caseStatusId;
	}

	/**
	 * @return the nextActionAndDate
	 */
	public String getNextActionAndDate() {
		return nextActionAndDate;
	}

	/**
	 * @param nextActionAndDate
	 *            the nextActionAndDate to set
	 */
	public void setNextActionAndDate(String nextActionAndDate) {
		this.nextActionAndDate = nextActionAndDate;
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
			String sqlStr = "insert into tbl_investigation values(?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getFileNumber());
			pStmt.setString(3, this.getWhatToRegister());
			pStmt.setInt(4, this.getCaseStatusId());
			pStmt.setString(5, this.getNextActionAndDate());
			pStmt.setInt(6, this.getModifiedBy());
			pStmt.setDate(7, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Investigation investigation) {
		try {
			String sqlStr = "update tbl_investigation set file_number = ?, what_to_register = ?," +
					"case_status_id = ?, next_action_and_date = ?, modified_by = ?, modification_date = ?" +
					" where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, investigation.getFileNumber());
			pStmt.setString(2, investigation.getWhatToRegister());
			pStmt.setInt(3, investigation.getCaseStatusId());
			pStmt.setString(4, investigation.getNextActionAndDate());
			pStmt.setInt(5, investigation.getModifiedBy());
			pStmt.setDate(6, investigation.getModificationDate());
			pStmt.setLong(7, investigation.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_investigation where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);			
			DBConnection.writeToDatabase(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Investigation> getAllInvestigations() {
		List<Investigation> list = new ArrayList<Investigation>();
		Investigation investigation = null;
		try {
			String query = "select * from tbl_investigation order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigation = new Investigation(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("what_to_register"), rSet.getInt("case_status_id"), 
						rSet.getString("next_action_and_date"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));
				list.add(investigation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Investigation getInvestigation(long id) {
		Investigation investigation = null;
		try {
			String query = "select * from tbl_investigation where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigation = new Investigation(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("what_to_register"), rSet.getInt("case_status_id"), 
						rSet.getString("next_action_and_date"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigation;
	}
	
	public static Investigation getInvestigationObjectUsing(String fileNumber,String whatToRegister,int fileStatusId,
			int modifiedBy, Date modificationDate){
		Investigation investigation = null;
		try {
			String query = "select * from tbl_investigation where file_number = '"+fileNumber+"' and what_to_register = '"+
		whatToRegister+"' and case_status_id = "+fileStatusId+" and modified_by = "+modifiedBy+" and "+
					"modification_date = '"+modificationDate+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigation = new Investigation(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("what_to_register"), rSet.getInt("case_status_id"), 
						rSet.getString("next_action_and_date"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigation;
	}
	
	public static List<Investigation> getAllInvestigationsForFileNumber(String fileNumber){
		List<Investigation> list = new ArrayList<Investigation>();
		Investigation investigation = null;
		try {
			String query = "select * from tbl_investigation where file_number = '"+fileNumber+"' order by id desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigation = new Investigation(rSet.getLong("id"), rSet.getString("file_number"), 
						rSet.getString("what_to_register"), rSet.getInt("case_status_id"), 
						rSet.getString("next_action_and_date"), rSet.getInt("modified_by"), 
						rSet.getDate("modification_date"));
				list.add(investigation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
