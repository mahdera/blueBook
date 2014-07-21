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
public class LanguageTranslation {
	private int id;
	private int langaugeId;
	private int labelId;
	private String translatedValue;
	/**
	 * 
	 */
	public LanguageTranslation() {
	}
	/**
	 * @param langaugeId
	 * @param labelId
	 * @param translatedValue
	 */
	public LanguageTranslation(int langaugeId, int labelId,
			String translatedValue) {
		this.langaugeId = langaugeId;
		this.labelId = labelId;
		this.translatedValue = translatedValue;
	}
	/**
	 * @param id
	 * @param langaugeId
	 * @param labelId
	 * @param translatedValue
	 */
	public LanguageTranslation(int id, int langaugeId, int labelId,
			String translatedValue) {
		this.id = id;
		this.langaugeId = langaugeId;
		this.labelId = labelId;
		this.translatedValue = translatedValue;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the langaugeId
	 */
	public int getLangaugeId() {
		return langaugeId;
	}
	/**
	 * @param langaugeId the langaugeId to set
	 */
	public void setLangaugeId(int langaugeId) {
		this.langaugeId = langaugeId;
	}
	/**
	 * @return the labelId
	 */
	public int getLabelId() {
		return labelId;
	}
	/**
	 * @param labelId the labelId to set
	 */
	public void setLabelId(int labelId) {
		this.labelId = labelId;
	}
	/**
	 * @return the translatedValue
	 */
	public String getTranslatedValue() {
		return translatedValue;
	}
	/**
	 * @param translatedValue the translatedValue to set
	 */
	public void setTranslatedValue(String translatedValue) {
		this.translatedValue = translatedValue;
	}
	
	public void save(){
		try {
			String sqlStr = "insert into tbl_language_translation values(?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getLangaugeId());
			pStmt.setInt(3, this.getLabelId());
			pStmt.setString(4, this.getTranslatedValue());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(LanguageTranslation languageTranslation){
		try {
			String sqlStr = "update tbl_language_translation set language_id = ?, label_id = ?, translated_value = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, languageTranslation.getLangaugeId());
			pStmt.setInt(2, languageTranslation.getLabelId());
			pStmt.setString(3, languageTranslation.getTranslatedValue());
			pStmt.setInt(4, languageTranslation.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(int id){
		try {
			String sqlStr = "delete from tbl_translation where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<LanguageTranslation> getAllLanguageTranslations(){
		List<LanguageTranslation> list = new ArrayList<LanguageTranslation>();
		LanguageTranslation languageTranslation = null;
		try {
			String query = "select * from tbl_language_translation order by translated_value";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				languageTranslation = new LanguageTranslation(rSet.getInt("id"), rSet.getInt("language_id"), 
						rSet.getInt("label_id"), rSet.getString("translated_value"));
				list.add(languageTranslation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<LanguageTranslation> getAllLanguageTranslationsForThisLanguage(int languageId){
		List<LanguageTranslation> list = new ArrayList<LanguageTranslation>();
		LanguageTranslation languageTranslation = null;
		try {
			String query = "select * from tbl_language_translation where language_id = "+languageId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				languageTranslation = new LanguageTranslation(rSet.getInt("id"), rSet.getInt("language_id"), 
						rSet.getInt("label_id"), rSet.getString("translated_value"));
				list.add(languageTranslation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static LanguageTranslation getLanguageTranslation(int id){
		LanguageTranslation languageTranslation = null;
		try {
			String query = "select * from tbl_language_translation where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				languageTranslation = new LanguageTranslation(rSet.getInt("id"), rSet.getInt("language_id"), 
						rSet.getInt("label_id"), rSet.getString("translated_value"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return languageTranslation;
	}
	
	public static String getLabelCaptionInTheSelectedLanguage(int langId,String strLabelId){
		String labelCaption = null;
		try{
			String query = "SELECT translated_value AS caption FROM tbl_language_translation,tbl_label WHERE "+
			"tbl_language_translation.language_id = "+langId+" AND tbl_language_translation.label_id = "+
			"tbl_label.id AND tbl_label.label_id = '"+strLabelId+"'";
			
			ResultSet rSet = DBConnection.readFromDatabase(query);			
			while(rSet.next()){
				labelCaption = rSet.getString("caption");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return labelCaption;
	}
	
	public static LanguageTranslation getLanguageTranslationForLanguageAndLabelId(int languageId, int labelId){
		LanguageTranslation languageTranslation = null;
		try {
			String query = "select * from tbl_language_translation where language_id = "+languageId+" and label_id = "+labelId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				languageTranslation = new LanguageTranslation(rSet.getInt("id"), rSet.getInt("language_id"), 
						rSet.getInt("label_id"), rSet.getString("translated_value"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return languageTranslation;
	}
}//end class
