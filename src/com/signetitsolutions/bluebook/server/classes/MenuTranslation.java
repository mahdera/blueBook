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
public class MenuTranslation {
	private int id;
	private int languageId;
	private int menuId;
	private String translatedValue;
	private String translatedDescription;

	/**
	 * 
	 */
	public MenuTranslation() {
	}

	/**
	 * @param languageId
	 * @param menuId
	 * @param translatedValue
	 * @param translatedDescription
	 */
	public MenuTranslation(int languageId, int menuId, String translatedValue, String translatedDescription) {
		this.languageId = languageId;
		this.menuId = menuId;
		this.translatedValue = translatedValue;
		this.translatedDescription = translatedDescription;
	}

	/**
	 * @param id
	 * @param languageId
	 * @param menuId
	 * @param translatedValue
	 * @param translatedDescription
	 */
	public MenuTranslation(int id, int languageId, int menuId,
			String translatedValue, String translatedDescription) {
		this.id = id;
		this.languageId = languageId;
		this.menuId = menuId;
		this.translatedValue = translatedValue;
		this.translatedDescription = translatedDescription;
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
	 * @return the menuId
	 */
	public int getMenuId() {
		return menuId;
	}

	/**
	 * @param menuId
	 *            the menuId to set
	 */
	public void setMenuId(int menuId) {
		this.menuId = menuId;
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
	

	/**
	 * @return the translatedDescription
	 */
	public String getTranslatedDescription() {
		return translatedDescription;
	}

	/**
	 * @param translatedDescription the translatedDescription to set
	 */
	public void setTranslatedDescription(String translatedDescription) {
		this.translatedDescription = translatedDescription;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_menu_translation values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getLanguageId());
			pStmt.setInt(3, this.getMenuId());
			pStmt.setString(4, this.getTranslatedValue());
			pStmt.setString(5, this.getTranslatedDescription());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(MenuTranslation menuTranslation) {
		try {
			String sqlStr = "update tbl_menu_translation set language_id = ?, menu_id = ?, translated_value = ?, translated_description = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, menuTranslation.getLanguageId());
			pStmt.setInt(2, menuTranslation.getMenuId());
			pStmt.setString(3, menuTranslation.getTranslatedValue());
			pStmt.setString(4, menuTranslation.getTranslatedDescription());
			pStmt.setInt(5, menuTranslation.getId());			
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_menu_translation where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<MenuTranslation> getAllMenuTranslations() {
		List<MenuTranslation> list = new ArrayList<MenuTranslation>();
		MenuTranslation menuTranslation = null;
		try {
			String query = "select * from tbl_menu_translation order by menu_id";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				menuTranslation = new MenuTranslation(rSet.getInt("id"), rSet.getInt("language_id"), rSet.getInt("menu_id"), rSet.getString("translated_value"),
						rSet.getString("translated_description"));
				list.add(menuTranslation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static MenuTranslation getMenuTranslation(int id) {
		MenuTranslation menuTranslation = null;
		try {
			String query = "select * from tbl_menu_translation where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				menuTranslation = new MenuTranslation(rSet.getInt("id"), rSet.getInt("language_id"), rSet.getInt("menu_id"), rSet.getString("translated_value"),
						rSet.getString("translated_description"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return menuTranslation;
	}
	
	public static MenuTranslation getMenuTranslationForThisLanguageAndMenu(int languageId, int menuId){
		MenuTranslation menuTranslation = null;
		try {
			String query = "select * from tbl_menu_translation where language_id = "+languageId+" and menu_id = "+menuId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				menuTranslation = new MenuTranslation(rSet.getInt("id"), rSet.getInt("language_id"), rSet.getInt("menu_id"), rSet.getString("translated_value"),
						rSet.getString("translated_description"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return menuTranslation;
	}
}// end class
