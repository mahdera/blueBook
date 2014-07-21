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
public class InvestigatorUserMap {
	private int id;
	private int investigatorId;
	private int userId;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public InvestigatorUserMap() {
	}

	/**
	 * @param investigatorId
	 * @param userId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public InvestigatorUserMap(int investigatorId, int userId, int modifiedBy,
			Date modificationDate) {
		this.investigatorId = investigatorId;
		this.userId = userId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param investigatorId
	 * @param userId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public InvestigatorUserMap(int id, int investigatorId, int userId,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.investigatorId = investigatorId;
		this.userId = userId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the investigatorId
	 */
	public int getInvestigatorId() {
		return investigatorId;
	}

	/**
	 * @param investigatorId
	 *            the investigatorId to set
	 */
	public void setInvestigatorId(int investigatorId) {
		this.investigatorId = investigatorId;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
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
			String sqlStr = "insert into tbl_investigator_user_map values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getInvestigatorId());
			pStmt.setInt(3, this.getUserId());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(InvestigatorUserMap investigatorUserMap) {
		try {
			String sqlStr = "update tbl_investigator_user_map set investigator_id = ?, user_id = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, investigatorUserMap.getInvestigatorId());
			pStmt.setInt(2, investigatorUserMap.getUserId());
			pStmt.setInt(3, investigatorUserMap.getModifiedBy());
			pStmt.setDate(4, investigatorUserMap.getModificationDate());
			pStmt.setInt(5, investigatorUserMap.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_investigator_user_map where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<InvestigatorUserMap> getAllInvestigatorUserMaps() {
		List<InvestigatorUserMap> list = new ArrayList<InvestigatorUserMap>();
		InvestigatorUserMap investigatorUserMap = null;
		try {
			String query = "select * from tbl_investigator_user_map order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorUserMap = new InvestigatorUserMap(rSet.getInt("id"), rSet.getInt("investigator_id"), 
						rSet.getInt("user_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(investigatorUserMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static InvestigatorUserMap getInvestigatorUserMap(int id) {
		InvestigatorUserMap investigatorUserMap = null;
		try {
			String query = "select * from tbl_investigator_user_map where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorUserMap = new InvestigatorUserMap(rSet.getInt("id"), rSet.getInt("investigator_id"), 
						rSet.getInt("user_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigatorUserMap;
	}
	
	public static InvestigatorUserMap getInvestigatorUserMapForInvestigator(int investigatorId){
		InvestigatorUserMap investigatorUserMap = null;
		try {
			String query = "select * from tbl_investigator_user_map where investigator_id = "+investigatorId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorUserMap = new InvestigatorUserMap(rSet.getInt("id"), rSet.getInt("investigator_id"), 
						rSet.getInt("user_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigatorUserMap;
	}
	
	public static InvestigatorUserMap getInvestigatorUserMapForUser(int userId){
		InvestigatorUserMap investigatorUserMap = null;
		try {
			String query = "select * from tbl_investigator_user_map where user_id = "+userId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorUserMap = new InvestigatorUserMap(rSet.getInt("id"), rSet.getInt("investigator_id"), 
						rSet.getInt("user_id"), rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigatorUserMap;
	}
}// end class
