/**
 * 
 */
package com.signetitsolutions.bluebook.server.classes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 * 
 */
public class AdminFieldTranslation {
	private int id;
	private int adminFieldId;
	private int languageId;
	private String translatedValue;

	/**
	 * 
	 */
	public AdminFieldTranslation() {
	}

	/**
	 * @param adminFieldId
	 * @param languageId
	 * @param translatedValue
	 */
	public AdminFieldTranslation(int adminFieldId, int languageId,
			String translatedValue) {
		this.adminFieldId = adminFieldId;
		this.languageId = languageId;
		this.translatedValue = translatedValue;
	}

	/**
	 * @param id
	 * @param adminFieldId
	 * @param languageId
	 * @param translatedValue
	 */
	public AdminFieldTranslation(int id, int adminFieldId, int languageId,
			String translatedValue) {
		this.id = id;
		this.adminFieldId = adminFieldId;
		this.languageId = languageId;
		this.translatedValue = translatedValue;
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
	 * @return the adminFieldId
	 */
	public int getAdminFieldId() {
		return adminFieldId;
	}

	/**
	 * @param adminFieldId
	 *            the adminFieldId to set
	 */
	public void setAdminFieldId(int adminFieldId) {
		this.adminFieldId = adminFieldId;
	}

	/**
	 * @return the languageId
	 */
	public int getLanguageId() {
		return languageId;
	}

	/**
	 * @param languageId
	 *            the languageId to set
	 */
	public void setLanguageId(int languageId) {
		this.languageId = languageId;
	}

	/**
	 * @return the translatedValue
	 */
	public String getTranslatedValue() {
		return translatedValue;
	}

	/**
	 * @param translatedValue
	 *            the translatedValue to set
	 */
	public void setTranslatedValue(String translatedValue) {
		this.translatedValue = translatedValue;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_admin_field_translation values(?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getAdminFieldId());
			pStmt.setInt(3, this.getLanguageId());
			pStmt.setString(4, this.getTranslatedValue());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(AdminFieldTranslation adminFieldTranslation) {
		try {
			String sqlStr = "update tbl_admin_field_translation set admin_field_id = ?, language_id = ?," +
					"translated_value = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, adminFieldTranslation.getAdminFieldId());
			pStmt.setInt(2, adminFieldTranslation.getLanguageId());
			pStmt.setString(3, adminFieldTranslation.getTranslatedValue());
			pStmt.setInt(4, adminFieldTranslation.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_admin_field_translation where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<AdminFieldTranslation> getAllAdminFieldTranslations() {
		List<AdminFieldTranslation> list = new ArrayList<AdminFieldTranslation>();
		AdminFieldTranslation adminFieldTranslation = null;
		try {
			String query = "select * from tbl_admin_field_translation order by id";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				adminFieldTranslation = new AdminFieldTranslation(rSet.getInt("id"), 
						rSet.getInt("admin_field_id"), rSet.getInt("language_id"), rSet.getString("translated_value"));
				list.add(adminFieldTranslation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static AdminFieldTranslation getAdminFieldTranslation(int id) {
		AdminFieldTranslation adminFieldTranslation = null;
		try {
			String query = "select * from tbl_admin_field_translation where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				adminFieldTranslation = new AdminFieldTranslation(rSet.getInt("id"), 
						rSet.getInt("admin_field_id"), rSet.getInt("language_id"), rSet.getString("translated_value"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return adminFieldTranslation;
	}
	
	public static AdminFieldTranslation getAdminFieldTranslationForThisLanguageAndAdminField(int languageId, int adminFieldId){
		AdminFieldTranslation adminFieldTranslation = null;
		try {
			String query = "select * from tbl_admin_field_translation where language_id = "+languageId+
					" and admin_field_id = "+adminFieldId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				adminFieldTranslation = new AdminFieldTranslation(rSet.getInt("id"), 
						rSet.getInt("admin_field_id"), rSet.getInt("language_id"), rSet.getString("translated_value"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return adminFieldTranslation;
	}
}// end class
