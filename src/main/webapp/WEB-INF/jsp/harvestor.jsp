<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="layout/header.jsp" %>
<%@ include file="layout/sidebar.jsp" %>


<style>
	.form-card {
	    background: #ffffff;
	    padding: 30px;
	    border-radius: 12px;
	    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
	}

	.form-card h2 {
	    margin-bottom: 25px;
	    color: #1e293b;
	}

	.form-grid {
	    display: grid;
	    grid-template-columns: repeat(2, 1fr);
	    gap: 20px;
	}

	.form-group {
	    display: flex;
	    flex-direction: column;
	}

	.form-group label {
	    font-weight: 600;
	    margin-bottom: 6px;
	    color: #334155;
	}

	.form-group input,
	.form-group select {
	    padding: 10px;
	    border-radius: 6px;
	    border: 1px solid #cbd5e1;
	    transition: 0.3s;
	}

	.form-group input:focus,
	.form-group select:focus {
	    border-color: #1e293b;
	    outline: none;
	    box-shadow: 0 0 5px rgba(30,41,59,0.2);
	}

	.form-actions {
	    margin-top: 25px;
	}

	.btn-save {
	    background-color: #1e293b;
	    color: white;
	    padding: 10px 25px;
	    border: none;
	    border-radius: 6px;
	    cursor: pointer;
	    transition: 0.3s;
	}

	.btn-save:hover {
	    background-color: #334155;
	}
	.table-card {
	    margin-top: 40px;
	    background: #ffffff;
	    padding: 25px;
	    border-radius: 12px;
	    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
	}

	.table-card h3 {
	    margin-bottom: 20px;
	    color: #1e293b;
	}

	.styled-table {
	    width: 100%;
	    border-collapse: collapse;
	    font-size: 14px;
	}

	.styled-table thead tr {
	    background-color: #1e293b;
	    color: #ffffff;
	    text-align: center;
	}

	.styled-table th,
	.styled-table td {
	    padding: 12px 10px;
	    border-bottom: 1px solid #e2e8f0;
	    text-align: center;
	}

	.styled-table tbody tr:hover {
	    background-color: #f1f5f9;
	    transition: 0.3s;
	}

	/* Action Buttons */
	.btn-edit {
	    padding: 6px 12px;
	    background-color: #0ea5e9;
	    color: white;
	    text-decoration: none;
	    border-radius: 5px;
	    font-size: 13px;
	}

	.btn-edit:hover {
	    background-color: #0284c7;
	}

	.btn-delete {
	    padding: 6px 12px;
	    background-color: #ef4444;
	    color: white;
	    text-decoration: none;
	    border-radius: 5px;
	    font-size: 13px;
	}

	.btn-delete:hover {
	    background-color: #dc2626;
	}
</style>
<div class="main-content">

    <!-- Form Card -->
    <div class="form-card">
        <h2>Harvestor Master</h2>

        <form action="saveHarvestor" method="post">

            <input type="hidden" name="harvestorId" 
                   value="${harvestor.harvestorId}" />

            <div class="form-grid">

                <div class="form-group">
                    <label>Harvestor Name</label>
                    <input type="text" name="harvestorName"
                           value="${harvestor.harvestorName}" required>
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="harvestorAddress"
                           value="${harvestor.harvestorAddress}">
                </div>

            </div>

            <div class="form-actions">
                <button type="submit" class="btn-save">
                    Save Harvestor
                </button>
            </div>

        </form>
    </div>

    <!-- List Table -->
    <div class="table-card">
        <h3>Harvestor List</h3>

        <table class="styled-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Address</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="h" items="${harvestorList}">
                    <tr>
                        <td>${h.harvestorId}</td>
                        <td>${h.harvestorName}</td>
                        <td>${h.harvestorAddress}</td>
                        <td>
                            <a class="btn-edit"
                               href="editHarvestor/${h.harvestorId}">
                               Edit
                            </a>

                            <a class="btn-delete"
                               href="deleteHarvestor/${h.harvestorId}"
                               onclick="return confirm('Are you sure?')">
                               Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>