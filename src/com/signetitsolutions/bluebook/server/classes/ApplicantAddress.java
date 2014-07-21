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
public class ApplicantAddress {
	private long id;
	private long applicantId;
	private int regionId;
	private int applicantZoneId;
	private int woredaId;
	private String kebele;
	private String officeTelephone;
	private String homeTelephone;
	private String mobileTelephone;
	private String email;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * @param applicantId
	 * @param region
	 * @param applicantZone
	 * @param woreda
	 * @param kebele
	 * @param officeTelephone
	 * @param homeTelephone
	 * @param mobileTelephone
	 * @param email
	 * @param modifiedby
	 * @param modificationDate
	 */
	public ApplicantAddress(long applicantId, int regionId,
			int applicantZoneId, int woredaId, String kebele,
			String officeTelephone, String homeTelephone,
			String mobileTelephone, String email, int modifiedBy,
			Date modificationDate) {
		this.applicantId = applicantId;
		this.regionId = regionId;
		this.applicantZoneId = applicantZoneId;
		this.woredaId = woredaId;
		this.kebele = kebele;
		this.officeTelephone = officeTelephone;
		this.homeTelephone = homeTelephone;
		this.mobileTelephone = mobileTelephone;
		this.email = email;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param applicantId
	 * @param region
	 * @param applicantZone
	 * @param woreda
	 * @param kebele
	 * @param officeTelephone
	 * @param homeTelephone
	 * @param mobileTelephone
	 * @param email
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ApplicantAddress(long id, long applicantId, int regionId,
			int applicantZoneId, int woredaId, String kebele,
			String officeTelephone, String homeTelephone,
			String mobileTelephone, String email, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.applicantId = applicantId;
		this.regionId = regionId;
		this.applicantZoneId = applicantZoneId;
		this.woredaId = woredaId;
		this.kebele = kebele;
		this.officeTelephone = officeTelephone;
		this.homeTelephone = homeTelephone;
		this.mobileTelephone = mobileTelephone;
		this.email = email;
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
	 * @return the region
	 */
	public int getRegion() {
		return regionId;
	}
	/**
	 * @param region the region to set
	 */
	public void setRegion(int regionId) {
		this.regionId = regionId;
	}
	/**
	 * @return the applicantZone
	 */
	public int getApplicantZone() {
		return applicantZoneId;
	}
	/**
	 * @param applicantZone the applicantZone to set
	 */
	public void setApplicantZone(int applicantZoneId) {
		this.applicantZoneId = applicantZoneId;
	}
	/**
	 * @return the woreda
	 */
	public int getWoreda() {
		return woredaId;
	}
	/**
	 * @param woreda the woreda to set
	 */
	public void setWoreda(int woredaId) {
		this.woredaId = woredaId;
	}
	/**
	 * @return the kebele
	 */
	public String getKebele() {
		return kebele;
	}
	/**
	 * @param kebele the kebele to set
	 */
	public void setKebele(String kebele) {
		this.kebele = kebele;
	}
	/**
	 * @return the officeTelephone
	 */
	public String getOfficeTelephone() {
		return officeTelephone;
	}
	/**
	 * @param officeTelephone the officeTelephone to set
	 */
	public void setOfficeTelephone(String officeTelephone) {
		this.officeTelephone = officeTelephone;
	}
	/**
	 * @return the homeTelephone
	 */
	public String getHomeTelephone() {
		return homeTelephone;
	}
	/**
	 * @param homeTelephone the homeTelephone to set
	 */
	public void setHomeTelephone(String homeTelephone) {
		this.homeTelephone = homeTelephone;
	}
	/**
	 * @return the mobileTelephone
	 */
	public String getMobileTelephone() {
		return mobileTelephone;
	}
	/**
	 * @param mobileTelephone the mobileTelephone to set
	 */
	public void setMobileTelephone(String mobileTelephone) {
		this.mobileTelephone = mobileTelephone;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
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
			String sqlStr = "insert into tbl_applicant_address values (?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setLong(2, this.getApplicantId());
			pStmt.setInt(3, this.getRegion());
			pStmt.setInt(4, this.getApplicantZone());
			pStmt.setInt(5, this.getWoreda());
			pStmt.setString(6, this.getKebele());
			pStmt.setString(7, this.getOfficeTelephone());
			pStmt.setString(8, this.getHomeTelephone());
			pStmt.setString(9, this.getMobileTelephone());
			pStmt.setString(10, this.getEmail());
			pStmt.setInt(11, this.getModifiedBy());
			pStmt.setDate(12, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
		
	public static void update(ApplicantAddress applicantAddress){
		try {
			String sqlStr = "update tbl_applicant_address set applicant_id = ?, region = ?, applicant_zone = ?," +
					"woreda = ?, kebele = ?, office_telephone = ?, home_telephone = ?, mobile_telephone = ?," +
					"email = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, applicantAddress.getApplicantId());
			pStmt.setInt(2, applicantAddress.getRegion());
			pStmt.setInt(3, applicantAddress.getApplicantZone());
			pStmt.setInt(4, applicantAddress.getWoreda());
			pStmt.setString(5, applicantAddress.getKebele());
			pStmt.setString(6, applicantAddress.getOfficeTelephone());
			pStmt.setString(7, applicantAddress.getHomeTelephone());
			pStmt.setString(8, applicantAddress.getMobileTelephone());
			pStmt.setString(9, applicantAddress.getEmail());
			pStmt.setInt(10, applicantAddress.getModifiedBy());
			pStmt.setDate(11, applicantAddress.getModificationDate());
			pStmt.setLong(12, applicantAddress.getId());
			DBConnection.writeToDatabase(pStmt);
			//System.out.println(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long id){
		try {
			String sqlStr = "delete from tbl_applicant_address where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<ApplicantAddress> getallApplicantAddresses(){
		List<ApplicantAddress> list = new ArrayList<ApplicantAddress>();
		ApplicantAddress applicantAddress = null;
		try {
			String query = "select * from tbl_applicant_address";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				applicantAddress = new ApplicantAddress(rSet.getLong("id"),rSet.getLong("applicant_id"), rSet.getInt("region_id"), 
						rSet.getInt("applicant_zone_id"), rSet.getInt("woreda_id"), rSet.getString("kebele"), rSet.getString("office_telephone"), 
						rSet.getString("home_telephone"), rSet.getString("mobile_telephone"), rSet.getString("email"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(applicantAddress);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static ApplicantAddress getApplicantAddress(long id){
		ApplicantAddress applicantAddress = null;
		try {
			String query = "select * from tbl_applicant_address where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				applicantAddress = new ApplicantAddress(rSet.getLong("id"),rSet.getLong("applicant_id"), rSet.getInt("region_id"), 
						rSet.getInt("applicant_zone_id"), rSet.getInt("woreda_id"), rSet.getString("kebele"), rSet.getString("office_telephone"), 
						rSet.getString("home_telephone"), rSet.getString("mobile_telephone"), rSet.getString("email"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return applicantAddress;
	}
	
	public static ApplicantAddress getAddressOfThisApplicant(long applicantId){
		ApplicantAddress applicantAddress = null;
		try {
			String query = "select * from tbl_applicant_address where applicant_id = "+applicantId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				applicantAddress = new ApplicantAddress(rSet.getLong("id"),rSet.getLong("applicant_id"), rSet.getInt("region_id"), 
						rSet.getInt("applicant_zone_id"), rSet.getInt("woreda_id"), rSet.getString("kebele"), rSet.getString("office_telephone"), 
						rSet.getString("home_telephone"), rSet.getString("mobile_telephone"), rSet.getString("email"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return applicantAddress;
	}
}//end class
