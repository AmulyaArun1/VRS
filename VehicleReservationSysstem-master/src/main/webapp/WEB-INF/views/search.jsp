<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.topnav {
	overflow: hidden;
	background-color: #e9e9e9;
}

.topnav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #2196F3;
	color: white;
}

.topnav .search-container {
	float: right;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
}

.topnav .search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

@media screen and (max-width: 600px) {
	.topnav .search-container {
		float: none;
	}
	.topnav a, .topnav input[type=text], .topnav .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.topnav input[type=text] {
		border: 1px solid #ccc;
	}
}

.custom-select {
	position: relative;
	font-family: Arial;
}

.custom-select select {
	display: none; /*hide original SELECT element: */
}

.select-selected {
	background-color: DodgerBlue;
}

/* Style the arrow inside the select element: */
.select-selected:after {
	position: absolute;
	content: "";
	top: 14px;
	right: 10px;
	width: 0;
	height: 0;
	border: 6px solid transparent;
	border-color: #fff transparent transparent transparent;
}

/* Point the arrow upwards when the select box is open (active): */
.select-selected.select-arrow-active:after {
	border-color: transparent transparent #fff transparent;
	top: 7px;
}

/* style the items (options), including the selected item: */
.select-items div, .select-selected {
	color: #ffffff;
	padding: 8px 16px;
	border: 1px solid transparent;
	border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
	cursor: pointer;
}

/* Style items (options): */
.select-items {
	position: absolute;
	background-color: DodgerBlue;
	top: 100%;
	left: 0;
	right: 0;
	z-index: 99;
}

/* Hide the items when the select box is closed: */
.select-hide {
	display: none;
}

.select-items div:hover, .same-as-selected {
	background-color: rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<form action="search.html" method="POST">

		<div class="topnav">
			<a class="active" href="home.html">Home</a> <a href="#about">About</a>
			<a href="#contact">Contact</a>

		</div>

		<br>
		<div align="center" class="custom-select" style="width: 400px"
			align="center">

			<select name="search_by" id="search_by">
				<option>Search By:</option>
				<option value="vehicleType">Vehicle Type</option>
				<option value="branch">Branch</option>
				<option value="serviceDue">Service Due</option>
				<option value="insuranceExpiry">Insurance Expiry</option>
			</select>
		</div>
		<div class="search-container" style="width: 400px"
			style="height:400px" align="center">
			<input type="text" placeholder="Search.." name="search" id="search">
			<button type="submit" onclick="search.html">
				<i class="fa fa-search"></i>
			</button>
		</div>

	</form>
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
				<td>
					<center>
						<span style="color: black">${vehicle.vehicleType}</span>
					</center>
				</td>
			</tr>
		</c:forEach>


	</table>

	<div style="padding-left: 16px"></div>

	<script>
var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
</script>

</body>
</html>
