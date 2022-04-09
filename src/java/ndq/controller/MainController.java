package ndq.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh Hoang
 */
@MultipartConfig
public class MainController extends HttpServlet {

    private static final String HOME = "HomeController";
    private static final String CATEGORY = "SearchShoesByCategoryID";
    private static final String USER = "UserController";
    private static final String ADMIN = "AdminController";
    private static final String LOGOUT = "LogoutController";
    private static final String DETAIL = "DetailController";
    private static final String ACS = "AscShoesController";
    private static final String DESC = "DescShoesController";
    private static final String CREATE = "CreateController";
    private static final String VIEW_UPDATE = "GetShoesByIDController";
    private static final String DELETE = "DeleteController";

    private static final String ADD = "ViewAddController";
    private static final String ERROR = "error.jsp";
    private static final String VIEW_LOGIN = "login.jsp";
    private static final String VIEW_CREATE = "create.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String action = request.getParameter("action");
        try {
            if (action == null) {
                url = HOME;
            } else if ("searchCategory".equals(action)) {
                url = CATEGORY;
            } else if ("login".equals(action)) {
                url = VIEW_LOGIN;
            } else if ("user".equals(action)) {
                url = USER;
            } else if ("logout".equals(action)) {
                url = LOGOUT;
            } else if ("detail".equals(action)) {
                url = DETAIL;
            } else if ("acs".equals(action)) {
                url = ACS;
            } else if ("desc".equals(action)) {
                url = DESC;
            } else if ("viewCreate".equals(action)) {
                url = VIEW_CREATE;
            } else if ("create".equals(action)) {
                url = CREATE;
            } else if ("admin".equals(action)) {
                url = ADMIN;
            } else if ("update".equals(action)) {
                url = VIEW_UPDATE;
            } else if ("delete".equals(action)) {
                url = DELETE;
            } else if ("add".equals(action)) {
                url = ADD;
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
