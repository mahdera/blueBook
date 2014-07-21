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
public class Applicant {
	private long id;
	private String applicantIdNumber;
	private String fullName;
	private String sex;
	private String ageCategory;
	private int numberOfApplicantsMale;
	private int numberOfApplicantsFemale;
	private String occupation;
	private String disability;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * @param applicantIdNumber
	 * @param fullName
	 * @param sex
	 * @param ageCategory
	 * @param numberOfApplicantsMale
	 * @param numberOfApplicantsFemale
	 * @param occupation
	 * @param disability
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Applicant(String applicantIdNumber, String fullName, String sex,
			String ageCategory, int numberOfApplicantsMale,
			int numberOfApplicantsFemale, String occupation, String disability,
			int modifiedBy,Date modificationDate) {
		this.applicantIdNumber = applicantIdNumber;
		this.fullName = fullName;
		this.sex = sex;
		this.ageCategory = ageCategory;
		this.numberOfApplicantsMale = numberOfApplicantsMale;
		this.numberOfApplicantsFemale = numberOfApplicantsFemale;
		this.occupation = occupation;
		this.disability = disability;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param applicantIdNumber
	 * @param fullName
	 * @param sex
	 * @param ageCategory
	 * @param numberOfApplicantsMale
	 * @param numberOfApplicantsFemale
	 * @param occupation
	 * @param disability
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Applicant(long id, String applicantIdNumber, String fullName,
			String sex, String ageCategory, int numberOfApplicantsMale,
			int numberOfApplicantsFemale, String occupation, String disability,int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.applicantIdNumber = applicantIdNumber;
		this.fullName = fullName;
		this.sex = sex;
		this.ageCategory = ageCategory;
		this.numberOfApplicantsMale = numberOfApplicantsMale;
		this.numberOfApplicantsFemale = numberOfApplicantsFemale;
		this.occupation = occupation;
		this.disability = disability;
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
	 * @return the applicantIdNumber
	 */
	public String getApplicantIdNumber() {
		return applicantIdNumber;
	}
	/**
	 * @param applicantIdNumber the applicantIdNumber to set
	 */
	public void setApplicantIdNumber(String applicantIdNumber) {
		this.applicantIdNumber = applicantIdNumber;
	}
	/**
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}
	/**
	 * @param fullName the fullName to set
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * @return the ageCategory
	 */
	public String getAgeCategory() {
		return ageCategory;
	}
	/**
	 * @param ageCategory the ageCategory to set
	 */
	public void setAgeCategory(String ageCategory) {
		this.ageCategory = ageCategory;
	}
	/**
	 * @return the numberOfApplicantsMale
	 */
	public int getNumberOfApplicantsMale() {
		return numberOfApplicantsMale;
	}
	/**
	 * @param numberOfApplicantsMale the numberOfApplicantsMale to set
	 */
	public void setNumberOfApplicantsMale(int numberOfApplicantsMale) {
		this.numberOfApplicantsMale = numberOfApplicantsMale;
	}
	/**
	 * @return the numberOfApplicantsFemale
	 */
	public int getNumberOfApplicantsFemale() {
		return numberOfApplicantsFemale;
	}
	/**
	 * @param numberOfApplicantsFemale the numberOfApplicantsFemale to set
	 */
	public void setNumberOfApplicantsFemale(int numberOfApplicantsFemale) {
		this.numberOfApplicantsFemale = numberOfApplicantsFemale;
	}
	/**
	 * @return the occupation
	 */
	public String getOccupation() {
		return occupation;
	}
	/**
	 * @param occupation the occupation to set
	 */
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	/**
	 * @return the disability
	 */
	public String getDisability() {
		return disability;
	}
	/**
	 * @param disability the disability to set
	 */
	public void setDisability(String disability) {
		this.disability = disability;
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
			String sqlStr = "insert into tbl_applicant values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setString(2, this.getApplicantIdNumber());
			pStmt.setString(3, this.getFullName());
			pStmt.setString(4, this.getSex());
			pStmt.setString(5, this.getAgeCategory());
			pStmt.setInt(6, this.getNumberOfApplicantsMale());
			pStmt.setInt(7, this.getNumberOfApplicantsFemale());
			pStmt.setString(8, this.getOccupation());
			pStmt.setString(9, this.getDisability());
			pStmt.setInt(10, this.getModifiedBy());
			pStmt.setDate(11, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(Applicant applicant){
		try {
			String sqlStr = "update tbl_applicant set applicant_id_number = ?, full_name = ?, sex = ?," +
					"age_category = ?, number_of_applicants_male = ?, number_of_applicants_female = ?," +
					"occupation = ?, disability = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, applicant.getApplicantIdNumber());
			pStmt.setString(2, applicant.getFullName());
			pStmt.setString(3, applicant.getSex());
			pStmt.setString(4, applicant.getAgeCategory());
			pStmt.setInt(5, applicant.getNumberOfApplicantsMale());
			pStmt.setInt(6, applicant.getNumberOfApplicantsFemale());
			pStmt.setString(7, applicant.getOccupation());
			pStmt.setString(8, applicant.getDisability());
			pStmt.setInt(9, applicant.getModifiedBy());
			pStmt.setDate(10, applicant.getModificationDate());
			pStmt.setLong(11, applicant.getId());		
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long id){
		try {
			String sqlStr = "delete from tbl_applicant where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<Applicant> getAllApplicants(){
		List<Applicant> list = new ArrayList<Applicant>();
		Applicant applicant = null;
		try {
			String query = "select * from tbl_applicant";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				applicant = new Applicant(rSet.getLong("id"), rSet.getString("applicant_id_number"), rSet.getString("full_name"), rSet.getString("sex"), 
						rSet.getString("age_category"), rSet.getInt("number_of_applicants_male"), rSet.getInt("number_of_applicants_female"), 
						rSet.getString("occupation"), rSet.getString("disability"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(applicant);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Applicant getApplicant(long id){
		Applicant applicant = null;
		try {
			String query = "select * from tbl_applicant where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				applicant = new Applicant(rSet.getLong("id"), rSet.getString("applicant_id_number"), rSet.getString("full_name"), rSet.getString("sex"), 
						rSet.getString("age_category"), rSet.getInt("number_of_applicants_male"), rSet.getInt("number_of_applicants_female"), 
						rSet.getString("occupation"), rSet.getString("disability"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return applicant;
	}
	
	public static long getMaxApplicantIdNow(){
		long id = 0;
		try{
			String query = "select max(id) as m from tbl_applicant";
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
	
	public static Applicant fetchApplicantUsingApplicantIdNumber(String applicantIdNumber){
		Applicant applicant = null;
		try{
			String query = "select * from tbl_applicant where applicant_id_number = '"+
		applicantIdNumber+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				applicant = new Applicant(rSet.getLong("id"), rSet.getString("applicant_id_number"), rSet.getString("full_name"), rSet.getString("sex"), 
						rSet.getString("age_category"), rSet.getInt("number_of_applicants_male"), rSet.getInt("number_of_applicants_female"), 
						rSet.getString("occupation"), rSet.getString("disability"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return applicant;
	}
	
	public static List<Applicant> getAllApplicantsWithTheseAddressFilters(String region, String zone, String woreda){
		List<Applicant> list = new ArrayList<Applicant>();
		Applicant applicant = null;
		String query = null;
		int regionId=0;
		int zoneId=0;
		int woredaId=0;
		try{
			if(!zone.equalsIgnoreCase("all") && !woreda.equalsIgnoreCase("all")){
				regionId = Integer.parseInt(region);
				zoneId = Integer.parseInt(zone);
				woredaId = Integer.parseInt(woreda);
				query = "select * from tbl_applicant a, tbl_applicant_address b where a.id = b.applicant_id and b.region_id ="+regionId+" and b.applicant_zone_id = "+zoneId+" and b.woreda_id = "+woredaId+" order by full_name";
			}else if(!zone.equalsIgnoreCase("all") && woreda.equalsIgnoreCase("all")){
				regionId = Integer.parseInt(region);
				zoneId = Integer.parseInt(zone);
				query = "select * from tbl_applicant a, tbl_applicant_address b where a.id = b.applicant_id and b.region_id = "+regionId+" and b.applicant_zone_id = "+zoneId+" order by full_name";
			}else{
				regionId = Integer.parseInt(region);
				query = "select * from tbl_applicant a, tbl_applicant_address b where a.id = b.applicant_id and b.region_id = "+regionId+" order by full_name";
			}
			ResultSet rSet = DBConnection.readFromDatabase(query);
			System.out.println(query);
			while(rSet.next()){
				applicant = new Applicant(rSet.getLong("id"), rSet.getString("applicant_id_number"), rSet.getString("full_name"), rSet.getString("sex"), 
						rSet.getString("age_category"), rSet.getInt("number_of_applicants_male"), rSet.getInt("number_of_applicants_female"), 
						rSet.getString("occupation"), rSet.getString("disability"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(applicant);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static int getHowManyOfThisSexTypeIsDisabledRegisteredDuring(Date fromDate,Date toDate,String sex){
		int countVal = 0;
		try{
			String query = "select count(*) as cnt from tbl_applicant,tbl_case where sex = '"+sex+"' and disability = 'Yes' and tbl_applicant.id = tbl_case.applicant_id and date_registered between '"+
		fromDate+"' and '"+toDate+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				countVal = rSet.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return countVal;
	}
}//end class
