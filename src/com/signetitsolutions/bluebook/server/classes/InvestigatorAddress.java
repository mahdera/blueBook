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
public class InvestigatorAddress {
	private int id;
	private int investigatorId;
	private String region;
	private String woreda;
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
	public InvestigatorAddress() {
	}

	/**
	 * @param investigatorId
	 * @param region
	 * @param woreda
	 * @param kebele
	 * @param telephone
	 * @param mobile
	 * @param fax
	 * @param pobox
	 * @param email
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public InvestigatorAddress(int investigatorId, String region,
			String woreda, String kebele, String telephone, String mobile,
			String fax, String pobox, String email, int modifiedBy,
			Date modificationDate) {
		this.investigatorId = investigatorId;
		this.region = region;
		this.woreda = woreda;
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
	 * @param investigatorId
	 * @param region
	 * @param woreda
	 * @param kebele
	 * @param telephone
	 * @param mobile
	 * @param fax
	 * @param pobox
	 * @param email
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public InvestigatorAddress(int id, int investigatorId, String region,
			String woreda, String kebele, String telephone, String mobile,
			String fax, String pobox, String email, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.investigatorId = investigatorId;
		this.region = region;
		this.woreda = woreda;
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
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the investigatorId
	 */
	public int getInvestigatorId() {
		return investigatorId;
	}

	/**
	 * @param investigatorId
	 *            the investigatorId to set
	 */
	public void setInvestigatorId(int investigatorId) {
		this.investigatorId = investigatorId;
	}

	/**
	 * @return the region
	 */
	public String getRegion() {
		return region;
	}

	/**
	 * @param region
	 *            the region to set
	 */
	public void setRegion(String region) {
		this.region = region;
	}

	/**
	 * @return the woreda
	 */
	public String getWoreda() {
		return woreda;
	}

	/**
	 * @param woreda
	 *            the woreda to set
	 */
	public void setWoreda(String woreda) {
		this.woreda = woreda;
	}

	/**
	 * @return the kebele
	 */
	public String getKebele() {
		return kebele;
	}

	/**
	 * @param kebele
	 *            the kebele to set
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
	 * @param telephone
	 *            the telephone to set
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
	 * @param mobile
	 *            the mobile to set
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
	 * @param fax
	 *            the fax to set
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
	 * @param pobox
	 *            the pobox to set
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
	 * @param email
	 *            the email to set
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
	 * @param modifiedBy
	 *            the modifiedBy to set
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
	 * @param modificationDate
	 *            the modificationDate to set
	 */
	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_investigator_address values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getInvestigatorId());
			pStmt.setString(3, this.getRegion());
			pStmt.setString(4, this.getWoreda());
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

	public static void update(InvestigatorAddress investigatorAddress) {
		try {
			String sqlStr = "update tbl_investigator_address set investigator_id = ?, region = ?," +
					"woreda = ?, kebele = ?, telephone = ?, mobile = ?, fax = ?, pobox = ?, email = ?," +
					"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, investigatorAddress.getInvestigatorId());
			pStmt.setString(2, investigatorAddress.getRegion());
			pStmt.setString(3, investigatorAddress.getWoreda());
			pStmt.setString(4, investigatorAddress.getKebele());
			pStmt.setString(5, investigatorAddress.getTelephone());
			pStmt.setString(6, investigatorAddress.getMobile());
			pStmt.setString(7, investigatorAddress.getFax());
			pStmt.setString(8, investigatorAddress.getPobox());
			pStmt.setString(9, investigatorAddress.getEmail());
			pStmt.setInt(10, investigatorAddress.getModifiedBy());
			pStmt.setDate(11, investigatorAddress.getModificationDate());
			pStmt.setInt(12, investigatorAddress.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_investigator_address where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<InvestigatorAddress> getAllInvestigatorAddresses() {
		List<InvestigatorAddress> list = new ArrayList<InvestigatorAddress>();
		InvestigatorAddress investigatorAddress = null;
		try {
			String query = "select * from tbl_investigator_address order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorAddress = new InvestigatorAddress(rSet.getInt("id"),rSet.getInt("investigator_id"),
						rSet.getString("region"),rSet.getString("woreda"),rSet.getString("kebele"),
						rSet.getString("telephone"),rSet.getString("mobile"),rSet.getString("fax"),
						rSet.getString("pobox"),rSet.getString("email"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(investigatorAddress);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static InvestigatorAddress getInvestigatorAddress(int id) {
		InvestigatorAddress investigatorAddress = null;
		try {
			String query = "select * from tbl_investigator_address order by modification_date desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorAddress = new InvestigatorAddress(rSet.getInt("id"),rSet.getInt("investigator_id"),
						rSet.getString("region"),rSet.getString("woreda"),rSet.getString("kebele"),
						rSet.getString("telephone"),rSet.getString("mobile"),rSet.getString("fax"),
						rSet.getString("pobox"),rSet.getString("email"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));								
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigatorAddress;
	}
	
	public static InvestigatorAddress getInvestigatorAddressForThisInvestigator(int investigatorId){
		InvestigatorAddress investigatorAddress = null;
		try {
			String query = "select * from tbl_investigator_address where investigator_id = "+investigatorId;			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigatorAddress = new InvestigatorAddress(rSet.getInt("id"),rSet.getInt("investigator_id"),
						rSet.getString("region"),rSet.getString("woreda"),rSet.getString("kebele"),
						rSet.getString("telephone"),rSet.getString("mobile"),rSet.getString("fax"),
						rSet.getString("pobox"),rSet.getString("email"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));								
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigatorAddress;
	}
}// end class
