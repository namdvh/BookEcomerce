/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nam.Dao;

import Nam.user.OderDetailDTO;
import Nam.user.OrderDTO;
import Nam.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author MSI
 */
public class OrderDetailDAO {
    public static boolean insert(OderDetailDTO orderdt) throws SQLException{
        boolean check=false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "INSERT INTO tblOrderDetail (DetailID, OrderID , ProductID, Price, Quantity) "
                    + " VALUES(?, ?, ?, ?, ?)";
            stm = conn.prepareStatement(sql);
            stm.setInt(1, orderdt.getOrderDetailID());
            stm.setString(2, orderdt.getOrderID());
            stm.setString(3, orderdt.getProductID());
            stm.setInt(4, orderdt.getPrice());
            stm.setInt(5, orderdt.getQuantity());
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
}
