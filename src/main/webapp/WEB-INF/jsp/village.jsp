<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
<%@ include file="/WEB-INF/jsp/layout/sidebar.jsp" %>

<div class="main-content">

    <h2>Village Master</h2>
    <hr>

    <!-- Add / Update Form -->
    <form action="/saveVillage" method="post">

        <input type="hidden" name="id" value="${village.id}"/>

        <div class="mb-3">
            <label>Village Name</label>
            <input type="text" name="villageName" 
                   value="${village.villageName}" 
                   class="form-control">
        </div>

        <div class="mb-3">
            <label>Taluka</label>
            <input type="text" name="taluka" 
                   value="${village.taluka}" 
                   class="form-control">
        </div>

        <div class="mb-3">
            <label>District</label>
            <input type="text" name="district" 
                   value="${village.district}" 
                   class="form-control">
        </div>

        <button class="btn btn-success">
            ${village.id == null ? "Save" : "Update"}
        </button>

    </form>

    <hr>

    <!-- Village List -->
    <h4>Village List</h4>

    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <th>Village</th>
            <th>Taluka</th>
            <th>District</th>
            <th>Action</th>
        </tr>

        <c:forEach var="v" items="${villages}">
            <tr>
                <td>${v.id}</td>
                <td>${v.villageName}</td>
                <td>${v.taluka}</td>
                <td>${v.district}</td>
                <td>
                    <a href="/editVillage/${v.id}" 
                       class="btn btn-warning btn-sm">Edit</a>

                    <a href="/deleteVillage/${v.id}" 
                       class="btn btn-danger btn-sm"
                       onclick="return confirm('Are you sure?')">
                       Delete
                    </a>
                </td>
            </tr>
        </c:forEach>

    </table>

</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>