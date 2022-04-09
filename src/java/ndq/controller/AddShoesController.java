/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ndq.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import ndq.caterory.CategoryDAO;
import ndq.caterory.CategoryDTO;
import ndq.shoes.AddShoesError;
import ndq.shoes.ShoesDAO;
import ndq.shoes.ShoesDTO;
import ndq.user.UserDAO;
import ndq.user.UserDTO;

/**
 *
 * @author Minh Hoang
 */
@MultipartConfig
public class AddShoesController extends HttpServlet {

    private static final String ERROR = "MainController?action=add";
    private static final String SUCCESS = "MainController?action=admin";
    private static final String UPLOAD_DIR = "img";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        AddShoesError err = new AddShoesError();
        ShoesDAO shoesDAO = new ShoesDAO();
        UserDAO userDAO = new UserDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
        try {
            if (user == null) {
                url = "LogoutController";
            } else {
                String userID = user.getUserID();
                String statusUser = userDAO.getStatus(userID);
                if (statusUser.equals("Active")) {
                    String shoesID = request.getParameter("shoesID");
                    String shoesName = request.getParameter("shoesName");
                    String price = request.getParameter("price");
                    String description = request.getParameter("description");
                    String quantity = request.getParameter("quantity");
                    String category = request.getParameter("category");
                    String fileName = uploadFile(request);

                    boolean check = true;
                    if (shoesDAO.checkShoesID(shoesID)) {
                        err.setShoesIDError("ShoesID already existed !");
                        check = false;
                    } else {
                        if (shoesID.isEmpty()) {
                            err.setShoesIDError("ShoesID not empty");
                            check = false;
                        }
                    }
                    if (shoesName.isEmpty()) {
                        err.setShoesNameError("ShoesName not empty");
                        check = false;
                    }
                    if (description.isEmpty()) {
                        err.setDescriptionError("Description not empty");
                        check = false;
                    }
                    if (price.isEmpty()) {
                        err.setPriceError("Price not empty");
                        check = false;
                    }
                    String regexNumber = "^[0-9]{0,}$";
                    Pattern pattern = Pattern.compile(regexNumber);
                    Matcher matcher = pattern.matcher(price);
                    if (!matcher.find()) {
                        err.setPriceError("Price must be number and positve");
                        check = false;
                    }

                    if (quantity.isEmpty()) {
                        err.setQuantityError("Quantity not empty ");
                        check = false;
                    }

                    Matcher matcherQuantity = pattern.matcher(quantity);
                    if (!matcherQuantity.find()) {
                        err.setQuantityError("Quantity must be number and positve");
                        check = false;
                    }

                    if (check) {
                        ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description, "Active", fileName, category, Float.parseFloat(price), Integer.parseInt(quantity));
                        shoesDAO.addNewShoes(shoes);
                        request.setAttribute("SUCCESS", "Insert successully");
                        url = SUCCESS;
                    } else {
                        request.setAttribute("ERROR_CREATE", err);
                        List<CategoryDTO> listCategory = categoryDAO.getAllCategory();
                        request.setAttribute("LIST_CATEGORY", listCategory);
                        ShoesDTO shoes = new ShoesDTO(shoesID, shoesName, description);
                        request.setAttribute("PRICE", price);
                        request.setAttribute("QUANTITY", quantity);
                        request.setAttribute("SHOES", shoes);
                    }
                } else {
                    url = "LogoutController";
                }

            }

        } catch (Exception e) {
            log("Error: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        try {
            Part filePart = request.getPart("image");
            fileName = (String) getFileName(filePart);

            String applicationPath = request.getServletContext().getRealPath("");
            String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {
                log("Error: " + e.getMessage());
                fileName = "";
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }

        } catch (Exception e) {
            fileName = "";
        }
        return fileName;
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }

        return null;
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
