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
public class CaseCategory {
	private int id;
	private String caseCategoryName;
	private String description;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * @param caseCategoryName
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public CaseCategory(String caseCategoryName, String description,int modifiedBy, Date modificationDate) {
		this.caseCategoryName = caseCategoryName;
		this.description = description;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param caseCategoryName
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public CaseCategory(int id, String caseCategoryName, String description,int modifiedBy, Date modificationDate) {
		this.id = id;
		this.caseCategoryName = caseCategoryName;
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
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the caseCategoryName
	 */
	public String getCaseCategoryName() {
		return caseCategoryName;
	}
	/**
	 * @param caseCategoryName the caseCategoryName to set
	 */
	public void setCaseCategoryName(String caseCategoryName) {
		this.caseCategoryName = caseCategoryName;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
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
	
	public void save(){
		try {
			String sqlStr = "insert into tbl_case_category values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getCaseCategoryName());
			pStmt.setString(3, this.getDescription());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(CaseCategory caseCategory){
		try {
			String sqlStr = "update tbl_case_category set case_category_name = ?, description = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, caseCategory.getCaseCategoryName());
			pStmt.setString(2, caseCategory.getDescription());
			pStmt.setInt(3, caseCategory.getModifiedBy());
			pStmt.setDate(4, caseCategory.getModificationDate());
			pStmt.setInt(5, caseCategory.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(int id){
		try {
			String sqlStr = "delete from tbl_case_category where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<CaseCategory> getAllCaseCategories(){
		List<CaseCategory> list = new ArrayList<CaseCategory>();
		CaseCategory caseCategory = null;
		try {
			String query = "select * from tbl_case_category";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				caseCategory = new CaseCategory(rSet.getInt("id"), rSet.getString("case_category_name"), rSet.getString("description"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(caseCategory);
			}
		} catch (Exception e) {

		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static CaseCategory getCaseCategory(int id){
		CaseCategory caseCategory = null;
		try {
			String query = "select * from tbl_case_category where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				caseCategory = new CaseCategory(rSet.getInt("id"), rSet.getString("case_category_name"), rSet.getString("description"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {

		} finally {
			DBConnection.disconnectDatabase();
		}
		return caseCategory;
	}
}//end class
