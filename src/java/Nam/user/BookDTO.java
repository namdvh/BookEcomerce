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
public class BookDTO {
    private String BookID;
    private String BookName;
    private int Price;
    private int Quantity;
    private int CategoryID;
    private String BookImage;
    private String Status;

    public BookDTO() {
        this.BookID="";
        this.BookName="";
        this.Price=0;
        this.BookImage="";
        this.Quantity=0;
        this.CategoryID=0;
        
    }
    public BookDTO(String BookID, String BookName, int Price,String Image, int Quantity, int CategoryID,String Status) {
        this.BookID = BookID;
        this.BookName = BookName;
        this.Price = Price;
        this.BookImage=Image;
        this.Quantity = Quantity;
        this.CategoryID = CategoryID;
        this.Status = Status;
    }

    public String getBookID() {
        return BookID;
    }

    public void setBookID(String BookID) {
        this.BookID = BookID;
    }

    public String getBookName() {
        return BookName;
    }

    public void setBookName(String BookName) {
        this.BookName = BookName;
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

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getBookImage() {
        return BookImage;
    }

    public void setBookImage(String BookImage) {
        this.BookImage = BookImage;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }
    
    
}
