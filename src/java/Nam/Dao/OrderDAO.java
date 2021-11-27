/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nam.Dao;

import Nam.user.OrderDTO;
import Nam.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MSI
 */
public class OrderDAO {

    public static boolean insert(OrderDTO order) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "INSERT INTO tblOrder (UserID, Date, Adress, totalMoney) "
                    + " VALUES(?,?,?,?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, order.getUserID());
            stm.setString(2, order.getDate());
            stm.setString(3, order.getAddress());
            stm.setInt(4, order.getTotalMoney());
            check = stm.executeUpdate() > 0;
        } catch (Exception e) {
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

    public String get(String UserID) throws SQLException {
        String result=null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = " SELECT OrderID FROM tblOrder"
                    + " WHERE UserID=? ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, UserID);
            rs = stm.executeQuery();
            while (rs.next()) {
                result = rs.getString("ORDERID");
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
        return result;
    }

}
