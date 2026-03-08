<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/css/style1.css">
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

    <!-- ================= FORM CARD ================= -->
    <div class="form-card">
        <h2>Weight Slip Entry</h2>

       <form action="${pageContext.request.contextPath}/weightslip/save" method="post">
            <input type="hidden" name="weightSlipId"
                   value="${weightSlip.weightSlipId}" />

            <div class="form-grid">

                <div class="form-group">
                    <label>Cane Cut Slip</label>
                    <select name="caneCutSlip.caneCutId" required>
                        <option value="">Select Cane Cut</option>
                        <c:forEach var="c" items="${caneCutList}">
                            <option value="${c.caneCutId}"
                                <c:if test="${weightSlip.caneCutSlip != null && weightSlip.caneCutSlip.caneCutId == c.caneCutId}">
                                    selected
                                </c:if>>
                                Cut ID - ${c.caneCutId}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label>Gross Weight</label>
                    <input type="number" step="0.01"
                           name="grossWeight"
                           value="${weightSlip.grossWeight}" required>
                </div>

                <div class="form-group">
                    <label>Tare Weight</label>
                    <input type="number" step="0.01"
                           name="tareWeight"
                           value="${weightSlip.tareWeight}" required>
                </div>

                <div class="form-group">
                    <label>Weight Slip Date</label>
                    <input type="date"
                           name="weightSlipDate"
                           value="${weightSlip.weightSlipDate}" required>
                </div>

                <div class="form-group" style="grid-column: span 2;">
                    <label>Remarks</label>
                    <input type="text"
                           name="remarks"
                           value="${weightSlip.remarks}">
                </div>

            </div>

            <div class="form-actions">
                <button type="submit" class="btn-save">
                    Save Weight Slip
                </button>
            </div>

        </form>
    </div>

    <!-- ================= TABLE CARD ================= -->
    <div class="table-card">

        <h3>Weight Slip List</h3>

        <table class="styled-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Cane Cut ID</th>
                    <th>Gross</th>
                    <th>Tare</th>
                    <th>Net</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="w" items="${weightSlipList}">
                    <tr>
                        <td>${w.weightSlipId}</td>
                        <td>${w.caneCutSlip.caneCutId}</td>
                        <td>${w.grossWeight}</td>
                        <td>${w.tareWeight}</td>
                        <td>${w.netWeight}</td>
                        <td>${w.weightSlipDate}</td>
                        <td>

							<a class="btn-edit"
							   href="${pageContext.request.contextPath}/weightslip/edit/${w.weightSlipId}">
							    Edit
							</a>

                            <form action="${pageContext.request.contextPath}/weightslip/delete/${w.weightSlipId}"
                                  method="post"
                                  style="display:inline;"
                                  onsubmit="return confirm('Are you sure?')">

                                <button type="submit" class="btn-delete">
                                    Delete
                                </button>
								<a class="btn-edit"
								   href="${pageContext.request.contextPath}/weightslip/print/${w.weightSlipId}"
								   target="_blank">
								   Print
								</a>
                            </form>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>

    </div>

</div>
<script>

const gross = document.querySelector("input[name='grossWeight']");
const tare = document.querySelector("input[name='tareWeight']");

function calculateNet(){
    const g = parseFloat(gross.value) || 0;
    const t = parseFloat(tare.value) || 0;
    const net = g - t;
}

gross.addEventListener("input", calculateNet);
tare.addEventListener("input", calculateNet);

</script>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>