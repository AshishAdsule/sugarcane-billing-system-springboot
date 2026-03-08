<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
<%@ include file="/WEB-INF/jsp/layout/sidebar.jsp" %>

<div style="margin-left:260px; padding:20px;">

    <h2>Cane Master</h2>
    <!-- ======= Cane Form ======= -->
    <form action="/saveCane" method="post">

        <!-- Hidden ID for Update -->
        <input type="hidden" name="caneId" value="${cane.caneId}" />

        <div class="mb-3">
            <label>Cane Name</label>
            <input type="text" name="caneName" 
                   value="${cane.caneName}" 
                   class="form-control" 
                   placeholder="Enter Cane Name" required>
        </div>

        <button type="submit" class="btn btn-success">
            ${cane.caneId == null ? "Save" : "Update"}
        </button>

        <a href="/cane" class="btn btn-secondary">Reset</a>
    </form>

    <hr>

    <!-- ======= Cane List Table ======= -->
    <h3>Cane List</h3>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Cane Name</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
			
            <c:forEach var="c" items="${caneList}">
                <tr>
                    <td>${c.caneId}</td>
                    <td>${c.caneName}</td>
                    <td>
                        <a href="/editCane/${c.caneId}" 
                           class="btn btn-warning btn-sm">Edit</a>

                        <a href="/deleteCane/${c.caneId}" 
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure to delete?')">
                           Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty caneList}">
                <tr>
                    <td colspan="3" style="text-align:center;">
                        No Cane Records Found
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>

</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>