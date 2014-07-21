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
public class WhatToRecordContent {
	private long id;
	private long followupId;
	private String pointToRecord;
	private String recordedContent;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public WhatToRecordContent() {
	}

	/**
	 * @param followupId
	 * @param pointToRecord
	 * @param recordedContent
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public WhatToRecordContent(long followupId, String pointToRecord,
			String recordedContent, int modifiedBy, Date modificationDate) {
		this.followupId = followupId;
		this.pointToRecord = pointToRecord;
		this.recordedContent = recordedContent;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param followupId
	 * @param pointToRecord
	 * @param recordedContent
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public WhatToRecordContent(long id, long followupId, String pointToRecord,
			String recordedContent, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.followupId = followupId;
		this.pointToRecord = pointToRecord;
		this.recordedContent = recordedContent;
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
	 * @return the followupId
	 */
	public long getFollowupId() {
		return followupId;
	}

	/**
	 * @param followupId
	 *            the followupId to set
	 */
	public void setFollowupId(long followupId) {
		this.followupId = followupId;
	}

	/**
	 * @return the pointToRecord
	 */
	public String getPointToRecord() {
		return pointToRecord;
	}

	/**
	 * @param pointToRecord
	 *            the pointToRecord to set
	 */
	public void setPointToRecord(String pointToRecord) {
		this.pointToRecord = pointToRecord;
	}

	/**
	 * @return the recordedContent
	 */
	public String getRecordedContent() {
		return recordedContent;
	}

	/**
	 * @param recordedContent
	 *            the recordedContent to set
	 */
	public void setRecordedContent(String recordedContent) {
		this.recordedContent = recordedContent;
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
			String sqlStr = "insert into tbl_what_to_record_content values(?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getFollowupId());
			pStmt.setString(3, this.getPointToRecord());
			pStmt.setString(4, this.getRecordedContent());
			pStmt.setInt(5, this.getModifiedBy());
			pStmt.setDate(6, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(WhatToRecordContent whatToRecordContent) {
		try {
			String sqlStr = "update tbl_what_to_record_content set followup_id = ?, point_to_record = ?," +
					"recorded_content = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, whatToRecordContent.getFollowupId());
			pStmt.setString(2, whatToRecordContent.getPointToRecord());
			pStmt.setString(3, whatToRecordContent.getRecordedContent());
			pStmt.setInt(4, whatToRecordContent.getModifiedBy());
			pStmt.setDate(5, whatToRecordContent.getModificationDate());
			pStmt.setLong(6, whatToRecordContent.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long id) {
		try {
			String sqlStr = "delete from tbl_what_to_record_content where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<WhatToRecordContent> getAllWhatToRecordContents(){
		List<WhatToRecordContent> list = new ArrayList<WhatToRecordContent>();
		WhatToRecordContent whatToRecordContent = null;
		try {
			String query = "select * from tbl_what_to_record_content order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				whatToRecordContent = new WhatToRecordContent(rSet.getLong("id"), rSet.getLong("followup_id"), 
						rSet.getString("point_to_record"), rSet.getString("recorded_content"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));
				list.add(whatToRecordContent);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static WhatToRecordContent getWhatToRecordContent(long id) {
		WhatToRecordContent whatToRecordContent = null;
		try {
			String query = "select * from tbl_what_to_record_content where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				whatToRecordContent = new WhatToRecordContent(rSet.getLong("id"), rSet.getLong("followup_id"), 
						rSet.getString("point_to_record"), rSet.getString("recorded_content"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return whatToRecordContent;
	}
	
	public static WhatToRecordContent getWhatToRecordContentForFollowup(long followupId){
		WhatToRecordContent whatToRecordContent = null;
		try {
			String query = "select * from tbl_what_to_record_content where followup_id = "+followupId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				whatToRecordContent = new WhatToRecordContent(rSet.getLong("id"), rSet.getLong("followup_id"), 
						rSet.getString("point_to_record"), rSet.getString("recorded_content"), 
						rSet.getInt("modified_by"), rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return whatToRecordContent;
	}
}// end class
