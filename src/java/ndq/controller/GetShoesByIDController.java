/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ndq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ndq.caterory.CategoryDAO;
import ndq.caterory.CategoryDTO;
import ndq.shoes.ShoesDAO;
import ndq.shoes.ShoesDTO;

/**
 *
 * @author Minh Hoang
 */
@WebServlet(name = "GetShoesByIDController", urlPatterns = {"/GetShoesByIDController"})
public class GetShoesByIDController extends HttpServlet {

    private static final String SUCCESS = "update.jsp";
    private static final String ERROR = "MainController?action=admin";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CategoryDAO categoryDAO = new CategoryDAO();
        String url = ERROR;
        ShoesDAO shoesDAO = new ShoesDAO();
        String shoesID = request.getParameter("shoesID");
        try {
            ShoesDTO shoes = shoesDAO.getShoesByID(shoesID);
            String cateName = categoryDAO.getNameByID(shoes.getCategoryID());
            int price = (int) shoes.getPrice();
            if (shoes != null) {
                List<CategoryDTO> listCategory = categoryDAO.getAllCategory();
                request.setAttribute("LIST_CATEGORY", listCategory);
                request.setAttribute("SHOES", shoes);
                request.setAttribute("cateName", cateName);

                request.setAttribute("PRICE", price);
                request.setAttribute("QUANTITY", shoes.getQuantity());
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error :" + e.getMessage());
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
