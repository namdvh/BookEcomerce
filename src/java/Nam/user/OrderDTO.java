/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nam.user;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author MSI
 */
public class OrderDTO {
    private String UserID;
    private String Date;
    private String Address;
    private int totalMoney;
//    private List<OderDetailDTO> listOrderDT;

    public OrderDTO() {
    }

    public OrderDTO( String UserID, String Date, String Address, int totalMoney) {
        this.UserID = UserID;
        this.Date = Date;
        this.Address = Address;
        this.totalMoney = totalMoney;
//        this.listOrderDT = listOrderDT;
    }
    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }


//    public void setListOrderDT(List<OderDetailDTO> listOrderDT) {
//        this.listOrderDT = listOrderDT;
//    }
//    
    
    
}
