<jsp:include page="/WEB-INF/jsp/layout/header.jsp">
    <jsp:param name="pageTitle" value="Hotels - YumeTrips" />
</jsp:include>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<section class="section">
    <div class="container">
        <div class="section-header">
            <h2>Luxury Hotels & Stays</h2>
            <p>Handpicked accommodations for the perfect rest.</p>
        </div>
        
        <div class="grid-3">
            <c:forEach var="hotel" items="${hotels}">
                <div class="card" style="padding: 16px;">
                    <h3>${hotel.name}</h3>
                    <p class="text-muted mt-2">📍 ${hotel.location}</p>
                    <p class="mt-2">${hotel.description}</p>
                    <div class="flex-between mt-4">
                        <span class="badge badge-primary">₹${hotel.pricePerNight} / night</span>
                        <span>⭐ ${hotel.rating}</span>
                    </div>
                    <a href="/hotels/${hotel.id}" class="btn btn-sm btn-outline mt-4 w-full" style="text-align: center;">View Rooms</a>
                </div>
            </c:forEach>
            <c:if test="${empty hotels}">
                <p class="text-center w-full">No hotels found.</p>
            </c:if>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
