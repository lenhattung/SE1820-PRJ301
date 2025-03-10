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
import utils.AuthUtils;

/**
 *
 * @author tungi
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    public BookDAO bookDAO = new BookDAO();

    private static final String LOGIN_PAGE = "login.jsp";

    private String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        String strUserID = request.getParameter("txtUserID");
        String strPassword = request.getParameter("txtPassword");
        if (AuthUtils.isValidLogin(strUserID, strPassword)) {
            url = "search.jsp";
            UserDTO user = AuthUtils.getUser(strUserID);
            request.getSession().setAttribute("user", user);
            // search
            url = "search.jsp";
            processSearch(request, response);
        } else {
            request.setAttribute("message", "Incorrect UserID or Password");
            url = "login.jsp";
        }
        return url;
    }

    private String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            request.getSession().invalidate(); // Hủy session
            url = "login.jsp";
        }
        return url;
    }

    private String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            url = "search.jsp";
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm == null) {
                searchTerm = "";
            }
            List<BookDTO> books = bookDAO.searchByTitle2(searchTerm);
            request.setAttribute("books", books);
            request.setAttribute("searchTerm", searchTerm);
        }
        return url;
    }

    private String processDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            String id = request.getParameter("id");
            bookDAO.updateQuantityToZero(id);

            // search
            url = "search.jsp";
            processSearch(request, response);

        }
        return url;
    }

    private String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            try {
                boolean checkError = false;
                String bookID = request.getParameter("txtBookID");
                String title = request.getParameter("txtTitle");
                String author = request.getParameter("txtAuthor");
                int publishYear = Integer.parseInt(request.getParameter("txtPublishYear"));
                double price = Double.parseDouble(request.getParameter("txtPrice"));
                int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                String image = request.getParameter("txtImage");
                if (bookID == null || bookID.trim().isEmpty()) {
                    checkError = true;
                    request.setAttribute("txtBookID_error", "Book ID cannot be empty.");
                }

                if (quantity < 0) {
                    checkError = true;
                    request.setAttribute("txtQuantity_error", "Quantity >=0.");
                }

                BookDTO book = new BookDTO(bookID, title, author, publishYear, price, quantity, image);
                if (!checkError) {
                    bookDAO.create(book);
                    // search
                    url = "search.jsp";
                    processSearch(request, response);
                } else {
                    request.setAttribute("book", book);
                    url = "bookForm.jsp";
                }
            } catch (Exception e) {
            }
        }
        return url;
    }

    private String processUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            try {
                boolean checkError = false;
                String bookID = request.getParameter("txtBookID");
                String title = request.getParameter("txtTitle");
                String author = request.getParameter("txtAuthor");
                int publishYear = Integer.parseInt(request.getParameter("txtPublishYear"));
                double price = Double.parseDouble(request.getParameter("txtPrice"));
                int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                String image = request.getParameter("txtImage");
                if (bookID == null || bookID.trim().isEmpty()) {
                    checkError = true;
                    request.setAttribute("txtBookID_error", "Book ID cannot be empty.");
                }

                if (quantity < 0) {
                    checkError = true;
                    request.setAttribute("txtQuantity_error", "Quantity >=0.");
                }

                BookDTO book = new BookDTO(bookID, title, author, publishYear, price, quantity, image);
                if (!checkError) {
                    bookDAO.update(book);
                    // search
                    url = "search.jsp";
                    processSearch(request, response);
                } else {
                    request.setAttribute("book", book);
                    url = "bookForm.jsp";
                }
            } catch (Exception e) {
            }
        }
        return url;
    }

    private String processEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            String id = request.getParameter("id");
            BookDTO book = bookDAO.readByID(id);
            if (book != null) {
                request.setAttribute("book", book);
                request.setAttribute("action", "update");
                url = "bookForm.jsp";
            } else {
                // search
                url = processSearch(request, response);
            }
        }
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    url = processLogin(request, response);
                } else if (action.equals("logout")) {
                    url = processLogout(request, response);
                } else if (action.equals("search")) {
                    url = processSearch(request, response);
                } else if (action.equals("delete")) {
                    url = processDelete(request, response);
                } else if (action.equals("add")) {
                    url = processAdd(request, response);
                } else if (action.equals("edit")) {
                    url = processEdit(request, response);
                } else if (action.equals("update")) {
                    url = processUpdate(request, response);
                }
            }
        } catch (Exception e) {
            log("Error in MainController: " + e.toString());
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
