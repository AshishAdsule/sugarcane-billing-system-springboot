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

    <!-- ===== Cane Cut Slip Form ===== -->
    <div class="form-card">
        <h2>Cane Cut Slip Entry</h2>

        <form action="saveCaneCut" method="post">

            <input type="hidden" name="caneCutId" 
                   value="${caneCut.caneCutId}" />

            <div class="form-grid">

                <!-- Registration Dropdown -->
                <div class="form-group">
                    <label>Registration</label>
                    <select name="registration.registrationId" required>
                        <option value="">Select Registration</option>
                        <c:forEach var="r" items="${registrationList}">
                            <option value="${r.registrationId}"
                                <c:if test="${caneCut.registration != null 
                                    && caneCut.registration.registrationId == r.registrationId}">
                                    selected
                                </c:if>>
                                Reg-${r.registrationId} | ${r.cultivator.cultivatorName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Harvestor -->
                <div class="form-group">
                    <label>Harvestor</label>
                    <select name="harvestor.harvestorId" required>
                        <option value="">Select Harvestor</option>
                        <c:forEach var="h" items="${harvestorList}">
                            <option value="${h.harvestorId}"
                                <c:if test="${caneCut.harvestor != null 
                                    && caneCut.harvestor.harvestorId == h.harvestorId}">
                                    selected
                                </c:if>>
                                ${h.harvestorName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Transporter -->
                <div class="form-group">
                    <label>Transporter</label>
                    <select name="transporter.transporterId" required>
                        <option value="">Select Transporter</option>
                        <c:forEach var="t" items="${transporterList}">
                            <option value="${t.transporterId}"
                                <c:if test="${caneCut.transporter != null 
                                    && caneCut.transporter.transporterId == t.transporterId}">
                                    selected
                                </c:if>>
                                ${t.transporterName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Vehicle -->
                <div class="form-group">
                    <label>Vehicle</label>
                    <select name="vehicle.vehicleId" required>
                        <option value="">Select Vehicle</option>
                        <c:forEach var="v" items="${vehicleList}">
                            <option value="${v.vehicleId}"
                                <c:if test="${caneCut.vehicle != null 
                                    && caneCut.vehicle.vehicleId == v.vehicleId}">
                                    selected
                                </c:if>>
                                ${v.vehicleName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Cane Cut Date -->
                <div class="form-group">
                    <label>Cane Cut Date</label>
                    <input type="date" name="caneCutDate"
                           value="${caneCut.caneCutDate}" required>
                </div>

                <!-- Total Area -->
                <div class="form-group">
                    <label>Total Area</label>
                    <input type="text" name="totalArea"
                           value="${caneCut.totalArea}" required>
                </div>

            </div>

            <div class="form-actions">
                <button type="submit" class="btn-save">
                    Save Cane Cut Slip
                </button>
            </div>

        </form>
    </div>

    <!-- ===== Cane Cut Slip List ===== -->
    <div class="table-card">
        <h3>Cane Cut Slip List</h3>

        <table class="styled-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Cultivator</th>
                    <th>Village</th>
                    <th>Cane</th>
                    <th>Harvestor</th>
                    <th>Transporter</th>
                    <th>Vehicle</th>
                    <th>Date</th>
                    <th>Area</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="c" items="${caneCutList}">
                    <tr>
                        <td>${c.caneCutId}</td>
                        <td>${c.registration.cultivator.cultivatorName}</td>
                        <td>${c.registration.village.villageName}</td>
                        <td>${c.registration.cane.caneName}</td>
                        <td>${c.harvestor.harvestorName}</td>
                        <td>${c.transporter.transporterName}</td>
                        <td>${c.vehicle.vehicleName}</td>
                        <td>${c.caneCutDate}</td>
                        <td>${c.totalArea}</td>
                        <td>
                            <a class="btn-edit"
                               href="editCaneCut/${c.caneCutId}">
                               Edit
                            </a>

                            <a class="btn-delete"
                               href="deleteCaneCut/${c.caneCutId}"
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