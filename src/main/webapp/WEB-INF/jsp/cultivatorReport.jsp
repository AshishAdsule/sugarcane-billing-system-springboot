<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
<%@ include file="/WEB-INF/jsp/layout/sidebar.jsp" %>

<head>
	<style>
			/* ===== Sidebar Styling ===== */
			.sidebar {
			    position: fixed;
			    left: 0;
			    top: 0;
			    width: 220px; /* Sidebar width */
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
			    padding-left: 30px; /* Indent submenu items */
			    font-size: 14px;
			}

			/* Bootstrap collapse adjustment */
			.collapse a {
			    display: block;
			}

			/* ===== Main Content ===== */
			.main-content {
			    margin-left: 240px; /* Width of sidebar + some spacing */
			    padding: 20px;
			    font-family: Arial, sans-serif;
			    min-height: 100vh;
			    background-color: #f8f9fa;
			}

			/* ===== Report Table Styling ===== */
			table {
				width: 75%;
				margin-left: 350px;
			    border-collapse: collapse;
			    margin-top: 20px;
			    background-color: #fff;
			    box-shadow: 0px 0px 5px rgba(0,0,0,0.1);
			}
			.btn{
				margin-left: 350px;
			}

			table th, table td {
			    border: 1px solid #ddd;
				padding: 12px 3px;
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
			h2{
				font-size: 2rem;
				        text-align: center;
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
    <title>SCBS</title>

    <link rel="stylesheet" href="/resources/css/style1.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<h2>Cultivator Report</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Type</th>
        <th>Account No</th>
        <th>Bank</th>
        <th>Mobile</th>
        <th>Address</th>
        <th>Total Area</th>
        <th>Village ID</th>
    </tr>

    <c:forEach var="c" items="${cultivators}">
        <tr>
            <td>${c.cultivatorId}</td>
            <td>${c.cultivatorName}</td>
            <td>${c.cultivatorType}</td>
            <td>${c.accountNo}</td>
            <td>${c.bankName}</td>
            <td>${c.cultivatorMobileNo}</td>
            <td>${c.cultivatorAddress}</td>
            <td>${c.totalAreaOfCane}</td>
            <td>${c.village}</td>
        </tr>
		
    </c:forEach>
	
</table>
<a href="${pageContext.request.contextPath}/report/cultivator/excel"
				   class="btn btn-success">
				   Export Excel
				</a>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>