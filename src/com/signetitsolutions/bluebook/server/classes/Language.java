/**
 * 
 */
package com.signetitsolutions.bluebook.server.classes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author mahder
 * 
 */
public class Language {
	private int id;
	private String language;

	/**
	 * 
	 */
	public Language() {
	}

	/**
	 * @param language
	 */
	public Language(String language) {
		this.language = language;
	}

	/**
	 * @param id
	 * @param language
	 */
	public Language(int id, String language) {
		this.id = id;
		this.language = language;
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
	 * @return the language
	 */
	public String getLanguage() {
		return language;
	}

	/**
	 * @param language
	 *            the language to set
	 */
	public void setLanguage(String language) {
		this.language = language;
	}

	public void save() {
		try {
			String sqlStr = "INSERT INTO tbl_language VALUES(?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getLanguage());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Language language) {
		try {
			String sqlStr = "UPDATE tbl_language SET language = ? WHERE id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, language.getLanguage());
			pStmt.setInt(2, language.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "DELETE FROM tbl_language WHERE id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Language> getAllLanguages() {
		List<Language> list = new ArrayList<Language>();
		Language lang = null;
		try {
			String query = "SELECT * FROM tbl_language ORDER BY language";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				lang = new Language(rSet.getInt("id"),rSet.getString("language"));
				list.add(lang);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Language getLanguage(int id) {		
		Language lang = null;
		try {
			String query = "SELECT * FROM tbl_language WHERE id = "+id;			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				lang = new Language(rSet.getInt("id"),rSet.getString("language"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return lang;
	}
}// end class
