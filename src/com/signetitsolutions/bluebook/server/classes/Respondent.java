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
public class Respondent {
	private int id;
	private String respondentIdNumber;
	private String name;
	private String structure;
	private String sector;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * @param respondentIdNumber
	 * @param name
	 * @param structure
	 * @param sector
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Respondent(String respondentIdNumber, String name, String structure,
			String sector,int modifiedBy,Date modificationDate) {
		this.respondentIdNumber = respondentIdNumber;
		this.name = name;
		this.structure = structure;
		this.sector = sector;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param respondentIdNumber
	 * @param name
	 * @param structure
	 * @param sector
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Respondent(int id, String respondentIdNumber, String name,
			String structure, String sector, int modifiedBy,Date modificationDate) {
		this.id = id;
		this.respondentIdNumber = respondentIdNumber;
		this.name = name;
		this.structure = structure;
		this.sector = sector;
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
	 * @return the respondentIdNumber
	 */
	public String getRespondentIdNumber() {
		return respondentIdNumber;
	}
	/**
	 * @param respondentIdNumber the respondentIdNumber to set
	 */
	public void setRespondentIdNumber(String respondentIdNumber) {
		this.respondentIdNumber = respondentIdNumber;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the structure
	 */
	public String getStructure() {
		return structure;
	}
	/**
	 * @param structure the structure to set
	 */
	public void setStructure(String structure) {
		this.structure = structure;
	}
	/**
	 * @return the sector
	 */
	public String getSector() {
		return sector;
	}
	/**
	 * @param sector the sector to set
	 */
	public void setSector(String sector) {
		this.sector = sector;
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
			String sqlStr = "insert into tbl_respondent values(?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getRespondentIdNumber());
			pStmt.setString(3, this.getName());
			pStmt.setString(4, this.getStructure());
			pStmt.setString(5, this.getSector());
			pStmt.setInt(6, this.getModifiedBy());
			pStmt.setDate(7, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(Respondent respondent){
		try {
			String sqlStr = "update tbl_respondent set respondent_id_number = ?, name = ?," +
					"structure = ?, sector = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, respondent.getRespondentIdNumber());
			pStmt.setString(2, respondent.getName());
			pStmt.setString(3, respondent.getStructure());
			pStmt.setString(4, respondent.getSector());
			pStmt.setInt(5, respondent.getModifiedBy());
			pStmt.setDate(6, respondent.getModificationDate());
			pStmt.setInt(7, respondent.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(int id){
		try {
			String sqlStr = "delete from tbl_respondent where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<Respondent> getAllRespondents(){
		List<Respondent> list = new ArrayList<Respondent>();
		Respondent respondent = null;
		try {
			String query = "select * from tbl_respondent order by name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				respondent = new Respondent(rSet.getInt("id"), rSet.getString("respondent_id_number"), 
						rSet.getString("name"), rSet.getString("structure"), rSet.getString("sector"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(respondent);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Respondent getRespondent(int id){
		Respondent respondent = null;
		try {
			String query = "select * from tbl_respondent where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				respondent = new Respondent(rSet.getInt("id"), rSet.getString("respondent_id_number"), 
						rSet.getString("name"), rSet.getString("structure"), rSet.getString("sector"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return respondent;
	}
	
	public static Respondent fetchRespondentUsingRespondentIdNumber(String respondentIdNumber){
		Respondent respondent = null;
		try {
			String query = "select * from tbl_respondent where respondent_id_number = '"+respondentIdNumber+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				respondent = new Respondent(rSet.getInt("id"), rSet.getString("respondent_id_number"), 
						rSet.getString("name"), rSet.getString("structure"), rSet.getString("sector"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return respondent;
	}
	
	public static int getMaxRespondentIdNow(){
		int id = 0;
		try{
			String query = "select max(id) as m from tbl_respondent";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				id = rSet.getInt("m");
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
