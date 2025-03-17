<%-- 
    Document   : register
    Created on : Mar 17, 2025, 10:30:21 AM
    Author     : tungi
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Account</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/register.css">
    </head>
    <body>
        <jsp:include page="../header.jsp"/>

        <div class="page-content">
            <div class="form-container">
                <h1>Register New Account</h1>

                <!-- Hiển thị thông báo thành công nếu có -->
                <c:if test="${not empty requestScope.success}">
                    <div class="success-message">${requestScope.success}</div>
                </c:if>

                <!-- Hiển thị thông báo lỗi nếu có -->
                <c:if test="${not empty requestScope.error}">
                    <div class="error-container">
                        <p>${requestScope.error}</p>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/UserController" method="post" id="registerForm">
                    <input type="hidden" name="action" value="register"/>

                    <div class="form-group">
                        <label for="txtUserID">User ID:</label>
                        <input type="text" id="txtUserID" name="txtUserID" value="${param.txtUserID}" required/>
                        <c:if test="${not empty requestScope.txtUserID_error}">
                            <div class="error-message">${requestScope.txtUserID_error}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtFullName">Full Name:</label>
                        <input type="text" id="txtFullName" name="txtFullName" value="${param.txtFullName}" required/>
                        <c:if test="${not empty requestScope.txtFullName_error}">
                            <div class="error-message">${requestScope.txtFullName_error}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtEmail">Email:</label>
                        <input type="email" id="txtEmail" name="txtEmail" value="${param.txtEmail}" required/>
                        <c:if test="${not empty requestScope.txtEmail_error}">
                            <div class="error-message">${requestScope.txtEmail_error}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtPassword">Password:</label>
                        <input type="password" id="txtPassword" name="txtPassword" required/>
                        <c:if test="${not empty requestScope.txtPassword_error}">
                            <div class="error-message">${requestScope.txtPassword_error}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtConfirmPassword">Confirm Password:</label>
                        <input type="password" id="txtConfirmPassword" name="txtConfirmPassword" required/>
                        <c:if test="${not empty requestScope.txtConfirmPassword_error}">
                            <div class="error-message">${requestScope.txtConfirmPassword_error}</div>
                        </c:if>
                    </div>

                    <div class="button-group">
                        <input type="submit" value="Register" />
                        <input type="reset" value="Reset" id="resetBtn"/>
                    </div>
                </form>

                <div class="login-link">
                    Already have an account? <a href="login.jsp">Login here</a>
                </div>
            </div>
        </div>

        <jsp:include page="../footer.jsp"/>

        <!-- Thêm jQuery từ CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                // Client-side validation
                $("#registerForm").on("submit", function (e) {
                    // Reset previous error messages
                    $(".error-message").remove();
                    
                    let hasError = false;
                    
                    // Validate User ID (không được để trống và ít nhất 3 ký tự)
                    const userID = $("#txtUserID").val().trim();
                    if (userID.length < 3) {
                        $("#txtUserID").after('<div class="error-message">User ID must be at least 3 characters long</div>');
                        hasError = true;
                    }
                    
                    // Validate Full Name (không được để trống)
                    const fullName = $("#txtFullName").val().trim();
                    if (fullName === "") {
                        $("#txtFullName").after('<div class="error-message">Full Name is required</div>');
                        hasError = true;
                    }
                    
                    // Validate Email (phải đúng định dạng email)
                    const email = $("#txtEmail").val().trim();
                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    if (!emailRegex.test(email)) {
                        $("#txtEmail").after('<div class="error-message">Please enter a valid email address</div>');
                        hasError = true;
                    }
                    
                    // Validate Password (ít nhất 6 ký tự)
                    const password = $("#txtPassword").val();
                    if (password.length < 6) {
                        $("#txtPassword").after('<div class="error-message">Password must be at least 6 characters long</div>');
                        hasError = true;
                    }
                    
                    // Validate Confirm Password (phải giống password)
                    const confirmPassword = $("#txtConfirmPassword").val();
                    if (password !== confirmPassword) {
                        $("#txtConfirmPassword").after('<div class="error-message">Passwords do not match</div>');
                        hasError = true;
                    }
                    
                    if (hasError) {
                        e.preventDefault(); // Prevent form submission if there are errors
                    }
                });
                
                // Reset button functionality
                $("#resetBtn").on("click", function () {
                    $(".error-message").remove();
                });
            });
        </script>
    </body>
</html>