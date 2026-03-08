<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<div style="width: 350px; margin: 100px auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; background-color: #f8f9fa;">
    <h2 style="text-align: center;">Admin Login</h2>

    <!-- Display error message if login fails -->
    <c:if test="${not empty error}">
        <div style="color: red; text-align: center; margin-bottom: 10px;">
            ${error}
        </div>
    </c:if>

    <!-- Login Form -->
    <form method="post" action="/admin/login">
        <label for="adminName">Username</label>
        <input type="text" id="adminName" name="adminName" required class="form-control" />

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required class="form-control" />

        <button type="submit" 
                style="width: 100%; margin-top: 15px; background-color: #2980b9; color: #fff; padding: 10px; border: none; border-radius: 4px;">
            Login
        </button>
    </form>

    <!-- Link to Registration Page -->
    <div style="text-align: center; margin-top: 15px;">
        <span>Not registered yet? </span>
        <a href="/admin/register" style="color: #2980b9; text-decoration: none; font-weight: bold;">
            Register Here
        </a>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>