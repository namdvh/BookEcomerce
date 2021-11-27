/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nam.shopping;

import Nam.user.BookDTO;
import Nam.user.OderDetailDTO;
import Nam.user.OrderDTO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author MSI
 */
public class Cart {
    private Map<String,BookDTO> cart;

    public Cart() {
        this.cart=new HashMap<>();
        
    }

    public Cart(Map<String,BookDTO> cart) {
        this.cart = cart;
    }

    public Map<String, BookDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, BookDTO> cart) {
        this.cart = cart;
    }
    public void add(BookDTO book){
        if(this.cart==null){
            this.cart=new HashMap<>();
        }
        if(this.cart.containsKey(book.getBookID())){
            int currentQuantity= this.cart.get(book.getBookID()).getQuantity();
            book.setQuantity(currentQuantity+book.getQuantity());
        }
        cart.put(book.getBookID(), book);
    }
    public void Delete(String id){
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }

    }
     public void update(String id,BookDTO newbook) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.replace(id, newbook);
        }
    }
}
