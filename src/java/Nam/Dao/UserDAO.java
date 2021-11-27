/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nam.Dao;

import Nam.user.userDTO;
import Nam.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author MSI
 */
public class UserDAO {

    public userDTO checkLogin(String UserID, String password) throws SQLException {
        userDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " select Name, RoleID, Adress, Status"
                        + " from tblUsers"
                        + " where UserID =? and Password=? and Status='Active' ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, UserID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String Name = rs.getString("Name");
                    String RoleID = rs.getString("RoleID");
                    String Address = rs.getString("Adress");
                    String Status=rs.getString("Status");
                    user = new userDTO(UserID, Name, RoleID, Address, "",Status);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public List<userDTO> getListUser(String search) throws SQLException {
        List<userDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select UserID, Name, RoleID, Adress, Password, Status "
                        + " from tblUsers "
                        + " where Name like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String fullName = rs.getString("Name");
                    String roleID = rs.getString("RoleID");
                    String Adress= rs.getString("Adress");
                    String password = "*****";
                    String Status=rs.getString("Status");
                    list.add(new userDTO(userID, fullName, roleID, Adress, password,Status));
                }
            }

        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean insertUseNew(userDTO user) throws SQLException, NamingException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "insert into tblUsers(UserID, Name, RoleID, Adress, Password, Status)"
                        + " values(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getName());
                stm.setString(3, user.getRoleID());
                stm.setString(4, user.getAddress());
                stm.setString(5, user.getPassword());
                stm.setString(6, user.getStatus());
                check = stm.executeUpdate() > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
      public boolean deleteUser(String userID) throws ClassNotFoundException, SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE tblUsers "
                        + " WHERE UserID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                result = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        }
        return result;
    }
    public boolean updateUser(userDTO user) throws SQLException{
        boolean check=false;
        Connection conn=null;
        PreparedStatement stm=null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql=" UPDATE tblUsers "
                        +" SET Name=?, RoleID=?, Adress=?, Status=? "
                        +" WHERE UserID=? ";
                stm=conn.prepareStatement(sql);
                stm.setString(1, user.getName());
                stm.setString(2, user.getRoleID());
                stm.setString(3, user.getAddress());
                stm.setString(4, user.getStatus());
                stm.setString(5, user.getUserID());
                check=stm.executeUpdate()>0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();         
        }
        return check;
    }
}
