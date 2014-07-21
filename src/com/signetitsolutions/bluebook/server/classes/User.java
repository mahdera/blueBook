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
 * @author mahder
 * 
 */
public class User {
	private int id;
	private String fullName;	
	private String userType;
	private int modifiedBy;
	private Date modificationDate;
	

	/**
	 * @param firstName
	 * @param lastName
	 * @param userType
	 * @param prId
	 * @param ombudsmanReportingOfficeId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public User(String fullName,String userType,int modifiedBy,Date modificationDate) {
		super();
		this.fullName = fullName;		
		this.userType = userType;		
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	
	

	/**
	 * @param id
	 * @param firstName
	 * @param lastName
	 * @param userType
	 * @param prId
	 * @param ombudsmanReportingOfficeId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public User(int id, String fullName, String userType,int modifiedBy,Date modificationDate) {
		super();
		this.id = id;
		this.fullName = fullName;		
		this.userType = userType;		
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @return the userType
	 */
	public String getUserType() {
		return userType;
	}

	/**
	 * @param userType the userType to set
	 */
	public void setUserType(String userType) {
		this.userType = userType;
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
			String sqlStr = "insert into tbl_user values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getFullName());
			pStmt.setString(3, this.getUserType());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(User user) {
		try {
			String sqlStr = "update tbl_user set full_name = ?, user_type = ?, modified_by = ?," +
					"modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, user.getFullName());
			pStmt.setString(2, user.getUserType());
			pStmt.setInt(3, user.getModifiedBy());
			pStmt.setDate(4, user.getModificationDate());
			pStmt.setInt(5, user.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_user where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<User> getAllUsers() {
		List<User> list = new ArrayList<User>();
		User user = null;
		try {
			String query = "select * from tbl_user";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("full_name"),
						rSet.getString("user_type"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static User getUser(int id) {
		User user = null;
		try {
			String query = "select * from tbl_user where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("full_name"),
						rSet.getString("user_type"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return user;
	}
	
	public static User getUserWith(String firstName,String fatherName,String grandFatherName,String userType) {
		User user = null;
		try {
			String query = "select * from tbl_user where first_name='"+firstName+"' and "+
			"middle_name='"+fatherName+"' and last_name='"+grandFatherName+"' and user_type='"+userType+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("full_name"),
						rSet.getString("user_type"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return user;
	}
	
	public static User getUserWith(String firstName,String fatherName,String userType) {
		User user = null;
		try {
			String query = "select * from tbl_user where first_name='"+firstName+"' and "+
			"last_name='"+fatherName+"' and user_type='"+userType+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("full_name"),
						rSet.getString("user_type"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return user;
	}
	
	public static List<User> getAllUsersWithUserType(String userType){
		List<User> list = new ArrayList<User>();
		User user = null;
		try {
			String query = "select * from tbl_user where user_type = '"+userType+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("full_name"),
						rSet.getString("user_type"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<User> getAllUsersWithThisUserTypeInThisBranch(String userType,int branchId){
		List<User> list = new ArrayList<User>();
		User user = null;
		try{
			String query = "select * from tbl_user where user_type='"+userType+"' and branch_id="+branchId;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("full_name"),
						rSet.getString("user_type"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(user);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static User getUserWith(String fullName,String userType){
		User user = null;
		try {
			String query = "SELECT * FROM tbl_user WHERE full_name = '"+fullName+"' AND user_type = '"+userType+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("full_name"),
						rSet.getString("user_type"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return user;
	}
}// end class
