<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="layout/header.jsp" %>
<%@ include file="layout/sidebar.jsp" %>

<div style="margin-left:260px; padding:20px;">

    <h2>Vehicle Master</h2>

    <!-- ================= VEHICLE FORM ================= -->
    <form action="/saveVehicle" method="post">

        <input type="hidden" name="vehicleId" value="${vehicle.vehicleId}" />

        <div class="mb-3">
            <label>Vehicle Name</label>
            <input type="text"
                   name="vehicleName"
                   value="${vehicle.vehicleName}"
                   class="form-control"
                   placeholder="Enter Vehicle Name" required>
        </div>

        <button type="submit" class="btn btn-success">
            ${vehicle.vehicleId == null ? "Save" : "Update"}
        </button>

        <a href="/vehicle" class="btn btn-secondary">Reset</a>

    </form>

    <hr>

    <!-- ================= VEHICLE LIST ================= -->
    <h3>Vehicle List</h3>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Vehicle Name</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="v" items="${vehicleList}">
                <tr>
                    <td>${v.vehicleId}</td>
                    <td>${v.vehicleName}</td>
                    <td>
                        <a href="/edit/${v.vehicleId}">Edit</a> |
                        <a href="/delete/${v.vehicleId}"
                           onclick="return confirm('Are you sure?')">
                           Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty vehicleList}">
                <tr>
                    <td colspan="3">No Records Found</td>
                </tr>
            </c:if>
        </tbody>
    </table>

</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>