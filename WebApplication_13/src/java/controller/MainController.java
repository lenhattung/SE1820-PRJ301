/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BookDAO;
import dao.UserDAO;
import dto.BookDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tungi
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private BookDAO bookDAO = new BookDAO();

    private static final String LOGIN_PAGE = "login.jsp";

    public UserDTO getUser(String strUserID) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readById(strUserID);
        return user;
    }

    public boolean isValidLogin(String strUserID, String strPassword) {
        UserDTO user = getUser(strUserID);
        System.out.println(user);
//        System.out.println(user.getPassword());
        System.out.println(strPassword);
        return user != null && user.getPassword().equals(strPassword);
    }

    public void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {
            searchTerm = "";
        }
        List<BookDTO> books = bookDAO.searchByTitle2(searchTerm);
        request.setAttribute("books", books);
        request.setAttribute("searchTerm", searchTerm);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            System.out.println("action: " + action);
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    String strUserID = request.getParameter("txtUserID");
                    String strPassword = request.getParameter("txtPassword");
                    if (isValidLogin(strUserID, strPassword)) {
                        url = "search.jsp";
                        UserDTO user = getUser(strUserID);
                        request.getSession().setAttribute("user", user);

                        // search
                        search(request, response);
                    } else {
                        request.setAttribute("message", "Incorrect UserID or Password");
                        url = "login.jsp";
                    }
                } else if (action.equals("logout")) {
                    HttpSession session = request.getSession();
                    if (session.getAttribute("user") != null) {
                        request.getSession().invalidate(); // Hủy bỏ session
                        url = "login.jsp";
                    }
                } else if (action.equals("search")) {
                    HttpSession session = request.getSession();
                    if (session.getAttribute("user") != null) {
                        // search
                        search(request, response);
                        url = "search.jsp";
                    }
                } else if (action.equals("delete")) {
                    HttpSession session = request.getSession();
                    if (session.getAttribute("user") != null) {
                        UserDTO user = (UserDTO) session.getAttribute("user");
                        if (user.getRoleID().equals("AD")) {
                            String id = request.getParameter("id");
                            bookDAO.updateQuantityToZero(id);
                            // search
                            search(request, response);
                            url = "search.jsp";
                        }
                    }
                } else if (action.equals("add")) {
                    HttpSession session = request.getSession();
                    if (session.getAttribute("user") != null) {
                        UserDTO user = (UserDTO) session.getAttribute("user");
                        if (user.getRoleID().equals("AD")) {
                            try {
                                boolean checkError = false;

                                String bookID = request.getParameter("txtBookID");
                                String title = request.getParameter("txtTitle");
                                String author = request.getParameter("txtAuthor");
                                int publishYear = Integer.parseInt(request.getParameter("txtPublishYear"));
                                double price = Double.parseDouble(request.getParameter("txtPrice"));
                                int quantity = Integer.parseInt(request.getParameter("txtQuantity"));

                                if (bookID == null || bookID.trim().isEmpty()) {
                                    checkError = true;
                                    request.setAttribute("txtBookID_error", "Book ID cannot be empty.");
                                }

                                if (quantity < 0) {
                                    checkError = true;
                                    request.setAttribute("txtQuantity_error", "Quantity >=0.");
                                }

                                BookDTO book = new BookDTO(bookID, title, author, publishYear, price, quantity);

                                if (!checkError) {
                                    bookDAO.create(book);
                                    // search
                                    search(request, response);
                                    url = "search.jsp";
                                } else {
                                    url = "bookForm.jsp";
                                    request.setAttribute("book", book);
                                }
                            } catch (Exception e) {
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
