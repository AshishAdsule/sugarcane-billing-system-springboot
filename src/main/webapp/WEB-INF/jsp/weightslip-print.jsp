<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>

<title>Weight Slip</title>

<style>

body{
    font-family: Arial;
}

.slip{
    width: 400px;
    border: 1px solid black;
    padding: 20px;
}

h2{
    text-align:center;
}

table{
    width:100%;
}

td{
    padding:6px;
}

</style>

</head>

<body onload="window.print()">

<div class="slip">

<h2>Sugar Factory</h2>

<hr>

<table>

<tr>
<td>Slip ID</td>
<td>${slip.weightSlipId}</td>
</tr>

<tr>
<td>Cane Cut ID</td>
<td>${slip.caneCutSlip.caneCutId}</td>
</tr>

<tr>
<td>Gross Weight</td>
<td>${slip.grossWeight}</td>
</tr>

<tr>
<td>Tare Weight</td>
<td>${slip.tareWeight}</td>
</tr>

<tr>
<td>Net Weight</td>
<td>${slip.netWeight}</td>
</tr>

<tr>
<td>Date</td>
<td>${slip.weightSlipDate}</td>
</tr>

</table>

</div>

</body>
</html>

<%@ include file="/WEB-INF/jsp/layout/footer.jsp" %>