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
public class Appeal {
	private long id;
	private String fileNumber;
	private String appealReason;
	private Date registrationDate;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public Appeal() {
	}

	/**
	 * @param fileNumber
	 * @param appealReason
	 * @param registrationDate
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Appeal(String fileNumber, String appealReason,
			Date registrationDate, int modifiedBy, Date modificationDate) {
		this.fileNumber = fileNumber;
		this.appealReason = appealReason;
		this.registrationDate = registrationDate;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param fileNumber
	 * @param appealReason
	 * @param registrationDate
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Appeal(long id, String fileNumber, String appealReason,
			Date registrationDate, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.fileNumber = fileNumber;
		this.appealReason = appealReason;
		this.registrationDate = registrationDate;
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
	 * @return the appealReason
	 */
	public String getAppealReason() {
		return appealReason;
	}

	/**
	 * @param appealReason
	 *            the appealReason to set
	 */
	public void setAppealReason(String appealReason) {
		this.appealReason = appealReason;
	}

	/**
	 * @return the registrationDate
	 */
	public Date getRegistrationDate() {
		return registrationDate;
	}

	/**
	 * @param registrationDate
	 *            the registrationDate to set
	 */
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
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
			String sqlStr = "insert into tbl_appeal values(?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getFileNumber());
			pStmt.setString(3, this.getAppealReason());
			pStmt.setDate(4, this.getRegistrationDate());
			pStmt.setInt(5, this.getModifiedBy());
			pStmt.setDate(6, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Appeal appeal) {
		try {
			String sqlStr = "update tbl_appeal set file_number = ?, appeal_reason = ?," +
					"registration_date = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, appeal.getFileNumber());
			pStmt.setString(2, appeal.getAppealReason());
			pStmt.setDate(3, appeal.getRegistrationDate());
			pStmt.setInt(4, appeal.getModifiedBy());
			pStmt.setDate(5, appeal.getModificationDate());
			pStmt.setLong(6, appeal.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_appeal where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Appeal> getAllAppeals() {
		List<Appeal> list = new ArrayList<Appeal>();
		Appeal appeal = null;
		try {
			String query = "select * from tbl_appeal order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appeal = new Appeal(rSet.getLong("id"),rSet.getString("file_number"),
						rSet.getString("appeal_reason"),rSet.getDate("registration_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(appeal);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Appeal getAppeal(long id) {
		Appeal appeal = null;
		try {
			String query = "select * from tbl_appeal where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appeal = new Appeal(rSet.getLong("id"),rSet.getString("file_number"),
						rSet.getString("appeal_reason"),rSet.getDate("registration_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return appeal;
	}
	
	public static List<Appeal> getAllAppealsForFileNumber(String fileNumber){
		List<Appeal> list = new ArrayList<Appeal>();
		Appeal appeal = null;
		try{
			String query = "select * from tbl_appeal where file_number = '"+fileNumber+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appeal = new Appeal(rSet.getLong("id"),rSet.getString("file_number"),
						rSet.getString("appeal_reason"),rSet.getDate("registration_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(appeal);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
