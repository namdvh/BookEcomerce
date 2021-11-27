/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nam.user;

/**
 *
 * @author MSI
 */
public class userDTO {
    private String UserID;
    private String Name;
    private String RoleID;
    private String Address;
    private String password;
    private String status;

    public userDTO() {
    }

    public userDTO(String UserID, String Name, String RoleID, String Address, String password, String status) {
        this.UserID = UserID;
        this.Name = Name;
        this.RoleID = RoleID;
        this.Address = Address;
        this.password = password;
        this.status = status;
    }


    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getRoleID() {
        return RoleID;
    }

    public void setRoleID(String RoleID) {
        this.RoleID = RoleID;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
