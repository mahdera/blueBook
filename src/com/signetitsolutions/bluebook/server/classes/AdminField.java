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
public class AdminField {
	private int id;
	private String fieldName;
	private String optionValue;
	private String description;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * @param fieldName
	 * @param optionValue
	 * @param description
	 * @param modifiedBy;
	 * @param modificationDate
	 */
	public AdminField(String fieldName, String optionValue, String description,int modifiedBy,Date modificationDate) {
		this.fieldName = fieldName;
		this.optionValue = optionValue;
		this.description = description;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param fieldName
	 * @param optionValue
	 * @param description
	 * @param modifiedBy;
	 * @param modificationDate
	 */
	public AdminField(int id, String fieldName, String optionValue,
			String description,int modifiedBy,Date modificationDate) {
		this.id = id;
		this.fieldName = fieldName;
		this.optionValue = optionValue;
		this.description = description;
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
	 * @return the fieldName
	 */
	public String getFieldName() {
		return fieldName;
	}

	/**
	 * @param fieldName
	 *            the fieldName to set
	 */
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	/**
	 * @return the optionValue
	 */
	public String getOptionValue() {
		return optionValue;
	}

	/**
	 * @param optionValue
	 *            the optionValue to set
	 */
	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
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
			String sqlStr = "insert into tbl_admin_field values(?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getFieldName());
			pStmt.setString(3, this.getOptionValue());
			pStmt.setString(4, this.getDescription());
			pStmt.setInt(5, this.getModifiedBy());
			pStmt.setDate(6, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(AdminField adminField) {
		try {
			String sqlStr = "update tbl_admin_field set field_name = ?, option_value = ?, description = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, adminField.getFieldName());
			pStmt.setString(2, adminField.getOptionValue());
			pStmt.setString(3, adminField.getDescription());
			pStmt.setInt(4, adminField.getModifiedBy());
			pStmt.setDate(5, adminField.getModificationDate());
			pStmt.setInt(6, adminField.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_admin_field where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<AdminField> getAllAdminFields() {
		List<AdminField> list = new ArrayList<AdminField>();
		AdminField adminField = null;
		try {
			String query = "select * from tbl_admin_field order by field_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				adminField = new AdminField(rSet.getInt("id"), rSet.getString("field_name"), 
						rSet.getString("option_value"), rSet.getString("description"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(adminField);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static AdminField getAdminField(int id) {
		AdminField adminField = null;
		try {
			String query = "select * from tbl_admin_field where id = "+id;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				adminField = new AdminField(rSet.getInt("id"), rSet.getString("field_name"), 
						rSet.getString("option_value"), rSet.getString("description"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return adminField;
	}

	public static List<AdminField> getAllOptionValuesForThisFieldName(String fieldName) {
		List<AdminField> list = new ArrayList<AdminField>();
		AdminField adminField = null;
		try {
			String query = "select * from tbl_admin_field where field_name = '"+fieldName+"' order by option_value";			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				adminField = new AdminField(rSet.getInt("id"), rSet.getString("field_name"), 
						rSet.getString("option_value"), rSet.getString("description"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(adminField);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
