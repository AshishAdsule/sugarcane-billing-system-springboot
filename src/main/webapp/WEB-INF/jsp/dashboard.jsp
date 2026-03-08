<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/jsp/layout/header.jsp" %>
<%@ include file="/WEB-INF/jsp/layout/sidebar.jsp" %>

<div class="main-content">

    <h2>Dashboard</h2>
    <hr>

    <div class="row">

        <div class="col-md-3">
            <div class="card bg-primary text-white p-3">
                <h5>Total Farmers</h5>
                <h3>${cultivatorCount}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card bg-success text-white p-3">
                <h5>Total Weight</h5>
                <h3>${totalWeight}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card bg-warning text-white p-3">
                <h5>Total Bills</h5>
                <h3>${totalBill}</h3>
            </div>
        </div>

        

    </div>

</div>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>