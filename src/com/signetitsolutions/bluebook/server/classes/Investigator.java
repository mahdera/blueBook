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
public class Investigator {
	private int id;
	private String investigatorIdNumber;
	private String fullName;
	private String level;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * 
	 */
	public Investigator() {
	}

	/**
	 * @param investigatorIdNumber
	 * @param fullName
	 * @param level
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Investigator(String investigatorIdNumber, String fullName,
			String level, int modifiedBy, Date modificationDate) {
		this.investigatorIdNumber = investigatorIdNumber;
		this.fullName = fullName;
		this.level = level;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param investigatorIdNumber
	 * @param fullName
	 * @param level
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Investigator(int id, String investigatorIdNumber, String fullName,
			String level, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.investigatorIdNumber = investigatorIdNumber;
		this.fullName = fullName;
		this.level = level;
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
	 * @return the investigatorIdNumber
	 */
	public String getInvestigatorIdNumber() {
		return investigatorIdNumber;
	}

	/**
	 * @param investigatorIdNumber
	 *            the investigatorIdNumber to set
	 */
	public void setInvestigatorIdNumber(String investigatorIdNumber) {
		this.investigatorIdNumber = investigatorIdNumber;
	}

	/**
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * @param fullName
	 *            the fullName to set
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/**
	 * @return the level
	 */
	public String getLevel() {
		return level;
	}

	/**
	 * @param level
	 *            the level to set
	 */
	public void setLevel(String level) {
		this.level = level;
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
			String sqlStr = "insert into tbl_investigator values(?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getInvestigatorIdNumber());
			pStmt.setString(3, this.getFullName());
			pStmt.setString(4, this.getLevel());
			pStmt.setInt(5, this.getModifiedBy());
			pStmt.setDate(6, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Investigator investigator) {
		try {
			String sqlStr = "update tbl_investigator set full_name = ?, level = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, investigator.getFullName());
			pStmt.setString(2, investigator.getLevel());
			pStmt.setInt(3, investigator.getModifiedBy());
			pStmt.setDate(4, investigator.getModificationDate());
			pStmt.setInt(5, investigator.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_investigator where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Investigator> getAllInvestigator() {
		List<Investigator> list = new ArrayList<Investigator>();
		Investigator investigator = null;
		try {
			String query = "select * from tbl_investigator order by full_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigator = new Investigator(rSet.getInt("id"),rSet.getString("investigator_id_number"),
						rSet.getString("full_name"),rSet.getString("level"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(investigator);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Investigator> getAllInvestigatorsOfLevel(String investigatorLevel){
		List<Investigator> list = new ArrayList<Investigator>();
		Investigator investigator = null;
		try {
			String query = "select * from tbl_investigator where level = '"+investigatorLevel+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigator = new Investigator(rSet.getInt("id"),rSet.getString("investigator_id_number"),
						rSet.getString("full_name"),rSet.getString("level"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(investigator);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Investigator> getAllInvestigatorForInvestigatorAssignment(String investigatorLevel){
		List<Investigator> list = new ArrayList<Investigator>();
		Investigator investigator = null;
		String query = null;
		if(investigatorLevel.equalsIgnoreCase("all")){
			query = "select tbl_investigator.*, tbl_investigator_assignment.date_assigned " +
					"from tbl_investigator " +
					"left join tbl_investigator_assignment " +
					"on tbl_investigator.id = tbl_investigator_assignment.investigator_id " +
					"order by date_assigned";
		}else{
			query = "select tbl_investigator.*, tbl_investigator_assignment.date_assigned " +
					"from tbl_investigator " +
					"left join tbl_investigator_assignment " +
					"on tbl_investigator.id = tbl_investigator_assignment.investigator_id " +
					"where tbl_investigator.level = '"+investigatorLevel+"' order by date_assigned";
		}
		try {			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigator = new Investigator(rSet.getInt("id"),rSet.getString("investigator_id_number"),
						rSet.getString("full_name"),rSet.getString("level"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(investigator);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Investigator getInvestigator(int id) {
		Investigator investigator = null;
		try {
			String query = "select * from tbl_investigator where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigator = new Investigator(rSet.getInt("id"),rSet.getString("investigator_id_number"),
						rSet.getString("full_name"),rSet.getString("level"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigator;
	}
	
	public static int getMaxInvestigatorIdNow(){
		int id = 0;
		try{
			String query = "select max(id) as m from tbl_investigator";
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
	
	public static Investigator getInvestigatorByName(String fullName){
		Investigator investigator = null;
		try{
			String query = "select * from tbl_investigator where full_name like '"+fullName+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigator = new Investigator(rSet.getInt("id"),rSet.getString("investigator_id_number"),
						rSet.getString("full_name"),rSet.getString("level"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return investigator;
	}
	
	public static Investigator getInvestigatorUsingIdNumber(String investigatorIdNumber){
		Investigator investigator = null;
		try {
			String query = "select * from tbl_investigator where investigator_id_number = '"+investigatorIdNumber+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				investigator = new Investigator(rSet.getInt("id"),rSet.getString("investigator_id_number"),
						rSet.getString("full_name"),rSet.getString("level"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return investigator;
	}
}// end class
