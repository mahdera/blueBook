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
public class Label {
	private int id;
	private String labelId;
	private String labelCaption;

	/**
	 * 
	 */
	public Label() {
	}

	/**
	 * @param labelId
	 * @param labelCaption
	 */
	public Label(String labelId, String labelCaption) {
		this.labelId = labelId;
		this.labelCaption = labelCaption;
	}

	/**
	 * @param id
	 * @param labelId
	 * @param labelCaption
	 */
	public Label(int id, String labelId, String labelCaption) {
		this.id = id;
		this.labelId = labelId;
		this.labelCaption = labelCaption;
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
	 * @return the labelId
	 */
	public String getLabelId() {
		return labelId;
	}

	/**
	 * @param labelId
	 *            the labelId to set
	 */
	public void setLabelId(String labelId) {
		this.labelId = labelId;
	}

	/**
	 * @return the labelCaption
	 */
	public String getLabelCaption() {
		return labelCaption;
	}

	/**
	 * @param labelCaption
	 *            the labelCaption to set
	 */
	public void setLabelCaption(String labelCaption) {
		this.labelCaption = labelCaption;
	}

	public void save() {
		try {
			String sqlStr = "insert into tbl_label values(?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getLabelId());
			pStmt.setString(3, this.getLabelCaption());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Label label) {
		try {
			String sqlStr = "update tbl_label set label_id = ?, label_caption = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, label.getLabelId());
			pStmt.setString(2, label.getLabelCaption());
			pStmt.setInt(3, label.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_label where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Label> getAllLabels() {
		List<Label> list = new ArrayList<Label>();
		Label label = null;
		try {
			String query = "select * from tbl_label order by label_caption";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				label = new Label(rSet.getInt("id"), rSet.getString("label_id"), rSet.getString("label_caption"));
				list.add(label);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Label getLabel(int id) {
		Label label = null;
		try {
			String query = "select * from tbl_label where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				label = new Label(rSet.getInt("id"), rSet.getString("label_id"), rSet.getString("label_caption"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return label;
	}
	
	public static Label getLabelUsingLabelId(String labelId){
		Label label = null;
		try {
			String query = "select * from tbl_label where label_id = '"+labelId+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				label = new Label(rSet.getInt("id"), rSet.getString("label_id"), rSet.getString("label_caption"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return label;
	}
}// end class
