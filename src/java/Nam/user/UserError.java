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
public class UserError {
    private String UserIDError;
    private String NameError;
    private String roleIDError;
    private String Address;
    private String Status;
    private String passwordError;
    private String confirmPasswordError;
    

    public UserError() {
        
    }

    public UserError(String UserIDError, String NameError, String roleIDError, String Address, String Status, String passwordError, String confirmPasswordError) {
        this.UserIDError = UserIDError;
        this.NameError = NameError;
        this.roleIDError = roleIDError;
        this.Address = Address;
        this.Status = Status;
        this.passwordError = passwordError;
        this.confirmPasswordError = confirmPasswordError;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }


    public String getUserIDError() {
        return UserIDError;
    }

    public void setUserIDError(String UserIDError) {
        this.UserIDError = UserIDError;
    }

    public String getNameError() {
        return NameError;
    }

    public void setNameError(String NameError) {
        this.NameError = NameError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmPasswordError() {
        return confirmPasswordError;
    }

    public void setConfirmPasswordError(String confirmPasswordError) {
        this.confirmPasswordError = confirmPasswordError;
    }

   
    


    
   

}
