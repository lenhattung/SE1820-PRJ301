<%-- 
    Document   : index.jsp
    Created on : Mar 13, 2025, 8:25:31 AM
    Author     : tungi
--%>
<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Catalog - Book Management System</title>
        <link rel="stylesheet" href="assets/css/index.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        
        <div class="page-content">
            <div class="catalog-header">
                <h1>Book Catalog</h1>
                <div class="search-container">
                    <form action="MainController" method="GET">
                        <input type="hidden" name="action" value="listBooks">
                        <input type="text" name="searchTerm" placeholder="Search by title, author..." value="${param.searchTerm}">
                        <button type="submit" class="search-button">Search</button>
                    </form>
                </div>
            </div>
            
            <c:if test="${not empty message}">
                <div class="message-container ${messageType}">
                    <p>${message}</p>
                </div>
            </c:if>
            
            <div class="books-container">
                <c:choose>
                    <c:when test="${empty bookList}">
                        <div class="no-results">
                            <p>No books found. Please try a different search or check back later.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="book-grid">
                            <c:forEach var="book" items="${bookList}">
                                <div class="book-card">
                                    <div class="book-cover">
                                        <c:choose>
                                            <c:when test="${not empty book.image}">
                                                <img src="${book.image}" alt="${book.title}" onerror="this.onerror=null; this.src='assets/images/no-cover.png';">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="no-image">
                                                    <span>No Cover</span>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="book-info">
                                        <h3 class="book-title">${book.title}</h3>
                                        <p class="book-author">by ${book.author}</p>
                                        <p class="book-year">Published: ${book.publishYear}</p>
                                        <div class="book-price-container">
                                            <span class="book-price">$${book.price}</span>
                                            <c:choose>
                                                <c:when test="${book.quantity > 0}">
                                                    <span class="stock in-stock">${book.quantity} in stock</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="stock out-of-stock">Out of stock</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <a href="MainController?action=viewDetail&id=${book.bookID}" class="view-details-btn">View Details</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <!-- Pagination -->
                        <div class="pagination">
                            <c:if test="${currentPage > 1}">
                                <a href="MainController?action=listBooks&page=${currentPage - 1}&searchTerm=${param.searchTerm}" class="pagination-btn">&laquo; Previous</a>
                            </c:if>
                            
                            <div class="pagination-info">
                                Page ${currentPage} of ${totalPages}
                            </div>
                            
                            <c:if test="${currentPage < totalPages}">
                                <a href="MainController?action=listBooks&page=${currentPage + 1}&searchTerm=${param.searchTerm}" class="pagination-btn">Next &raquo;</a>
                            </c:if>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <jsp:include page="footer.jsp"/>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="assets/js/index.js"></script>
    </body>
</html>