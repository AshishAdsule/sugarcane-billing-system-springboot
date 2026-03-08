<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>

<div style="width: 400px; margin: 50px auto; padding: 20px; border: 1px solid #ccc; border-radius: 8px; background-color: #f8f9fa;">
    <h2 style="text-align: center; margin-bottom: 20px;">Admin Registration</h2>

    <c:if test="${not empty error}">
        <div style="color: red; text-align: center; margin-bottom: 10px;">${error}</div>
    </c:if>

    <c:if test="${not empty success}">
        <div style="color: green; text-align: center; margin-bottom: 10px;">${success}</div>
    </c:if>

    <form method="post" action="/admin/register">
        <label for="adminName">Username</label>
        <input type="text" id="adminName" name="adminName" value="${admin.adminName}" required 
               style="width: 100%; padding: 8px; margin-bottom: 15px;"/>

        <label for="adminPassword">Password</label>
        <input type="password" id="adminPassword" name="adminPassword" value="${admin.adminPassword}" required 
               style="width: 100%; padding: 8px; margin-bottom: 20px;"/>

        <button type="submit" 
                style="width: 100%; padding: 10px; background-color: #2980b9; color: white; border: none; border-radius: 4px;">
            Register
        </button>
    </form>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>