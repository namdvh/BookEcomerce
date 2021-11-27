/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nam.controllers;

import Nam.Dao.UserDAO;
import Nam.user.UserError;
import Nam.user.userDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI
 */
public class CreateController extends HttpServlet {

    private static final String ERROR = "createUser.jsp";
    private static final String SUCCESS = "login.html";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError("", "", "", "", "", "", "");
        try {
            String UserID = request.getParameter("UserID");
            String Name = request.getParameter("Name");
            String RoleID = request.getParameter("RoleID");
            String Address = request.getParameter("Address");        
            String Password = request.getParameter("Password");
            String confirm = request.getParameter("confirm");
            String Status=request.getParameter("Status");
            boolean check = true;
            if (UserID.length() > 10 || UserID.length() < 2) {
                userError.setUserIDError("UserID [2,10]!!");
                check = false;
            }
            if (Name.length() > 20 || Name.length() < 5) {
                userError.setNameError("Name [5,20]!!");
                check = false;
            }
            if (RoleID.length() > 5 || RoleID.length() <1) {
                userError.setRoleIDError("UserID [1,5]!!");
                check = false;
            }
            if(Address.length()<5||Address.length()>10){
                userError.setAddress("Address [5,10]!!");
                check=false;
            }
            if(!Status.equalsIgnoreCase("Active") && !Status.equalsIgnoreCase("Inactive") ){
                userError.setStatus("Satus must be Active or Deactive");
                check=false;
            }
            if (!Password.equals(confirm)) {
                userError.setConfirmPasswordError("hai password khong giong nhau!!!");
                check = false;
            }
            if (check) {
                UserDAO dao = new UserDAO();
                userDTO user = new userDTO(UserID, Name, RoleID, Address,Password,Status);
                boolean checkInsert = dao.insertUseNew(user);
                if (checkInsert) {
                    url = SUCCESS;

                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
               log("Error at CreateController:" + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserIDError("Duplicated UserID!!");
                request.setAttribute("USER_ERROR", userError);
            }
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
