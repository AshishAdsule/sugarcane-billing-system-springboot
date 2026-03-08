<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
<%@ include file="/WEB-INF/jsp/layout/sidebar.jsp" %>

<div class="main-content">

    <h2>Farmer Master</h2>
    <hr>

    <!-- Farmer Form -->
    <form action="/saveFarmer" method="post">

        <input type="hidden" name="id" value="${farmer.id}" />

        <div class="mb-3">
            <label>Farmer Name</label>
            <input type="text" name="name" 
                   value="${farmer.name}" 
                   class="form-control">
        </div>

        <div class="mb-3">
            <label>Mobile</label>
            <input type="text" name="mobile" 
                   value="${farmer.mobile}" 
                   class="form-control">
        </div>

        <div class="mb-3">
            <label>Address</label>
            <input type="text" name="address" 
                   value="${farmer.address}" 
                   class="form-control">
        </div>

        <!-- Village Dropdown -->
        <div class="mb-3">
            <label>Select Village</label>
            <select name="village.id" class="form-control">
                <option value="">-- Select Village --</option>
                <c:forEach var="v" items="${villages}">
                    <option value="${v.id}"
                        ${farmer.village != null && farmer.village.id == v.id ? "selected" : ""}>
                        ${v.villageName}
                    </option>
                </c:forEach>
            </select>
        </div>

        <button class="btn btn-success">
            ${farmer.id == null ? "Save" : "Update"}
        </button>

    </form>

    <hr>

    <!-- Farmer List -->
    <h4>Farmer List</h4>

    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Mobile</th>
            <th>Address</th>
            <th>Village</th>
            <th>Action</th>
        </tr>

        <c:forEach var="f" items="${farmers}">
            <tr>
                <td>${f.id}</td>
                <td>${f.name}</td>
                <td>${f.mobile}</td>
                <td>${f.address}</td>
                <td>${f.village.villageName}</td>
                <td>
                    <a href="/editFarmer/${f.id}" 
                       class="btn btn-warning btn-sm">Edit</a>

                    <a href="/deleteFarmer/${f.id}" 
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