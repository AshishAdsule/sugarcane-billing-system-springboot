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

        <h2>Cultivator Master</h2>

        <form action="saveCultivator" method="post">

            <input type="hidden" name="cultivatorId" 
                   value="${cultivator.cultivatorId}" />

            <div class="form-grid">

                <div class="form-group">
                    <label>Cultivator Name</label>
                    <input type="text" name="cultivatorName"
                           value="${cultivator.cultivatorName}" required>
                </div>

                <div class="form-group">
                    <label>Mobile No</label>
                    <input type="text" name="cultivatorMobileNo"
                           value="${cultivator.cultivatorMobileNo}">
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="cultivatorAddress"
                           value="${cultivator.cultivatorAddress}">
                </div>

                <div class="form-group">
                    <label>Cultivator Type</label>
                    <input type="text" name="cultivatorType"
                           value="${cultivator.cultivatorType}">
                </div>

                <div class="form-group">
                    <label>Total Area Of Cane</label>
                    <input type="text" name="totalAreaOfCane"
                           value="${cultivator.totalAreaOfCane}">
                </div>

                <div class="form-group">
                    <label>Bank Name</label>
                    <input type="text" name="bankName"
                           value="${cultivator.bankName}">
                </div>

                <div class="form-group">
                    <label>Account No</label>
                    <input type="text" name="accountNo"
                           value="${cultivator.accountNo}">
                </div>

                <!-- 🔽 Village Dropdown -->
                <div class="form-group">
                    <label>Village</label>
                    <select name="village.id" required>
                        <option value="">Select Village</option>

                        <c:forEach var="v" items="${villageList}">
                            <option value="${v.id}"
                                <c:if test="${cultivator.village != null && cultivator.village.id == v.id}">
                                    selected
                                </c:if>>
                                ${v.villageName}
                            </option>
                        </c:forEach>

                    </select>
                </div>

            </div>

            <div class="form-actions">
                <button type="submit" class="btn-save">
                    Save Cultivator
                </button>
            </div>

        </form>
    </div>

    <!-- List Table -->
    <div class="table-card">

        <h3>Cultivator List</h3>

        <table class="styled-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Village</th>
                    <th>Area</th>
                    <th>Bank</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="c" items="${cultivatorList}">
                    <tr>
                        <td>${c.cultivatorId}</td>
                        <td>${c.cultivatorName}</td>
                        <td>${c.cultivatorMobileNo}</td>
                        <td>${c.village.villageName}</td>
                        <td>${c.totalAreaOfCane}</td>
                        <td>${c.bankName}</td>
                        <td>
                            <a class="btn-edit"
                               href="editCultivator/${c.cultivatorId}">
                               Edit
                            </a>

                            <a class="btn-delete"
                               href="deleteCultivator/${c.cultivatorId}"
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
