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

    <div class="form-card">
        <h2>Transporter Master</h2>

        <form action="${pageContext.request.contextPath}/transporter/save" method="post">

            <input type="hidden" name="transporterId"
                   value="${transporter.transporterId}" />

            <div class="form-grid">

                <div class="form-group">
                    <label>Transporter Name</label>
                    <input type="text" name="transporterName"
                           value="${transporter.transporterName}" required>
                </div>

                <div class="form-group">
                    <label>Mobile No</label>
                    <input type="text" name="transporterMobileNo"
                           value="${transporter.transporterMobileNo}" required>
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input type="text" name="transporterAddress"
                           value="${transporter.transporterAddress}">
                </div>

                <div class="form-group">
                    <label>Witness Name</label>
                    <input type="text" name="witnessName"
                           value="${transporter.witnessName}">
                </div>

                <div class="form-group">
                    <label>Witness Address</label>
                    <input type="text" name="witnessAddress"
                           value="${transporter.witnessAddress}">
                </div>

                <div class="form-group">
                    <label>Cultivator Type</label>
                    <input type="text" name="cultivatorType"
                           value="${transporter.cultivatorType}">
                </div>

                <!-- Vehicle -->
                <div class="form-group">
                    <label>Vehicle</label>
                    <select name="vehicle.vehicleId">
                        <option value="">Select Vehicle</option>
                        <c:forEach var="v" items="${vehicleList}">
                            <option value="${v.vehicleId}"
                                <c:if test="${transporter.vehicle != null && transporter.vehicle.vehicleId == v.vehicleId}">
                                    selected
                                </c:if>>
                                ${v.vehicleName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Water -->
                <div class="form-group">
                    <label>Water</label>
                    <select name="water.waterId">
                        <option value="">Select Water</option>
                        <c:forEach var="w" items="${waterList}">
                            <option value="${w.waterId}"
                                <c:if test="${transporter.water != null && transporter.water.waterId == w.waterId}">
                                    selected
                                </c:if>>
                                ${w.waterType}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Village -->
                <div class="form-group">
                    <label>Village</label>
                    <select name="village.id">
                        <option value="">Select Village</option>
                        <c:forEach var="v" items="${villageList}">
                            <option value="${v.id}"
                                <c:if test="${transporter.village != null && transporter.village.id == v.id}">
                                    selected
                                </c:if>>
                                ${v.villageName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Cultivator -->
                <div class="form-group">
                    <label>Cultivator</label>
                    <select name="cultivator.cultivatorId">
                        <option value="">Select Cultivator</option>
                        <c:forEach var="c" items="${cultivatorList}">
                            <option value="${c.cultivatorId}"
                                <c:if test="${transporter.cultivator != null && transporter.cultivator.cultivatorId == c.cultivatorId}">
                                    selected
                                </c:if>>
                                ${c.cultivatorName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

            </div>

            <div class="form-actions">
                <button type="submit" class="btn-save">
                    Save Transporter
                </button>
            </div>

        </form>
    </div>

    <!-- ================== LIST ================== -->

    <div class="table-card">

        <h3>Transporter List</h3>

        <table class="styled-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Vehicle</th>
                    <th>Water</th>
                    <th>Village</th>
                    <th>Cultivator</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="t" items="${transporterList}">
                    <tr>
                        <td>${t.transporterId}</td>
                        <td>${t.transporterName}</td>
                        <td>${t.transporterMobileNo}</td>
                        <td>${t.vehicle.vehicleName}</td>
                        <td>${t.water.waterType}</td>
                        <td>${t.village.villageName}</td>
                        <td>${t.cultivator.cultivatorName}</td>
                        <td>

                            <a class="btn-edit"
                               href="${pageContext.request.contextPath}/transporter/edit/${t.transporterId}">
                                Edit
                            </a>

                            <form action="${pageContext.request.contextPath}/transporter/delete/${t.transporterId}"
                                  method="post"
                                  style="display:inline;"
                                  onsubmit="return confirm('Are you sure?')">

                                <button type="submit" class="btn-delete">
                                    Delete
                                </button>

                            </form>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>

</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>