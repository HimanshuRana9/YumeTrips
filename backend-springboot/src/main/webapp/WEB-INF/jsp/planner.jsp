<jsp:include page="/WEB-INF/jsp/layout/header.jsp">
    <jsp:param name="pageTitle" value="AI Planner - YumeTrips" />
</jsp:include>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<section class="section" style="background: var(--bg-darker);">
    <div class="container">
        <div class="section-header">
            <h2>AI Trip Planner</h2>
            <p>Generate a custom itinerary tailored to your budget and travel style.</p>
        </div>
        
        <div class="card" style="max-width: 600px; margin: 0 auto; padding: 32px;">
            <form action="/planner/generate" method="POST">
                <div class="form-group">
                    <label class="label">Destination</label>
                    <input type="text" name="destination" class="input" placeholder="e.g. Kyoto, Japan" required />
                </div>
                <div class="form-group">
                    <label class="label">Budget (in ₹)</label>
                    <input type="number" name="budget" class="input" placeholder="e.g. 50000" required />
                </div>
                <div class="form-group">
                    <label class="label">Duration (Days)</label>
                    <input type="number" name="days" class="input" placeholder="e.g. 5" required />
                </div>
                <div class="form-group">
                    <label class="label">Travel Style</label>
                    <select name="tripType" class="input" required>
                        <option value="adventure">Adventure</option>
                        <option value="romantic">Romantic</option>
                        <option value="family">Family</option>
                        <option value="cultural">Cultural</option>
                        <option value="luxury">Luxury</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary w-full mt-4" style="justify-content: center;">Generate Itinerary</button>
            </form>
        </div>

        <c:if test="${not empty itinerary}">
            <div class="card mt-6" style="padding: 32px;">
                <h3 class="mb-4">Your Custom Itinerary for ${itinerary.destination}</h3>
                <div class="content-body">
                    ${itinerary.plan}
                </div>
            </div>
        </c:if>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
