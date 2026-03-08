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

    <!-- Registration Form -->
    <div class="form-card">
        <h2>Cane Registration</h2>

        <form action="saveRegistration" method="post">

            <input type="hidden" name="registrationId"
                   value="${registration.registrationId}" />

            <div class="form-grid">

                <!-- Cultivator -->
                <div class="form-group">
                    <label>Cultivator</label>
                    <select name="cultivator.cultivatorId" required>
                        <option value="">Select Cultivator</option>
                        <c:forEach var="c" items="${cultivatorList}">
                            <option value="${c.cultivatorId}"
                                <c:if test="${registration.cultivator != null 
                                    && registration.cultivator.cultivatorId == c.cultivatorId}">
                                    selected
                                </c:if>>
                                ${c.cultivatorName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Village -->
                <div class="form-group">
                    <label>Village</label>
                    <select name="village.id" required>
                        <option value="">Select Village</option>
                        <c:forEach var="v" items="${villageList}">
                            <option value="${v.id}"
                                <c:if test="${registration.village != null 
                                    && registration.village.id == v.id}">
                                    selected
                                </c:if>>
                                ${v.villageName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Water -->
                <div class="form-group">
                    <label>Water Type</label>
                    <select name="water.waterId" required>
                        <option value="">Select Water</option>
                        <c:forEach var="w" items="${waterList}">
                            <option value="${w.waterId}"
                                <c:if test="${registration.water != null 
                                    && registration.water.waterId == w.waterId}">
                                    selected
                                </c:if>>
                                ${w.waterType}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Cane -->
                <div class="form-group">
                    <label>Cane Type</label>
                    <select name="cane.caneId" required>
                        <option value="">Select Cane</option>
                        <c:forEach var="cane" items="${caneList}">
                            <option value="${cane.caneId}"
                                <c:if test="${registration.cane != null 
                                    && registration.cane.caneId == cane.caneId}">
                                    selected
                                </c:if>>
                                ${cane.caneName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Total Area -->
                <div class="form-group">
                    <label>Total Area Of Cane</label>
                    <input type="text" name="totalAreaOfCane"
                           value="${registration.totalAreaOfCane}">
                </div>

                <!-- Registration Date -->
                <div class="form-group">
                    <label>Registration Date</label>
                    <input type="date" name="registrationDate"
                           value="${registration.registrationDate}">
                </div>

                <!-- Lagan Khodva Date -->
                <div class="form-group">
                    <label>Lagan Khodva Date</label>
                    <input type="date" name="laganKhodvaDate"
                           value="${registration.laganKhodvaDate}">
                </div>

                <!-- Gat No -->
                <div class="form-group">
                    <label>Gat No</label>
                    <input type="text" name="gatNo"
                           value="${registration.gatNo}">
                </div>

            </div>

            <div class="form-actions">
                <button type="submit" class="btn-save">
                    Save Registration
                </button>
            </div>

        </form>
    </div>

    <!-- Registration List -->
    <div class="table-card">
        <h3>Registration List</h3>

        <table class="styled-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Cultivator</th>
                    <th>Village</th>
                    <th>Cane</th>
                    <th>Water</th>
                    <th>Area</th>
                    <th>Gat No</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="r" items="${registrationList}">
                    <tr>
                        <td>${r.registrationId}</td>
                        <td>${r.cultivator.cultivatorName}</td>
                        <td>${r.village.villageName}</td>
                        <td>${r.cane.caneName}</td>
                        <td>${r.water.waterType}</td>
                        <td>${r.totalAreaOfCane}</td>
                        <td>${r.gatNo}</td>
                        <td>
                            <a class="btn-edit"
                               href="editRegistration/${r.registrationId}">
                               Edit
                            </a>

                            <a class="btn-delete"
                               href="deleteRegistration/${r.registrationId}"
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