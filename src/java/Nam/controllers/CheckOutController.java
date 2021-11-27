/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nam.controllers;

import Nam.Dao.BookDAO;
import Nam.Dao.OrderDAO;
import Nam.Dao.OrderDetailDAO;
import Nam.shopping.Cart;
import Nam.user.BookDTO;
import Nam.user.OderDetailDTO;
import Nam.user.OrderDTO;
import Nam.user.userDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MSI
 */
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "user.jsp";
    private static final String SUCCESS = "user.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            Cart cart;
            HttpSession session = request.getSession();
            cart = (Cart) session.getAttribute("CART");
            userDTO us = (userDTO) session.getAttribute("LOGIN_USER");
            Date date = new Date();
            SimpleDateFormat newDateFormat = new SimpleDateFormat("MM/dd/yyyy");
            int total = Integer.parseInt(request.getParameter("total"));
            OrderDTO odto = new OrderDTO(us.getUserID(), newDateFormat.format(date), us.getAddress(), total);
            if (cart == null) {
                cart = new Cart();
            } else {
                OrderDAO odao = new OrderDAO();
                int count = 1;
                if (odao.insert(odto)) {
                    String OrderID = odao.get(us.getUserID());
                    for (BookDTO cartList : cart.getCart().values()) {
                        OderDetailDTO oddto = new OderDetailDTO(count++, OrderID, cartList.getBookID(), cartList.getPrice(), cartList.getQuantity());
                        OrderDetailDAO detailDAO = new OrderDetailDAO();
                        int OldQuantity=BookDAO.selectQuantity(cartList.getBookID());
                        BookDTO newBookDTO=new BookDTO(cartList.getBookID(), cartList.getBookName(), cartList.getPrice(), cartList.getBookImage(), OldQuantity-cartList.getQuantity(), cartList.getCategoryID(),cartList.getStatus());
                    
                        if (detailDAO.insert(oddto) && BookDAO.updateBooks(newBookDTO)) {
                            url = SUCCESS;
                            String message = "Ban da Order thanh cong";
                            request.setAttribute("CHECKOUT_MESSAGE", message);
                        }
                    }
                }
            }
        } catch (Exception e) {
            log("Error at CheckoutController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
