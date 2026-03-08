<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
<%@ include file="/WEB-INF/jsp/layout/sidebar.jsp" %>

<style>
/* ===== Sidebar Styling ===== */
.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 220px;
    height: 100%;
    background-color: #2c3e50;
    color: #fff;
    padding: 20px 10px;
    overflow-y: auto;
    font-family: Arial, sans-serif;
}

.sidebar h4 {
    text-align: center;
    margin-bottom: 20px;
    font-size: 24px;
    color: #ecf0f1;
}

.sidebar a {
    display: block;
    color: #ecf0f1;
    padding: 10px 15px;
    text-decoration: none;
    border-radius: 4px;
    margin-bottom: 5px;
    transition: 0.3s;
}

.sidebar a:hover {
    background-color: #34495e;
    color: #fff;
}

.sidebar .submenu {
    padding-left: 30px;
    font-size: 14px;
}

/* ===== Main Content ===== */
.main-content {
    margin-left: 240px; /* Width of sidebar + spacing */
    padding: 20px;
    font-family: Arial, sans-serif;
    min-height: 100vh;
    background-color: #f8f9fa;
}

/* ===== Report Table Styling ===== */
table {
    width: calc(100% - 260px); /* Full width minus sidebar */
    margin: 20px auto;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 0 5px rgba(0,0,0,0.1);
}

table th, table td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center;
}

table th {
    background-color: #2980b9;
    color: #fff;
    font-weight: bold;
}

table tr:nth-child(even) {
    background-color: #f2f2f2;
}

table tr:hover {
    background-color: #d6eaf8;
}

h2 {
    font-size: 2rem;
    text-align: center;
    margin-top: 20px;
}

/* ===== Responsive ===== */
@media screen and (max-width: 768px) {
    .sidebar {
        width: 180px;
        padding: 15px 5px;
    }

    .main-content {
        margin-left: 190px;
        padding: 15px;
    }

    table th, table td {
        padding: 8px 5px;
    }
}
</style>

<div class="main-content">
    <h2>Weight Slip Report</h2>

    <form method="get" action="/weightReport">
        Start Date: <input type="date" name="startDate" required>
        End Date: <input type="date" name="endDate" required>
        <button type="submit">Generate Report</button>
    </form>

    <table>
        <tr>
            <th>ID</th>
            <th>Cane Cut</th>
            <th>Gross</th>
            <th>Tare</th>
            <th>Net</th>
            <th>Date</th>
        </tr>
        <c:forEach var="w" items="${weights}">
            <tr>
                <td>${w.weightSlipId}</td>
                <td>
                    <c:if test="${w.caneCutSlip != null}">
                        ${w.caneCutSlip.caneCutId}
                    </c:if>
                </td>
                <td>${w.grossWeight}</td>
                <td>${w.tareWeight}</td>
                <td>${w.netWeight}</td>
                <td>${w.weightSlipDate}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>