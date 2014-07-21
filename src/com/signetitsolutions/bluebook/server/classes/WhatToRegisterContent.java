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
public class WhatToRegisterContent {
	private long id;
	private long investigationId;
	private String pointToRegister;
	private String registeredContent;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public WhatToRegisterContent() {
	}

	/**
	 * @param investigationId
	 * @param pointToRegister
	 * @param registeredContent
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public WhatToRegisterContent(long investigationId, String pointToRegister,
			String registeredContent, int modifiedBy, Date modificationDate) {
		this.investigationId = investigationId;
		this.pointToRegister = pointToRegister;
		this.registeredContent = registeredContent;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param investigationId
	 * @param pointToRegister
	 * @param registeredContent
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public WhatToRegisterContent(long id, long investigationId,
			String pointToRegister, String registeredContent, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.investigationId = investigationId;
		this.pointToRegister = pointToRegister;
		this.registeredContent = registeredContent;
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
	 * @return the fileNumbe
	 */
	public long getInvestigationId() {
		return investigationId;
	}

	/**
	 * @param fileNumbe
	 *            the fileNumbe to set
	 */
	public void setInvestigationId(long investigationId) {
		this.investigationId = investigationId;
	}

	/**
	 * @return the pointToRegister
	 */
	public String getPointToRegister() {
		return pointToRegister;
	}

	/**
	 * @param pointToRegister
	 *            the pointToRegister to set
	 */
	public void setPointToRegister(String pointToRegister) {
		this.pointToRegister = pointToRegister;
	}

	/**
	 * @return the registeredContent
	 */
	public String getRegisteredContent() {
		return registeredContent;
	}

	/**
	 * @param registeredContent
	 *            the registeredContent to set
	 */
	public void setRegisteredContent(String registeredContent) {
		this.registeredContent = registeredContent;
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
			String sqlStr = "insert into tbl_what_to_register_content values(?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getInvestigationId());
			pStmt.setString(3, this.getPointToRegister());
			pStmt.setString(4, this.getRegisteredContent());
			pStmt.setInt(5, this.getModifiedBy());
			pStmt.setDate(6, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(WhatToRegisterContent whatToRegisterContent) {
		try {
			String sqlStr = "update tbl_what_to_register_content set file_number = ?, point_to_register = ?," +
					"registered_content = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, whatToRegisterContent.getInvestigationId());
			pStmt.setString(2, whatToRegisterContent.getPointToRegister());
			pStmt.setString(3, whatToRegisterContent.getRegisteredContent());
			pStmt.setInt(4, whatToRegisterContent.getModifiedBy());
			pStmt.setDate(5, whatToRegisterContent.getModificationDate());
			pStmt.setLong(6, whatToRegisterContent.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_what_to_register_content where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<WhatToRegisterContent> getAllWhatToRegisterContents() {
		List<WhatToRegisterContent> list = new ArrayList<WhatToRegisterContent>();
		WhatToRegisterContent whatToRegisterContent = null;
		try {
			String query = "select * from tbl_what_to_register_content order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				whatToRegisterContent = new WhatToRegisterContent(rSet.getLong("id"), rSet.getLong("investigation_id"), 
						rSet.getString("point_to_register"), rSet.getString("registered_content"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(whatToRegisterContent);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static WhatToRegisterContent getWhatToRegisterContent(long id) {
		WhatToRegisterContent whatToRegisterContent = null;
		try {
			String query = "select * from tbl_what_to_register_content where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				whatToRegisterContent = new WhatToRegisterContent(rSet.getLong("id"), rSet.getLong("investigation_id"), 
						rSet.getString("point_to_register"), rSet.getString("registered_content"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return whatToRegisterContent;
	}
	
	public static List<WhatToRegisterContent> getAllWhatToRegisterContentsForInvestigation(long investigationId){
		List<WhatToRegisterContent> list = new ArrayList<WhatToRegisterContent>();
		WhatToRegisterContent whatToRegisterContent = null;
		try {
			String query = "select * from tbl_what_to_register_content where investigation_id = "+investigationId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				whatToRegisterContent = new WhatToRegisterContent(rSet.getLong("id"), rSet.getLong("investigation_id"), 
						rSet.getString("point_to_register"), rSet.getString("registered_content"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(whatToRegisterContent);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static WhatToRegisterContent getWhatToRegisterContentsForThisInvestigation(long investigationId){
		WhatToRegisterContent whatToRegisterContent = null;
		try {
			String query = "select * from tbl_what_to_register_content where investigation_id = "+investigationId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				whatToRegisterContent = new WhatToRegisterContent(rSet.getLong("id"), rSet.getLong("investigation_id"), 
						rSet.getString("point_to_register"), rSet.getString("registered_content"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return whatToRegisterContent;
	}
}// end class
