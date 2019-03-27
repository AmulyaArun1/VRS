<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Vehicles</title>
</head>
<body>
	<a href="addVehicles.html">Add Product</a>
	<br>
	<table border="1">
		<tr>
			<td>
				<center>
					<span style="color: black">Vehicle Number</span>
				</center>
			</td>
			<td>
				<center>
					<span style="color: black">Branch</span>
				</center>
			</td>
			<td>
				<center>
					<span style="color: black">Insurance Expiry</span>
				</center>
			</td>
			<td>
				<center>
					<span style="color: black">Last Service</span>
				</center>
			</td>
			<td>
				<center>
					<span style="color: black">Service Due</span>
				</center>
			</td>
			<td>
				<center>
					<span style="color: black">Vehicle Type</span>
				</center>
			</td>
		</tr>
		<c:forEach var="vehicle" items="${vehicle}">
			<tr>

				<td>
					<center>
						<span style="color: black">${vehicle.vehicleNumber}</span>
					</center>
				</td>


				<td>
					<center>
						<span style="color: black">${vehicle.branch}</span>
					</center>
				</td>
				<td>
					<center>
						<span style="color: black">${vehicle.vehicleType}</span>
					</center>
				</td>
				<td>
					<center>
						<span style="color: black">${vehicle.insuranceExpiry}</span>
					</center>
				</td>
				<td>
					<center>
						<span style="color: black">${vehicle.lastService}</span>
					</center>
				</td>
				<td>
					<center>
						<span style="color: black">${vehicle.serviceDue}</span>
					</center>
				</td>
			</tr>
		</c:forEach>


	</table>
</body>
</html>