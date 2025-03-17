<%-- 
    Document   : search
    Created on : Feb 13, 2025, 11:27:20 AM
    Author     : tungi
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.BookDTO"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-16WWW">
        <title>JSP Page</title>

        <style>
            .book-table {
                width: 100%;
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 14px;
                font-family: Arial, sans-serif;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            .book-table thead th {
                background-color: #009879;
                color: #ffffff;
                text-align: left;
                font-weight: bold;
                padding: 12px 15px;
            }

            .book-table tbody tr {
                border-bottom: 1px solid #dddddd;
            }

            .book-table tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }

            .book-table tbody tr:last-of-type {
                border-bottom: 2px solid #009879;
            }

            .book-table tbody td {
                padding: 12px 15px;
            }

            .book-table tbody tr:hover {
                background-color: #f5f5f5;
                transition: 0.3s ease;
            }
            /* Search section styles */
            .search-section {
                background-color: #fff;
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                display: flex;
                align-items: center;
            }

            .search-section form {
                display: flex;
                align-items: center;
                flex-grow: 1;
            }

            .search-section label {
                margin-right: 10px;
                font-weight: bold;
                color: #333;
            }

            .search-input {
                flex-grow: 1;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
                margin-right: 10px;
                transition: border-color 0.3s;
            }

            .search-input:focus {
                border-color: #009879;
                outline: none;
                box-shadow: 0 0 0 2px rgba(0, 152, 121, 0.2);
            }

            .search-btn {
                background-color: #009879;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 10px 15px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.3s;
            }

            .search-btn:hover {
                background-color: #00806a;
            }

            /* Add button styles */
            .add-btn {
                display: inline-block;
                background-color: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                padding: 10px 15px;
                margin-bottom: 20px;
                font-weight: bold;
                transition: background-color 0.3s;
            }

            .add-btn:hover {
                background-color: #0069d9;
                text-decoration: none;
            }

            /* Add a nice icon to the add button */
            .add-btn::before {
                content: "+";
                margin-right: 5px;
                font-weight: bold;
            }
            /* Responsive design */
            @media screen and (max-width: 600px) {
                .book-table {
                    font-size: 12px;
                }

                .book-table thead th,
                .book-table tbody td {
                    padding: 8px 10px;
                }
            }
        </style> 
    </head>
    <body> 
        <%@include file="header.jsp" %>
        <div style="min-height: 500px; padding: 10px">
            <c:set var="isLoggedIn" value="<%=AuthUtils.isLoggedIn(session)%>"/>
            <c:set var="isAdmin" value="<%=AuthUtils.isAdmin(session)%>"/>


            <c:if test="${isLoggedIn}">
                <c:set var="searchTerm" value="${requestScope.searchTerm==null?'':requestScope.searchTerm}" />
                <div class="search-section">
                    <form action="MainController">
                        <input type="hidden" name="action" value="search"/>
                        <label for="searchInput">Search Books:</label>
                        <input type="text" id="searchInput" name="searchTerm" value="${searchTerm}" class="search-input" placeholder="Enter book title, author or ID..."/>
                        <input type="submit" value="Search" class="search-btn"/>
                    </form>
                </div>
                <c:if test="${isAdmin}">
                    <a href="bookForm.jsp" class="add-btn">
                        Add
                    </a>
                </c:if>
                <c:if test="${not empty requestScope.books}">
                    <table class="book-table">
                        <thead>
                            <tr>
                                <th>BookID</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>Author</th>
                                <th>PublishYear</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                    <c:if test="${isAdmin}">
                                    <th>Action</th>
                                    </c:if>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="b" items="${requestScope.books}">
                                <tr>
                                    <td>${b.bookID}</td>
                                    <td><img src="${b.image}" width="150px" /></td>
                                    <td>${b.title}</td>
                                    <td>${b.author}</td>
                                    <td>${b.publishYear}</td>
                                    <td>${b.price}</td>
                                    <td>${b.quantity}</td>
                                    <c:if test="${isAdmin}">
                                    <td><a href="MainController?action=edit&id=${b.bookID}&searchTerm=${searchTerm}">
                                            <img src="assets/images/edit-icon.png"  style="height: 25px"/>                              
                                        </a><a href="MainController?action=delete&id=${b.bookID}&searchTerm=${searchTerm}">
                                            <img src="assets/images/delete-icon.png"  style="height: 25px"/>                              
                                        </a></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
            <c:if test="${!isLoggedIn}">
                You do not have permission to access this content.
            </c:if>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>