<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <title>Intuit Discounts</title>

</head>
<body>
<h1>Intuit Discounts!</h1>

<form name="zipCode" action="sendRequest" method="post">
    <h3>Enter your location...</h3>
    <table >
        <tr><td>
            Business type</td>
            <td><select id="myList" onchange="searchIndustry()">
                <option>None</option>
                <option>Retail</option>
                <option>Education</option>
                <option>Office-based Healthcare</option>
                <option>Supermarket</option>
                <option>Mail Order & Internet</option>
                <option>Restaurant</option>
                <option>Travel & Transportation</option>
                <option>Lodging</option>
                <option>Fast Food Restaurant</option>
                <option>Services, Wholesale & All Other</option>
                <option>Independent Gas Stations</option>
                <option>Telecommunications</option>
                <option>Telecommunications Cable/Computer Network</option>
            </select></td></tr>
        <tr><td> City, State </td> <td> <input type="text" size="20" name="city"> <input type="text" size="2" name="state"></td></tr>
        <tr><td> ZipCode </td> <td> <input size="5" name="zipCode"></td></tr>
        <tr><td></td><td><input type="submit" value="Submit"></td></tr>
    </table>
</form>
<hr>
<h3>Local Businesses</h3>

<div class="table-container">
      <table id="table1">
    	<tr>
    	<td>Business Name </td>
    	<td>Business Type</td>
		<td>Phone</td>
    	<td>Address</td>	    	
		<td>Map</td>
		</tr>
        <c:forEach var="result" items='${businessList}'>
            <tr>
                <td>
                    <c:out value="${result.dbaname}"></c:out>
                </td>
                <td>
                    <c:out value="${result.businessdescription}"></c:out>
                </td>
                <td>
                    1112224444
                </td>
                <td>
                    <c:out value="${result.streetaddress}${result.city} ${result.state} ${result.zipcode}"></c:out>
                </td>
                <td>
                    <a href="https://maps.google.com/?q=${result.streetaddress},+${result.city},+${result.state},+${result.zipcode}"><img width="30" height="30" src="${pageContext.servletContext.contextPath}/resources/pointer.png" alt="Image Intuit"/>
                    </a>
                </td>
                
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
