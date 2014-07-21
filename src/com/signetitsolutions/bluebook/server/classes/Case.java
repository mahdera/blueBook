/**
 * 
 */
package com.signetitsolutions.bluebook.server.classes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 *
 */
public class Case {
	private long id;
	private String caseIdNumber;
	private String theme;
	private String reliefSought;
	private int caseCategoryId;
	private int linkageId;
	private int evidenceTypeId;
	private int numberOfPages;
	private int meansOfApplicationId;
	private int appliedById;
	private Date dateRegistered;
	private long applicantId;
	private int modifiedBy;
	private Date modificationDate;
	
	/**
	 * 
	 */
	public Case() {
	}
	
	

	/**
	 * @param caseIdNumber
	 * @param theme
	 * @param reliefSought
	 * @param caseCategoryId
	 * @param linkageId
	 * @param evidenceTypeId
	 * @param numberOfPages
	 * @param meansOfApplicationId
	 * @param appliedById
	 * @param dateRegistered
	 * @param applicantId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Case(String caseIdNumber, String theme, String reliefSought,
			int caseCategoryId, int linkageId, int evidenceTypeId,
			int numberOfPages, int meansOfApplicationId, int appliedById,
			Date dateRegistered, long applicantId, int modifiedBy,
			Date modificationDate) {
		this.caseIdNumber = caseIdNumber;
		this.theme = theme;
		this.reliefSought = reliefSought;
		this.caseCategoryId = caseCategoryId;
		this.linkageId = linkageId;
		this.evidenceTypeId = evidenceTypeId;
		this.numberOfPages = numberOfPages;
		this.meansOfApplicationId = meansOfApplicationId;
		this.appliedById = appliedById;
		this.dateRegistered = dateRegistered;
		this.applicantId = applicantId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}


	/**
	 * @param id
	 * @param caseIdNumber
	 * @param theme
	 * @param reliefSought
	 * @param caseCategoryId
	 * @param linkageId
	 * @param evidenceTypeId
	 * @param numberOfPages
	 * @param meansOfApplicationId
	 * @param appliedById
	 * @param dateRegistered
	 * @param applicantId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Case(long id, String caseIdNumber, String theme,
			String reliefSought, int caseCategoryId, int linkageId,
			int evidenceTypeId, int numberOfPages, int meansOfApplicationId,
			int appliedById, Date dateRegistered, long applicantId,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.caseIdNumber = caseIdNumber;
		this.theme = theme;
		this.reliefSought = reliefSought;
		this.caseCategoryId = caseCategoryId;
		this.linkageId = linkageId;
		this.evidenceTypeId = evidenceTypeId;
		this.numberOfPages = numberOfPages;
		this.meansOfApplicationId = meansOfApplicationId;
		this.appliedById = appliedById;
		this.dateRegistered = dateRegistered;
		this.applicantId = applicantId;
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
	 * @return the caseIdNumber
	 */
	public String getCaseIdNumber() {
		return caseIdNumber;
	}



	/**
	 * @param caseIdNumber the caseIdNumber to set
	 */
	public void setCaseIdNumber(String caseIdNumber) {
		this.caseIdNumber = caseIdNumber;
	}



	/**
	 * @return the theme
	 */
	public String getTheme() {
		return theme;
	}



	/**
	 * @param theme the theme to set
	 */
	public void setTheme(String theme) {
		this.theme = theme;
	}



	/**
	 * @return the reliefSought
	 */
	public String getReliefSought() {
		return reliefSought;
	}



	/**
	 * @param reliefSought the reliefSought to set
	 */
	public void setReliefSought(String reliefSought) {
		this.reliefSought = reliefSought;
	}



	/**
	 * @return the caseCategoryId
	 */
	public int getCaseCategoryId() {
		return caseCategoryId;
	}



	/**
	 * @param caseCategoryId the caseCategoryId to set
	 */
	public void setCaseCategoryId(int caseCategoryId) {
		this.caseCategoryId = caseCategoryId;
	}



	/**
	 * @return the linkageId
	 */
	public int getLinkageId() {
		return linkageId;
	}



	/**
	 * @param linkageId the linkageId to set
	 */
	public void setLinkageId(int linkageId) {
		this.linkageId = linkageId;
	}



	/**
	 * @return the evidenceTypeId
	 */
	public int getEvidenceTypeId() {
		return evidenceTypeId;
	}



	/**
	 * @param evidenceTypeId the evidenceTypeId to set
	 */
	public void setEvidenceTypeId(int evidenceTypeId) {
		this.evidenceTypeId = evidenceTypeId;
	}



	/**
	 * @return the numberOfPages
	 */
	public int getNumberOfPages() {
		return numberOfPages;
	}



	/**
	 * @param numberOfPages the numberOfPages to set
	 */
	public void setNumberOfPages(int numberOfPages) {
		this.numberOfPages = numberOfPages;
	}



	/**
	 * @return the meansOfApplicationId
	 */
	public int getMeansOfApplicationId() {
		return meansOfApplicationId;
	}



	/**
	 * @param meansOfApplicationId the meansOfApplicationId to set
	 */
	public void setMeansOfApplicationId(int meansOfApplicationId) {
		this.meansOfApplicationId = meansOfApplicationId;
	}



	/**
	 * @return the appliedById
	 */
	public int getAppliedById() {
		return appliedById;
	}



	/**
	 * @param appliedById the appliedById to set
	 */
	public void setAppliedById(int appliedById) {
		this.appliedById = appliedById;
	}



	/**
	 * @return the dateRegistered
	 */
	public Date getDateRegistered() {
		return dateRegistered;
	}



	/**
	 * @param dateRegistered the dateRegistered to set
	 */
	public void setDateRegistered(Date dateRegistered) {
		this.dateRegistered = dateRegistered;
	}



	/**
	 * @return the applicantId
	 */
	public long getApplicantId() {
		return applicantId;
	}



	/**
	 * @param applicantId the applicantId to set
	 */
	public void setApplicantId(long applicantId) {
		this.applicantId = applicantId;
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
			String sqlStr = "insert into tbl_case values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getCaseIdNumber());
			pStmt.setString(3, this.getTheme());
			pStmt.setString(4, this.getReliefSought());
			pStmt.setInt(5, this.getCaseCategoryId());
			pStmt.setInt(6, this.getLinkageId());
			pStmt.setInt(7, this.getEvidenceTypeId());
			pStmt.setInt(8, this.getNumberOfPages());
			pStmt.setInt(9, this.getMeansOfApplicationId());
			pStmt.setInt(10, this.getAppliedById());
			pStmt.setDate(11, this.getDateRegistered());
			pStmt.setLong(12, this.getApplicantId());
			pStmt.setInt(13, this.getModifiedBy());
			pStmt.setDate(14, this.getModificationDate());			
			DBConnection.writeToDatabase(pStmt);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(Case c){
		try {
			String sqlStr = "update tbl_case set case_id_number = ?, theme = ?, relief_sought = ?," +
					"case_category_id = ?, linkage_id = ?, evidence_type_id = ?, number_of_pages = ?," +
					"means_of_application_id = ?, applied_by_id = ?, date_registered = ?, applicant_id = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, c.getCaseIdNumber());
			pStmt.setString(2, c.getTheme());
			pStmt.setString(3, c.getReliefSought());
			pStmt.setInt(4, c.getCaseCategoryId());
			pStmt.setInt(5, c.getLinkageId());
			pStmt.setInt(6, c.getEvidenceTypeId());
			pStmt.setInt(7, c.getNumberOfPages());
			pStmt.setInt(8, c.getMeansOfApplicationId());
			pStmt.setInt(9, c.getAppliedById());
			pStmt.setDate(10, c.getDateRegistered());
			pStmt.setLong(11, c.getApplicantId());
			pStmt.setInt(12, c.getModifiedBy());
			pStmt.setDate(13, c.getModificationDate());
			pStmt.setLong(14, c.getId());
			DBConnection.writeToDatabase(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long id){
		try {
			String sqlStr = "delete from tbl_case where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<Case> getAllCases(){
		List<Case> list = new ArrayList<Case>();
		Case c = null;
		try {
			String query = "select * from tbl_case";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				c = new Case(rSet.getLong("id"), rSet.getString("case_id_number"), rSet.getString("theme"), 
						rSet.getString("relief_sought"), rSet.getInt("case_category_id"), rSet.getInt("linkage_id"), 
						rSet.getInt("evidence_type_id"), rSet.getInt("number_of_pages"), rSet.getInt("means_of_application_id"), 
						rSet.getInt("applied_by_id"),rSet.getDate("date_registered"),rSet.getLong("applicant_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static long getTotalNumberOfCasesRegisteredDuring(Date fromDate,Date toDate){
		long countVal = 0;
		try{
			String query = "select count(*) as cnt from tbl_case where date_registered between '"+fromDate+"' and '"+toDate+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				countVal = rSet.getLong("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return countVal;
	}
	
	public static List<Case> getAllCasesRegisteredDuring(Date fromDate,Date toDate){
		List<Case> list = new ArrayList<Case>();
		Case c = null;
		try {
			String query = "select * from tbl_case where date_registered between '"+fromDate+"' and '"+toDate+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				c = new Case(rSet.getLong("id"), rSet.getString("case_id_number"), rSet.getString("theme"), 
						rSet.getString("relief_sought"), rSet.getInt("case_category_id"), rSet.getInt("linkage_id"), 
						rSet.getInt("evidence_type_id"), rSet.getInt("number_of_pages"), rSet.getInt("means_of_application_id"), 
						rSet.getInt("applied_by_id"),rSet.getDate("date_registered"),rSet.getLong("applicant_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Case getCase(long id){
		Case c = null;
		try {
			String query = "select * from tbl_case where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				c = new Case(rSet.getLong("id"), rSet.getString("case_id_number"), rSet.getString("theme"), 
						rSet.getString("relief_sought"), rSet.getInt("case_category_id"), rSet.getInt("linkage_id"), 
						rSet.getInt("evidence_type_id"), rSet.getInt("number_of_pages"), rSet.getInt("means_of_application_id"), 
						rSet.getInt("applied_by_id"),rSet.getDate("date_registered"),rSet.getLong("applicant_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return c;
	}
	
	public static int getHowManyApplicantsApplyDuringThisPeriodAndSex(Date fromDate,Date toDate,String sex){
		int countVal = 0;
		try{
			String query = "select count(*) as cnt from tbl_case,tbl_applicant where date_registered between '"+fromDate+"' and '"+toDate+"' and tbl_case.applicant_id = tbl_applicant.id and sex = '"+sex+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				countVal = rSet.getInt("cnt");
			}
		}catch(Exception e){
			e.toString();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return countVal;
	}
	
	public static long getMaxCaseIdNow(){
		long id = 0;
		try{
			String query = "select max(id) as m from tbl_case";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				id = rSet.getLong("m");
				id++;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return id;
	}
}//end class
