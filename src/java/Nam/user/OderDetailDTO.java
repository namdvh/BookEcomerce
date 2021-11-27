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
public class OderDetailDTO {
    private int OrderDetailID;
    private String OrderID;
    private String ProductID;
    private int Price;
    private int Quantity;

    public OderDetailDTO() {
    }

    public OderDetailDTO(int OrderDetailID, String OrderID, String ProductID, int Price, int Quantity) {
        this.OrderDetailID = OrderDetailID;
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.Price = Price;
        this.Quantity = Quantity;
    }

    public int getOrderDetailID() {
        return OrderDetailID;
    }

    public void setOrderDetailID(int OrderDetailID) {
        this.OrderDetailID = OrderDetailID;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }
    
}
