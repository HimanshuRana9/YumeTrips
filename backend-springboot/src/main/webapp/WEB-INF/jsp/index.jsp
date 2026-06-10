<jsp:include page="/WEB-INF/jsp/layout/header.jsp">
    <jsp:param name="pageTitle" value="Home - YumeTrips" />
</jsp:include>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<section class="section">
    <div class="container text-center">
        <h1>Journeys crafted <em>exactly as you dreamed</em></h1>
        <p class="mt-4">Discover the timeless serenity of Kyoto, the pristine lagoons of the Maldives, and the ethereal auroras of Iceland.</p>
        
        <div class="card mt-6" style="padding: 24px; max-width: 800px; margin-left: auto; margin-right: auto;">
            <form action="/destinations" method="GET" class="flex gap-4">
                <input type="text" name="search" class="input" placeholder="Where to? (e.g. Kyoto, Bali)" />
                <button type="submit" class="btn btn-primary">Explore Destinations</button>
            </form>
        </div>
    </div>
</section>

<section class="section" style="background: var(--bg-elevated);">
    <div class="container">
        <div class="section-header">
            <h2>Curated Destinations</h2>
            <p>Explore hand-picked destinations complete with immersive travel guides.</p>
        </div>
        
        <div class="grid-3">
            <c:forEach var="dest" items="${destinations}">
                <div class="card" style="padding: 16px;">
                    <h3>${dest.name}</h3>
                    <p class="text-muted mt-2">📍 ${dest.location}</p>
                    <div class="flex-between mt-4">
                        <span class="badge badge-primary">From ₹${dest.price}</span>
                        <span>⭐ ${dest.rating}</span>
                    </div>
                    <a href="/destinations/${dest.id}" class="btn btn-sm btn-outline mt-4 w-full" style="text-align: center;">View Details</a>
                </div>
            </c:forEach>
            <c:if test="${empty destinations}">
                <p>No featured destinations available at the moment.</p>
            </c:if>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <div class="section-header">
            <h2>Featured Signature Packages</h2>
        </div>
        
        <div class="grid-2">
            <c:forEach var="pkg" items="${packages}">
                <div class="card" style="padding: 24px;">
                    <h3>${pkg.title}</h3>
                    <p class="mt-2 text-muted">${pkg.days} Days / ${pkg.days - 1} Nights</p>
                    <p class="mt-4">${pkg.description}</p>
                    <div class="flex-between mt-4">
                        <span style="font-weight: bold; font-size: 1.2rem;">₹${pkg.price}</span>
                        <a href="/packages/${pkg.id}" class="btn btn-primary">View Package</a>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty packages}">
                <p>No featured packages available.</p>
            </c:if>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
