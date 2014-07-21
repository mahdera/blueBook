/**
 * 
 */
package com.signetitsolutions.bluebook.server.classes;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author mahder
 * 
 */
public class Functionality {
	private int id;
	private String functionalityName;
	private String description;
	private String menuName;
	private int menuRank;

	/**
	 * 
	 */
	public Functionality() {
	}

	/**
	 * @param functionalityName
	 * @param description
	 * @param menuName
	 */
	public Functionality(String functionalityName, String description,
			String menuName,int menuRank) {
		this.functionalityName = functionalityName;
		this.description = description;
		this.menuName = menuName;
		this.menuRank = menuRank;
	}

	/**
	 * @param id
	 * @param functionalityName
	 * @param description
	 * @param menuName
	 */
	public Functionality(int id, String functionalityName, String description,
			String menuName,int menuRank) {
		this.id = id;
		this.functionalityName = functionalityName;
		this.description = description;
		this.menuName = menuName;
		this.menuRank = menuRank;
	}
	
	

	/**
	 * @return the menuRank
	 */
	public int getMenuRank() {
		return menuRank;
	}

	/**
	 * @param menuRank the menuRank to set
	 */
	public void setMenuRank(int menuRank) {
		this.menuRank = menuRank;
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
	 * @return the functionalityName
	 */
	public String getFunctionalityName() {
		return functionalityName;
	}

	/**
	 * @param functionalityName the functionalityName to set
	 */
	public void setFunctionalityName(String functionalityName) {
		this.functionalityName = functionalityName;
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
	 * @return the menuName
	 */
	public String getMenuName() {
		return menuName;
	}

	/**
	 * @param menuName the menuName to set
	 */
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public void addFunctionality() {
		try {
			String command = "INSERT INTO tbl_functionality VALUES(0,'"+this.getFunctionalityName()+"','"+this.getDescription()+"','"+this.getMenuName()+"',"+this.getMenuRank()+"')";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateFunctionality() {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteFunctionality(int id) {
		try {
			String command = "DELETE FROM tbl_functionality WHERE id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Functionality> getAllFunctionalities() {
		List<Functionality> list = new ArrayList<Functionality>();
		Functionality functionality = null;
		try {
			String query = "SELECT * FROM tbl_functionality ORDER BY menu_rank ASC";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				functionality = new Functionality(rSet.getInt("id"),rSet.getString("functionality_name"),rSet.getString("description"),rSet.getString("menu_name"),
						rSet.getInt("menu_rank"));
				list.add(functionality);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Functionality> getAllFunctionalitiesForUserType(String userType){
		List<Functionality> list = new ArrayList<Functionality>();
		Functionality functionality = null;
		try {
			String query = "SELECT * FROM tbl_functionality where for_user = '"+userType+"' ORDER BY menu_rank ASC";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				functionality = new Functionality(rSet.getInt("id"),rSet.getString("functionality_name"),rSet.getString("description"),rSet.getString("menu_name"),
						rSet.getInt("menu_rank"));
				list.add(functionality);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Functionality> getAllFunctionalitiesForUser(String userType,String funType){
		List<Functionality> list = new ArrayList<Functionality>();
		Functionality functionality = null;
		try {
			String query = "SELECT * FROM tbl_functionality where for_user = '"+userType+"' or for_user = '"+funType+"' ORDER BY menu_rank ASC";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				functionality = new Functionality(rSet.getInt("id"),rSet.getString("functionality_name"),rSet.getString("description"),rSet.getString("menu_name"),
						rSet.getInt("menu_rank"));
				list.add(functionality);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Functionality getFunctionality(int id) {
		Functionality functionality = null;
		try {
			String query = "SELECT * FROM tbl_functionality WHERE id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				functionality = new Functionality(rSet.getInt("id"),rSet.getString("functionality_name"),rSet.getString("description"),rSet.getString("menu_name"),
						rSet.getInt("menu_rank"));			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return functionality;
	}
	
	public static Functionality getFunctionalityByFunctionalityName(String functionalityName){
		Functionality functionality = null;
		try {
			String query = "SELECT * FROM tbl_functionality WHERE functionality_name = '"+functionalityName+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				functionality = new Functionality(rSet.getInt("id"),rSet.getString("functionality_name"),rSet.getString("description"),rSet.getString("menu_name"),
						rSet.getInt("menu_rank"));			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return functionality;
	}
}// end class
