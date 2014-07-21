/**
 * 
 */
package com.signetitsolutions.bluebook.server.classes;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;



/**
 * @author TOSHIBA
 *
 */
public class Account {
	private int accountId;
	private int userId;
	private String username;
	private String password;
	private Date accountCreationDate;
	private int modifiedBy;
	private Date modificationDate;

	public Account() {
	}

	public Account(int userId, String username, String password,int modifiedBy,Date modificationDate) {
		this.username = username;
		this.password = password;
		java.util.Date d = new java.util.Date();

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String currentDate = dateFormat.format(cal.getTime());		
		accountCreationDate = Date.valueOf(currentDate);
		this.userId = userId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	public Account(int accountId, int userId, String username, String password,
			Date accountCreationDate,int modifiedBy,Date modificationDate) {
		this.accountId = accountId;
		this.username = username;
		this.password = password;
		this.accountCreationDate = accountCreationDate;
		this.userId = userId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
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

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public Date getAccountCreationDate() {
		return accountCreationDate;
	}

	public void setAccountCreationDate(Date accountCreationDate) {
		this.accountCreationDate = accountCreationDate;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void save() {
		try {
			String sqlStr = "INSERT INTO tbl_account VALUES(?,?,?,MD5(?),?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getUserId());
			pStmt.setString(3, this.getUsername());
			pStmt.setString(4, this.getPassword());
			pStmt.setDate(5, this.getAccountCreationDate());
			pStmt.setInt(6, this.getModifiedBy());
			pStmt.setDate(7, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "DELETE FROM tbl_account WHERE id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void update(Account account) {
		try {
			String sqlStr = "update tbl_account set user_id = ?, username = ?, password = MD(?)," +
					"account_creation_date = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, account.getUserId());
			pStmt.setString(2, account.getUsername());
			pStmt.setString(3, account.getPassword());
			pStmt.setDate(4, account.getAccountCreationDate());
			pStmt.setInt(5, account.getModifiedBy());
			pStmt.setDate(6, account.getModificationDate());
			pStmt.setInt(7, account.getAccountId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Account> getAllAccounts() {
		List<Account> list = new ArrayList<Account>();
		Account account = null;
		try {
			String query = "SELECT * FROM tbl_account order by modification_date desc";			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),rSet.getDate("account_creation_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(account);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static List<Account> getAccountsForApproval() {
		List<Account> list = new ArrayList<Account>();
		Account account = null;
		try {
			String query = "SELECT * FROM tbl_account WHERE status = 'Not Approved'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),rSet.getDate("account_creation_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(account);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Account getApprovedAccount(int id) {
		Account account = null;
		try {
			String query = "SELECT * FROM tbl_account WHERE id = " + id
					+ " AND status = 'Approved'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),rSet.getDate("account_creation_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.disconnectDatabase();
		}
		return account;
	}

	public static Account getAccount(String username, String password,
			String memberType) {
		Account account = null;
		try {
			String query = "SELECT tbl_account.* FROM tbl_account,tbl_user WHERE username = '"
					+ username + "' AND password = MD5('" + password
					+ "') AND tbl_account.user_id = tbl_user.id and user_type = '" + memberType + "'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),rSet.getDate("account_creation_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.disconnectDatabase();
		}
		return account;
	}

	public static Account getAccountForUser(int userId) {
		Account account = null;
		try {
			String query = "SELECT * FROM tbl_account WHERE user_id = "
					+ userId;
			System.out.println("inside get acct mahder : " + query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),rSet.getDate("account_creation_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.disconnectDatabase();
		}
		return account;
	}

	public static Account getAccount(String username, String password) {
		Account account = null;
		try {
			String query = "SELECT tbl_account.* FROM tbl_account,tbl_user WHERE username = '"
					+ username + "' AND password = MD5('" + password + "') and tbl_account.user_id = tbl_user.id";
			System.out.println("inside get acct mahder : " + query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),rSet.getDate("account_creation_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.disconnectDatabase();
		}
		return account;
	}

	public static boolean isThereAnAccount(int accountId, String username,
			String password) {
		boolean isThereAcct = false;
		try {
			String query = "SELECT COUNT(*) AS num FROM tbl_account WHERE username = '"
					+ username
					+ "' AND password = MD5('"
					+ password
					+ "') AND id = " + accountId;			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			int num = 0;
			while (rSet.next()) {
				num = rSet.getInt("num");
				if (num != 0)
					isThereAcct = true;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.disconnectDatabase();
		}
		return isThereAcct;
	}

	public static void updateUsername(int accountId, String currentUsername,
			String newUsername, String currentPassword) {
		try {
			String query = "UPDATE tbl_account SET username = '" + newUsername
					+ "' WHERE id = " + accountId + " AND" + " username = '"
					+ currentUsername + "' AND password = MD5('"
					+ currentPassword + "')";
			DBConnection.writeToDatabase(query);			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void updatePassword(int accountId, String currentUsername,
			String currentPassword, String newPassword, String confirmPassword) {
		if (newPassword.equals(confirmPassword)) {
			try {
				String query = "UPDATE tbl_account SET password = MD5('"
						+ newPassword + "') WHERE id = " + accountId
						+ " AND username = '" + currentUsername
						+ "' AND password = MD5('" + currentPassword + "')";
				DBConnection.writeToDatabase(query);				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnection.disconnectDatabase();
			}
		}
	}

	@Override
	public String toString() {
		return "Account{" + "accountId=" + accountId + "\nuserId=" + userId
				+ "\nusername=" + username + "\npassword=" + password
				+ "\naccountCreationDate=" + accountCreationDate + '}';
	}

	public static int getMaxAccountIdValue() {
		int maxId = 0;
		try {
			String query = "SELECT MAX(id) AS m FROM tbl_account";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				maxId = rSet.getInt("m");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return maxId;
	}

	public static Account getAccount(int accountId) {
		Account account = null;
		try {
			String query = "SELECT * FROM tbl_account WHERE id = " + accountId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),rSet.getDate("account_creation_date"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return account;
	}

	public static void changeUsername(String currentUsername,
			String newUsername, String password) {
		try {
			String command = "UPDATE tbl_account SET username = '"
					+ newUsername + "' WHERE username = '" + currentUsername
					+ "' AND password = MD5('" + password + "')";
			DBConnection.writeToDatabase(command);
			System.out.println(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void changePassword(String currentUsername,
			String currentPassword, String newPassword) {
		try {
			String command = "UPDATE tbl_account SET password = MD5('"
					+ newPassword + "') WHERE username = '" + currentUsername
					+ "' AND password = MD5('" + currentPassword + "')";
			DBConnection.writeToDatabase(command);
			System.out.println(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteAccountForUser(int userId) {
		try {
			String command = "delete from tbl_account where user_id=" + userId;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void resetThisAccount(int accountId, String username,
			String password) {
		try {
			String command = "UPDATE tbl_account SET username = '" + username
					+ "', password = MD5('" + password + "') WHERE id = "
					+ accountId;
			DBConnection.writeToDatabase(command);
			System.out.println(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static boolean isThereAnAccountWithThisUsernameAndPassword(String username,String password){
		boolean isThere = false;
		int c = 0;
		try{
			String query = "select count(*) as c from tbl_account where username = '"+username+"' and password = MD5('"+password+"')";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				c = rSet.getInt("c");
				if(c != 0)
					isThere = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return isThere;
	}
}//end class