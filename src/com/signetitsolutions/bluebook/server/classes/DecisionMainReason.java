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
public class DecisionMainReason {
	private long id;
	private long decisionId;
	private String mainReason;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * @param decisionId
	 * @param mainReason
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public DecisionMainReason(long decisionId, String mainReason,int modifiedBy,
			Date modificationDate) {
		this.decisionId = decisionId;
		this.mainReason = mainReason;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param decisionId
	 * @param mainReason
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public DecisionMainReason(long id, long decisionId, String mainReason,
			int modifiedBy,Date modificationDate) {
		this.id = id;
		this.decisionId = decisionId;
		this.mainReason = mainReason;
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
	 * @return the mainReason
	 */
	public String getMainReason() {
		return mainReason;
	}
	/**
	 * @param mainReason the mainReason to set
	 */
	public void setMainReason(String mainReason) {
		this.mainReason = mainReason;
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
			String sqlStr = "insert into tbl_decision_main_reason values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getDecisionId());
			pStmt.setString(3, this.getMainReason());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(DecisionMainReason decisionMainReason){
		try {
			String sqlStr = "update tbl_decision_main_reason set decision_id = ?, main_reason = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, decisionMainReason.getDecisionId());
			pStmt.setString(2, decisionMainReason.getMainReason());
			pStmt.setInt(3, decisionMainReason.getModifiedBy());
			pStmt.setDate(4, decisionMainReason.getModificationDate());
			pStmt.setLong(5, decisionMainReason.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long id){
		try {
			String sqlStr = "delete from tbl_decision_main_reason where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<DecisionMainReason> getallDecisionMainReasons(){
		List<DecisionMainReason> list = new ArrayList<DecisionMainReason>();
		DecisionMainReason decisionMainReason = null;
		try {
			String query = "select * from tbl_decision_main_reason";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				decisionMainReason = new DecisionMainReason(rSet.getLong("id"), rSet.getLong("decision_id"), rSet.getString("main_reason"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(decisionMainReason);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static DecisionMainReason getDecisionMainReason(long id){
		DecisionMainReason decisionMainReason = null;
		try {
			String query = "select * from tbl_decision_main_reason where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				decisionMainReason = new DecisionMainReason(rSet.getLong("id"), rSet.getLong("decision_id"), rSet.getString("main_reason"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return decisionMainReason;
	}
}//end class
