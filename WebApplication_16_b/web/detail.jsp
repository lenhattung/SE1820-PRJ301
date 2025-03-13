<%-- 
    Document   : detail.jsp
    Created on : Mar 13, 2025, 8:45:53 AM
    Author     : tungi
--%>
<%@page import="dto.BookDTO"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Details - Book Management System</title>
        <link rel="stylesheet" href="assets/css/detail.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        
        <div class="page-content">
            <c:if test="${not empty message}">
                <div class="message-container ${messageType}">
                    <p>${message}</p>
                </div>
            </c:if>
            
            <!-- Breadcrumb Navigation -->
            <div class="breadcrumb">
                <a href="MainController?action=listBooks">Home</a> &gt;
                <a href="MainController?action=listBooks">Books</a> &gt;
                <span>${book.title}</span>
            </div>
            
            <c:choose>
                <c:when test="${empty book}">
                    <div class="error-container">
                        <h1>Book Not Found</h1>
                        <p>The book you are looking for does not exist or has been removed.</p>
                        <a href="MainController?action=listBooks" class="back-link">Return to Book List</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="book-detail-container">
                        <div class="book-image">
                            <c:choose>
                                <c:when test="${not empty book.image}">
                                    <img src="${book.image}" alt="${book.title}" class="book-cover">
                                </c:when>
                                <c:otherwise>
                                    <div class="no-image">
                                        <span>No Image Available</span>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        
                        <div class="book-info">
                            <h1>${book.title}</h1>
                            
                            <div class="book-meta">
                                <p class="author">By <strong>${book.author}</strong></p>
                                <p class="publish-year">Published in <strong>${book.publishYear}</strong></p>
                            </div>
                            
                            <div class="book-price-block">
                                <span class="price">$${book.price}</span>
                                <c:choose>
                                    <c:when test="${book.quantity > 0}">
                                        <span class="stock-info in-stock">In Stock</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="stock-info out-of-stock">Out of Stock</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            
                            <div class="book-details">
                                <div class="detail-item">
                                    <span class="label">Book ID:</span>
                                    <span class="value">${book.bookID}</span>
                                </div>
                                
                                <div class="detail-item">
                                    <span class="label">Available Quantity:</span>
                                    <span class="value">${book.quantity} copies</span>
                                </div>
                            </div>
                            
                            <c:if test="${book.quantity > 0}">
                                <form action="MainController" method="post" class="cart-form">
                                    <input type="hidden" name="action" value="addToCart">
                                    <input type="hidden" name="bookId" value="${book.bookID}">
                                    
                                    <div class="quantity-selector">
                                        <label for="quantity">Quantity:</label>
                                        <div class="quantity-control">
                                            <button type="button" class="quantity-btn minus" id="decreaseQty">-</button>
                                            <input type="number" id="quantity" name="quantity" value="1" min="1" max="${book.quantity}">
                                            <button type="button" class="quantity-btn plus" id="increaseQty">+</button>
                                        </div>
                                    </div>
                                    
                                    <div class="action-buttons">
                                        <button type="submit" class="btn btn-primary add-to-cart">
                                            <span class="icon">🛒</span> Add to Cart
                                        </button>
                                        <button type="button" class="btn btn-secondary buy-now" id="buyNowBtn">
                                            Buy Now
                                        </button>
                                    </div>
                                </form>
                            </c:if>
                            
                            <c:if test="${book.quantity <= 0}">
                                <div class="out-of-stock-message">
                                    <p>Sorry, this book is currently out of stock.</p>
                                    <button type="button" class="btn btn-secondary notify-btn">
                                        Notify Me When Available
                                    </button>
                                </div>
                            </c:if>
                            
                            <div class="customer-actions">
                                <button class="action-link" id="addToWishlist" data-id="${book.bookID}">
                                    <span class="icon">❤️</span> Add to Wishlist
                                </button>
                                <button class="action-link" id="shareBook">
                                    <span class="icon">🔗</span> Share
                                </button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Thông tin thêm về sách -->
                    <div class="additional-info">
                        <div class="info-tabs">
                            <button class="tab-btn active" data-tab="description">Description</button>
                            <button class="tab-btn" data-tab="details">Product Details</button>
                            <button class="tab-btn" data-tab="reviews">Customer Reviews</button>
                        </div>
                        
                        <div class="tab-content">
                            <div class="tab-pane active" id="description">
                                <h2>Description</h2>
                                <p>Detailed information about "${book.title}" by ${book.author} will be displayed here. The description includes a summary of the book, key features, and other relevant information for customers.</p>
                            </div>
                            
                            <div class="tab-pane" id="details">
                                <h2>Product Details</h2>
                                <table class="details-table">
                                    <tr>
                                        <th>Book ID</th>
                                        <td>${book.bookID}</td>
                                    </tr>
                                    <tr>
                                        <th>Title</th>
                                        <td>${book.title}</td>
                                    </tr>
                                    <tr>
                                        <th>Author</th>
                                        <td>${book.author}</td>
                                    </tr>
                                    <tr>
                                        <th>Publication Year</th>
                                        <td>${book.publishYear}</td>
                                    </tr>
                                    <tr>
                                        <th>Price</th>
                                        <td>$${book.price}</td>
                                    </tr>
                                </table>
                            </div>
                            
                            <div class="tab-pane" id="reviews">
                                <h2>Customer Reviews</h2>
                                <div class="reviews-container">
                                    <p>No reviews yet for this book. Be the first to write a review!</p>
                                    <button class="btn btn-secondary" id="writeReviewBtn">Write a Review</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Sách liên quan -->
                    <div class="related-books">
                        <h2>You May Also Like</h2>
                        <div class="related-books-slider">
                            <div class="related-book-placeholder">
                                <div class="book-cover-placeholder"></div>
                                <p class="book-title-placeholder">Related Book</p>
                                <p class="book-author-placeholder">Author Name</p>
                            </div>
                            <div class="related-book-placeholder">
                                <div class="book-cover-placeholder"></div>
                                <p class="book-title-placeholder">Related Book</p>
                                <p class="book-author-placeholder">Author Name</p>
                            </div>
                            <div class="related-book-placeholder">
                                <div class="book-cover-placeholder"></div>
                                <p class="book-title-placeholder">Related Book</p>
                                <p class="book-author-placeholder">Author Name</p>
                            </div>
                            <div class="related-book-placeholder">
                                <div class="book-cover-placeholder"></div>
                                <p class="book-title-placeholder">Related Book</p>
                                <p class="book-author-placeholder">Author Name</p>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        
        <!-- Notification modals -->
        <div id="addToCartModal" class="modal">
            <div class="modal-content">
                <span class="modal-close">&times;</span>
                <div class="modal-success">
                    <div class="success-icon">✓</div>
                    <h2>Added to Cart!</h2>
                    <p>The book has been added to your shopping cart.</p>
                    <div class="modal-buttons">
                        <a href="MainController?action=listBooks" class="btn btn-secondary">Continue Shopping</a>
                        <a href="MainController?action=viewCart" class="btn btn-primary">View Cart</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="shareModal" class="modal">
            <div class="modal-content">
                <span class="modal-close">&times;</span>
                <h2>Share This Book</h2>
                <div class="share-options">
                    <button class="share-btn facebook">Facebook</button>
                    <button class="share-btn twitter">Twitter</button>
                    <button class="share-btn email">Email</button>
                    <button class="share-btn link">Copy Link</button>
                </div>
            </div>
        </div>
        
        <jsp:include page="footer.jsp"/>
        
        <!-- Admin chỉ hiển thị với admin -->
        <% if (AuthUtils.isAdmin(session)) { %>
        <div class="admin-bar">
            <div class="admin-bar-container">
                <span class="admin-message">You are logged in as Administrator</span>
                <div class="admin-actions">
                    <a href="MainController?action=edit&id=${book.bookID}" class="admin-btn">Edit Book</a>
                    <button id="deleteBtn" class="admin-btn" data-id="${book.bookID}">Delete Book</button>
                </div>
            </div>
        </div>
        
        <!-- Delete Confirmation Modal chỉ cho admin -->
        <div id="deleteModal" class="modal">
            <div class="modal-content">
                <span class="modal-close">&times;</span>
                <h2>Confirm Deletion</h2>
                <p>Are you sure you want to delete this book? This action cannot be undone.</p>
                <div class="modal-buttons">
                    <button id="cancelDelete" class="btn btn-secondary">Cancel</button>
                    <a id="confirmDelete" href="#" class="btn btn-danger">Delete</a>
                </div>
            </div>
        </div>
        <% } %>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="assets/js/detail.js"></script>
    </body>
</html>