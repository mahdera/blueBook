/**
 * 
 */
package com.signetitsolutions.bluebook.server.classes;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;



/**
 * @author mahder
 *
 */
public class Role {
	 	private int id;
	    private int accountId;
	    private boolean readable;
	    private boolean writable;
	    private boolean updateable;
	    private boolean deletable;
	    private int functionalityId;

	    public Role() {
	    }

	    public Role(int accountId, boolean readable, boolean writable, boolean updateable, boolean deletable, int functionalityId) {
	        this.accountId = accountId;
	        this.readable = readable;
	        this.writable = writable;
	        this.updateable = updateable;
	        this.deletable = deletable;
	        this.functionalityId = functionalityId;
	    }

	    public Role(int id, int accountId, boolean readable, boolean writable, boolean updateable, boolean deletable, int functionalityId) {
	        this.id = id;
	        this.accountId = accountId;
	        this.readable = readable;
	        this.writable = writable;
	        this.updateable = updateable;
	        this.deletable = deletable;
	        this.functionalityId = functionalityId;
	    }

	    public int getAccountId() {
	        return accountId;
	    }

	    public void setAccountId(int accountId) {
	        this.accountId = accountId;
	    }

	    public boolean isDeletable() {
	        return deletable;
	    }

	    public void setDeletable(boolean deletable) {
	        this.deletable = deletable;
	    }

	    

	    /**
		 * @return the functionalityId
		 */
		public int getFunctionalityId() {
			return functionalityId;
		}

		/**
		 * @param functionalityId the functionalityId to set
		 */
		public void setFunctionalityId(int functionalityId) {
			this.functionalityId = functionalityId;
		}

		public boolean isReadable() {
	        return readable;
	    }

	    public void setReadable(boolean readable) {
	        this.readable = readable;
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

		public boolean isUpdateable() {
	        return updateable;
	    }

	    public void setUpdateable(boolean updateable) {
	        this.updateable = updateable;
	    }

	    public boolean isWritable() {
	        return writable;
	    }

	    public void setWritable(boolean writable) {
	        this.writable = writable;
	    }

	    public void addRole() {
	        try {
	            String query = "INSERT INTO tbl_role VALUES(0," + this.getAccountId() + "," + this.isReadable() + ","
	                    + this.isWritable() + "," + this.isUpdateable() + "," + this.isDeletable() + "," + this.getFunctionalityId() + ")";	            
	            DBConnection.writeToDatabase(query);
	            //DBConnection.disconnectDatabase();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	    }

	    public static void deleteRole(int id) {
	        try {
	            String query = "DELETE FROM tbl_role WHERE role_id = " + id;
	            DBConnection.writeToDatabase(query);
	            System.out.println(query);
	            //DBConnection.disconnectDatabase();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	    }
	    
	    public static void deleteRoleWithAccountId(int accountId){
	    	try {
	            String query = "DELETE FROM tbl_role WHERE account_id = " + accountId;
	            DBConnection.writeToDatabase(query);
	            System.out.println(query);
	            //DBConnection.disconnectDatabase();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	    }

	    public static void updateRole(Role role) {
	        try {
	            String query = "UPDATE tbl_role SET can_read = " + role.isReadable() + ", can_write = " + role.isWritable()
	                    + ", can_update = " + role.isUpdateable() + ", can_delete = " + role.isDeletable() + " WHERE role_id = "
	                    + role.getId();
	            System.out.println(query);
	            DBConnection.writeToDatabase(query);
	            //DBConnection.disconnectDatabase();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	    }

	    public static List<Role> getAllRoles() {
	        Role role = null;
	        List<Role> list = new ArrayList<Role>();
	        try {
	            String query = "SELECT * FROM tbl_role";
	            ResultSet rSet = DBConnection.readFromDatabase(query);
	            while (rSet.next()) {
	                role = new Role(rSet.getInt("id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"));
	                list.add(role);
	            }	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	        
	        return list;
	    }

	    public static List<Role> getAllRolesForAccount(Account acct) {
	        Role role = null;
	        List<Role> list = new ArrayList<Role>();
	        try {
	            String query = "SELECT * FROM tbl_role WHERE account_id = " + acct.getAccountId();
	            System.out.println("inside all roles for acct : "+query);
	            ResultSet rSet = DBConnection.readFromDatabase(query);
	            while (rSet.next()) {
	                role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"));
	                list.add(role);
	            }
	            //DBConnection.disconnectDatabase();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	        
	        return list;
	    }
	    
	    public static void createBlankRoleUponUserCreation(int acctId,String userType)
	    {
	        Role role = null;
	        try{	            
	            List<Functionality> functionalityList = Functionality.getAllFunctionalitiesForUserType(userType);
	            Iterator<Functionality> functionalityItr = functionalityList.iterator(); 
	            
	            while(functionalityItr.hasNext()){
	            	Functionality functionality = functionalityItr.next();
	                int functionalityId = functionality.getId();                
	                role = new Role(acctId, false, false, false, false, functionalityId);
	                role.addRole();
	            }//end while loop
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }

	    public static List<Role> getAllUntouchedRoles(List<Role> roleList) {
	        Role role = null;
	        List<Role> list = new ArrayList<Role>();
	        try {
	            if (roleList != null) {
	                Iterator<Role> roleItr = roleList.iterator();
	                while(roleItr.hasNext())
	                {
	                    Role r = roleItr.next();
	                    int roleId = r.getId();
	                    int functionalityId = r.getFunctionalityId();	                    
	                    String query = "SELECT * FROM tbl_functionality WHERE id != "+functionalityId;
	                    ResultSet rSet = DBConnection.readFromDatabase(query);
	                    while(rSet.next())
	                    {
	                        role = new Role(roleId, r.getAccountId(), r.isReadable(), r.isWritable(), r.isUpdateable(), r.isDeletable(), rSet.getInt("id"));
	                        list.add(role);
	                    }//end while rSet
	                }//end while itr
	                
	            }
	            else{
	                String query = "SELECT * FROM tbl_operation";
	                ResultSet rSet = DBConnection.readFromDatabase(query);
	                while(rSet.next())
	                {
	                    role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"));
	                    list.add(role);
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	        return list;
	    }

	    public static Role getRole(int id) {
	        Role role = null;
	        try {
	            String query = "SELECT * FROM tbl_role WHERE id = " + id;
	            ResultSet rSet = DBConnection.readFromDatabase(query);
	            while (rSet.next()) {
	                role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"));
	            }
	            DBConnection.disconnectDatabase();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	        return role;
	    }

	    public static Role getRoleForAccount(Account account) {
	        Role role = null;
	        try {
	            String query = "SELECT * FROM tbl_role WHERE account_id = " + account.getAccountId();
	            ResultSet rSet = DBConnection.readFromDatabase(query);
	            while (rSet.next()) {
	                role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"));
	            }
	            DBConnection.disconnectDatabase();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	        return role;
	    }

	    public static Role getRole(int accountId, int functionalityId) {
	        Role role = null;
	        try {
	            String query = "SELECT * FROM tbl_role WHERE account_id = " + accountId + " AND functionality_id = " + functionalityId;
	            System.out.println("mahder : " + query);
	            ResultSet rSet = DBConnection.readFromDatabase(query);
	            while (rSet.next()) {
	                role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"));
	            }
	            //DBConnection.disconnectDatabase();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	        return role;
	    }

	    @Override
	    public String toString() {
	        return "Role{" + "roleId=" + id + ", accountId=" + accountId + ", readable=" + readable + ", writable=" + writable + ", updateable=" + updateable + ", deletable=" + deletable + ", functionalityId=" + functionalityId + '}';
	    }
}//end class
