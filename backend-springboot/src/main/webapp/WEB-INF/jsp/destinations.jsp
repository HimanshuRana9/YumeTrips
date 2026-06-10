<jsp:include page="/WEB-INF/jsp/layout/header.jsp">
    <jsp:param name="pageTitle" value="Destinations - YumeTrips" />
</jsp:include>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<section class="section">
    <div class="container">
        <div class="section-header">
            <h2>Explore Destinations</h2>
            <p>Find your next dream vacation spot.</p>
        </div>
        
        <div class="grid-3">
            <c:forEach var="dest" items="${destinations}">
                <div class="card" style="padding: 16px;">
                    <h3>${dest.name}</h3>
                    <p class="text-muted mt-2">📍 ${dest.location}</p>
                    <p class="mt-2">${dest.description}</p>
                    <div class="flex-between mt-4">
                        <span class="badge badge-primary">From ₹${dest.price}</span>
                        <span>⭐ ${dest.rating}</span>
                    </div>
                    <a href="/destinations/${dest.id}" class="btn btn-sm btn-outline mt-4 w-full" style="text-align: center;">View Details</a>
                </div>
            </c:forEach>
            <c:if test="${empty destinations}">
                <p class="text-center w-full">No destinations found.</p>
            </c:if>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
