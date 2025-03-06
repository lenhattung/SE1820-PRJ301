<%-- 
    Document   : bookForm
    Created on : Feb 27, 2025, 8:16:21 AM
    Author     : tungi
--%>
<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page import="dto.BookDTO"%>
<%@page import="java.awt.print.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Management</title>
        <style>
            * {
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            body {
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                min-height: 100vh;
            }

            .page-content {
                padding: 40px 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: calc(100vh - 150px); /* Account for header and footer */
            }

            .form-container {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                width: 100%;
                max-width: 600px;
                margin: 0 auto;
            }

            h1 {
                color: #2c3e50;
                margin-top: 0;
                margin-bottom: 20px;
                text-align: center;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: 600;
                color: #333;
            }

            input[type="text"],
            input[type="number"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                transition: border-color 0.3s;
            }

            input[type="text"]:focus,
            input[type="number"]:focus {
                border-color: #3498db;
                outline: none;
                box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
            }

            .error-message {
                color: #e74c3c;
                font-size: 14px;
                margin-top: 5px;
            }

            .button-group {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            button, input[type="submit"], input[type="reset"] {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            input[type="submit"] {
                background-color: #2ecc71;
                color: white;
                flex: 1;
                margin-right: 10px;
            }

            input[type="submit"]:hover {
                background-color: #27ae60;
            }

            input[type="reset"] {
                background-color: #e74c3c;
                color: white;
                flex: 1;
                margin-left: 10px;
            }

            input[type="reset"]:hover {
                background-color: #c0392b;
            }

            .error-container {
                background-color: #fff0f0;
                border-left: 4px solid #e74c3c;
                padding: 20px;
                border-radius: 4px;
                margin-bottom: 20px;
            }

            .error-container h1 {
                color: #e74c3c;
                margin-top: 0;
            }

            .back-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #3498db;
                text-decoration: none;
            }

            .back-link:hover {
                text-decoration: underline;
            }

            @media (max-width: 768px) {
                .form-container {
                    padding: 20px;
                }

                .button-group {
                    flex-direction: column;
                }

                input[type="submit"], input[type="reset"] {
                    margin: 5px 0;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="page-content">
            <c:set var="isLoggedIn" value="<%=AuthUtils.isLoggedIn(session)%>"/>
            <c:set var="isAdmin" value="<%=AuthUtils.isAdmin(session)%>"/>
            <c:if test="${isAdmin}">
                <div class="form-container">
                    <h1>Book Information</h1>
                    <jsp:useBean id="book" class="dto.BookDTO" scope="request">
                        <form action="MainController" method="post">
                            <input type="hidden" name="action" value="add"/>

                            <div class="form-group">
                                <label for="txtBookID">Book ID:</label>
                                <input type="text" id="txtBookID" name="txtBookID" value="${book.bookID}"/>
                                <c:if test="${not empty requestScope.txtBookID_error}}">
                                    <div class="error-message">${requestScope.txtBookID_error}</div>
                                </c:if>
                            </div>

                            <div class="form-group">
                                <label for="txtTitle">Title:</label>
                                <input type="text" id="txtTitle" name="txtTitle" value="${book.title}"/>

                                <c:if test="${not empty requestScope.txtTitle_error}}">
                                    <div class="error-message">${requestScope.txtTitle_error}</div>
                                </c:if>
                            </div>

                            <div class="form-group">
                                <label for="txtAuthor">Author:</label>
                                <input type="text" id="txtAuthor" name="txtAuthor" value="${book.author}"/>
                            </div>

                            <div class="form-group">
                                <label for="txtPublishYear">Publish Year:</label>
                                <input type="number" id="txtPublishYear" name="txtPublishYear" value="${book.publishYear}"/>
                            </div>

                            <div class="form-group">
                                <label for="txtPrice">Price:</label>
                                <input type="number" id="txtPrice" name="txtPrice" value="${book.price}"/>
                            </div>

                            <div class="form-group">
                                <label for="txtQuantity">Quantity:</label>
                                <input type="number" id="txtQuantity" name="txtQuantity" value="${book.quantity}"/>
                                <c:if test="${not empty requestScope.txtQuantity_error}}">
                                    <div class="error-message">${requestScope.txtQuantity_error}</div>
                                </c:if>
                            </div>

                            <div class="button-group">
                                <input type="submit" value="Save" />
                                <input type="reset" value="Reset"/>
                            </div>
                        </form>
                    </jsp:useBean>
                    <a href="MainController?action=search" class="back-link">Back to Book List</a>
                </div>
            </c:if>
            <c:if test="${!isLoggedIn}">
                <div class="form-container error-container">
                    <h1>403 Error</h1>
                    <p>You do not have permission to access this content!</p>
                    <a href="MainController?action=search" class="back-link">Back to Book List</a>
                </div>
            </c:if>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>