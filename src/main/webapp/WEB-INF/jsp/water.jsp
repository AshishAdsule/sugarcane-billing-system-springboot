<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="layout/header.jsp" %>
<%@ include file="layout/sidebar.jsp" %>

<div style="margin-left:260px; padding:20px;">

    <h2>Water Master</h2>

    <!-- ================= WATER FORM ================= -->
    <form action="/saveWater" method="post">

        <input type="hidden" name="waterId" value="${water.waterId}" />

        <div class="mb-3">
            <label>Water Type</label>
            <input type="text"
                   name="waterType"
                   value="${water.waterType}"
                   class="form-control"
                   placeholder="Enter Water Type"
                   required>
        </div>

        <button type="submit" class="btn btn-success">
            ${water.waterId == null ? "Save" : "Update"}
        </button>

        <a href="/water" class="btn btn-secondary">Reset</a>

    </form>

    <hr>

    <!-- ================= WATER LIST ================= -->
    <h3>Water List</h3>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Water Type</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="w" items="${waterList}">
                <tr>
                    <td>${w.waterId}</td>
                    <td>${w.waterType}</td>
                    <td>
                        <a href="/editWater/${w.waterId}">Edit</a> |
                        <a href="/deleteWater/${w.waterId}"
                           onclick="return confirm('Are you sure?')">
                           Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty waterList}">
                <tr>
                    <td colspan="3">No Records Found</td>
                </tr>
            </c:if>

        </tbody>
    </table>

</div>
<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>