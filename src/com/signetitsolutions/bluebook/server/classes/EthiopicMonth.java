/**
 * 
 */
package com.signetitsolutions.bluebook.server.classes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 * 
 */
public class EthiopicMonth {
	private int id;
	private int monthIndex;
	private String monthName;

	/**
	 * 
	 */
	public EthiopicMonth() {
	}

	/**
	 * @param monthIndex
	 * @param monthName
	 */
	public EthiopicMonth(int monthIndex, String monthName) {
		this.monthIndex = monthIndex;
		this.monthName = monthName;
	}

	/**
	 * @param id
	 * @param monthIndex
	 * @param monthName
	 */
	public EthiopicMonth(int id, int monthIndex, String monthName) {
		this.id = id;
		this.monthIndex = monthIndex;
		this.monthName = monthName;
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
	 * @return the monthIndex
	 */
	public int getMonthIndex() {
		return monthIndex;
	}

	/**
	 * @param monthIndex
	 *            the monthIndex to set
	 */
	public void setMonthIndex(int monthIndex) {
		this.monthIndex = monthIndex;
	}

	/**
	 * @return the monthName
	 */
	public String getMonthName() {
		return monthName;
	}

	/**
	 * @param monthName
	 *            the monthName to set
	 */
	public void setMonthName(String monthName) {
		this.monthName = monthName;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_ethiopic_month values(?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getMonthIndex());
			pStmt.setString(3, this.getMonthName());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(EthiopicMonth ethiopicMonth) {
		try {
			String sqlStr = "update tbl_ethiopic_month set month_index = ?, month_name = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, ethiopicMonth.getMonthIndex());
			pStmt.setString(2, ethiopicMonth.getMonthName());
			pStmt.setInt(3, ethiopicMonth.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_ethiopic_month where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<EthiopicMonth> getAllEthiopicMonths() {
		List<EthiopicMonth> list = new ArrayList<EthiopicMonth>();
		EthiopicMonth ethiopicMonth = null;
		try {
			String query = "select * from tbl_ethiopic_month order by month_index asc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				ethiopicMonth = new EthiopicMonth(rSet.getInt("id"), rSet.getInt("month_index"), rSet.getString("month_name"));
				list.add(ethiopicMonth);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static EthiopicMonth getEthiopicMonth(int id) {
		EthiopicMonth ethiopicMonth = null;
		try {
			String query = "select * from tbl_ethiopic_month where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				ethiopicMonth = new EthiopicMonth(rSet.getInt("id"), rSet.getInt("month_index"), rSet.getString("month_name"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return ethiopicMonth;
	}
	
	public static EthiopicMonth getEthiopicMonthByMonthIndex(int index){
		EthiopicMonth ethiopicMonth = null;
		try {
			String query = "select * from tbl_ethiopic_month where month_index = "+index;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				ethiopicMonth = new EthiopicMonth(rSet.getInt("id"), rSet.getInt("month_index"), rSet.getString("month_name"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return ethiopicMonth;
	}
}// end class
