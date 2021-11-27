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
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI
 */
public class AddtoCartController extends HttpServlet {

    private static final String ERROR = "user.jsp";
    private static final String SUCCESS = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String bookID = request.getParameter("BookID");
            String name = request.getParameter("Name");
            int Price = Integer.parseInt(request.getParameter("Price"));
            String BookImage = request.getParameter("Image");
            int Quantity = Integer.parseInt(request.getParameter("Quantity"));
            int CategoryID = Integer.parseInt(request.getParameter("CategoryID"));
            String Status=request.getParameter("Satus");
            BookDTO book = new BookDTO(bookID, name, Price, BookImage, Quantity, CategoryID,Status);
            Cart cart;
            HttpSession session = request.getSession();
            cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart();
            }

            List<BookDTO> booklist = BookDAO.selectBook();
            BookDTO newBook = null;
            int CateQuantity = 0;
            for (BookDTO bdto : booklist) {
                if (bdto.getBookID().equals(book.getBookID())) {
                    CateQuantity = bdto.getQuantity() - book.getQuantity();
                    if (CateQuantity >=0) {
                        cart.add(book);
                        session.setAttribute("CART", cart);
                        url = SUCCESS;
                        String message = "Ban vua chon " + Quantity + " " + name + " thanh cong!!!";
                        request.setAttribute("SHOPPING_MESSAGE", message);
                        break;
                    } else {
                        String error_message = "Error: Quantity of " + name + " book Is larger the avalable Quantity"
                                + " Please view quantity in shopping cart !";
                        request.setAttribute("ERROR_SHOPPING_MESSAGE", error_message);
                        url = ERROR;
                        break;
                    }
                }
            }
        } catch (Exception e) {
            log("Error at AddToCartController: " + e.toString());
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
