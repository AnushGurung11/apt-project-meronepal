<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" %>

<form action="booking" method="post">
    <%-- Pass packageId to doPost --%>
    <input type="hidden" name="packageId" value="${selectedPackage.packageId}" />

    <h3>${selectedPackage.packageName}</h3>
    <p>NPR <fmt:formatNumber value="${selectedPackage.price}" maxFractionDigits="0" /></p>

    <%-- Show included services --%>
    <ul>
        <c:forEach var="service" items="${selectedPackage.services}">
            <li>${service.serviceName}</li>
        </c:forEach>
    </ul>

    <label>Event Date:</label>
    <input type="date" name="eventDate" required />

    <label>Event Address:</label>
    <input type="text" name="eventAddress" required />

    <label>Notes:</label>
    <textarea name="notes"></textarea>

    <button type="submit">Confirm Booking</button>
</form>