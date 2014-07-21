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
public class RespondentAddress {
	private int id;
	private int respondentId;
	private int regionId;
	private int woredaId;
	private String kebele;
	private String telephone;
	private String mobile;
	private String fax;
	private String pobox;
	private String email;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public RespondentAddress() {
	}
	
	

	/**
	 * @param respondentId
	 * @param regionId
	 * @param woredaId
	 * @param kebele
	 * @param telephone
	 * @param mobile
	 * @param fax
	 * @param pobox
	 * @param email
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public RespondentAddress(int respondentId, int regionId, int woredaId,
			String kebele, String telephone, String mobile, String fax,
			String pobox, String email, int modifiedBy, Date modificationDate) {
		this.respondentId = respondentId;
		this.regionId = regionId;
		this.woredaId = woredaId;
		this.kebele = kebele;
		this.telephone = telephone;
		this.mobile = mobile;
		this.fax = fax;
		this.pobox = pobox;
		this.email = email;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	

	/**
	 * @param id
	 * @param respondentId
	 * @param regionId
	 * @param woredaId
	 * @param kebele
	 * @param telephone
	 * @param mobile
	 * @param fax
	 * @param pobox
	 * @param email
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public RespondentAddress(int id, int respondentId, int regionId,
			int woredaId, String kebele, String telephone, String mobile,
			String fax, String pobox, String email, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.respondentId = respondentId;
		this.regionId = regionId;
		this.woredaId = woredaId;
		this.kebele = kebele;
		this.telephone = telephone;
		this.mobile = mobile;
		this.fax = fax;
		this.pobox = pobox;
		this.email = email;
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
	 * @return the respondentId
	 */
	public int getRespondentId() {
		return respondentId;
	}



	/**
	 * @param respondentId the respondentId to set
	 */
	public void setRespondentId(int respondentId) {
		this.respondentId = respondentId;
	}



	/**
	 * @return the regionId
	 */
	public int getRegionId() {
		return regionId;
	}



	/**
	 * @param regionId the regionId to set
	 */
	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}



	/**
	 * @return the woredaId
	 */
	public int getWoredaId() {
		return woredaId;
	}



	/**
	 * @param woredaId the woredaId to set
	 */
	public void setWoredaId(int woredaId) {
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
	 * @return the telephone
	 */
	public String getTelephone() {
		return telephone;
	}



	/**
	 * @param telephone the telephone to set
	 */
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}



	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}



	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}



	/**
	 * @return the fax
	 */
	public String getFax() {
		return fax;
	}



	/**
	 * @param fax the fax to set
	 */
	public void setFax(String fax) {
		this.fax = fax;
	}



	/**
	 * @return the pobox
	 */
	public String getPobox() {
		return pobox;
	}



	/**
	 * @param pobox the pobox to set
	 */
	public void setPobox(String pobox) {
		this.pobox = pobox;
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



	public void save() {
		try {
			String sqlStr = "insert into tbl_respondent_address values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getRespondentId());
			pStmt.setInt(3, this.getRegionId());
			pStmt.setInt(4, this.getWoredaId());
			pStmt.setString(5, this.getKebele());
			pStmt.setString(6, this.getTelephone());
			pStmt.setString(7, this.getMobile());
			pStmt.setString(8, this.getFax());
			pStmt.setString(9, this.getPobox());
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

	public static void update(RespondentAddress respondentAddress) {
		try {
			String sqlStr = "update tbl_respondent_address set respondent_id = ?, region_id = ?," +
					"woreda_id = ?, kebele = ?, telephone = ?, mobile = ?, fax = ?, pobox = ?, email = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, respondentAddress.getRespondentId());
			pStmt.setInt(2, respondentAddress.getRegionId());
			pStmt.setInt(3, respondentAddress.getWoredaId());
			pStmt.setString(4, respondentAddress.getKebele());
			pStmt.setString(5, respondentAddress.getTelephone());
			pStmt.setString(6, respondentAddress.getMobile());
			pStmt.setString(7, respondentAddress.getFax());
			pStmt.setString(8, respondentAddress.getPobox());
			pStmt.setString(9, respondentAddress.getEmail());
			pStmt.setInt(10, respondentAddress.getModifiedBy());
			pStmt.setDate(11, respondentAddress.getModificationDate());
			pStmt.setInt(12, respondentAddress.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteRespondentAddress(int id) {
		try {
			String sqlStr = "delete from tbl_respondent_address where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<RespondentAddress> getallRespondentAddresses() {
		List<RespondentAddress> list = new ArrayList<RespondentAddress>();
		RespondentAddress respondentAddress = null;
		try {
			String query = "select * from tbl_respondent_address";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				respondentAddress = new RespondentAddress(rSet.getInt("id"), rSet.getInt("respondent_id"), 
						rSet.getInt("region_id"), rSet.getInt("woreda_id"), rSet.getString("kebele"), 
						rSet.getString("telephone"), rSet.getString("mobile"), rSet.getString("fax"), rSet.getString("pobox"), rSet.getString("email"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(respondentAddress);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static RespondentAddress getRespondentAddressForThisRespondent(int respondentId){
		RespondentAddress respondentAddress = null;
		try {
			String query = "select * from tbl_respondent_address where respondent_id = "+respondentId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				respondentAddress = new RespondentAddress(rSet.getInt("id"), rSet.getInt("respondent_id"), 
						rSet.getInt("region_id"), rSet.getInt("woreda_id"), rSet.getString("kebele"), 
						rSet.getString("telephone"), rSet.getString("mobile"), rSet.getString("fax"), rSet.getString("pobox"), rSet.getString("email"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return respondentAddress;
	}

	public static RespondentAddress getRespondentAddress(int id) {
		RespondentAddress respondentAddress = null;
		try {
			String query = "select * from tbl_respondent_address where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				respondentAddress = new RespondentAddress(rSet.getInt("id"), rSet.getInt("respondent_id"), 
						rSet.getInt("region_id"), rSet.getInt("woreda_id"), rSet.getString("kebele"), 
						rSet.getString("telephone"), rSet.getString("mobile"), rSet.getString("fax"), rSet.getString("pobox"), rSet.getString("email"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return respondentAddress;
	}
}// end class
