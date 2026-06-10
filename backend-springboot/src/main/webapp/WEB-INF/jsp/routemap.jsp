<jsp:include page="/WEB-INF/jsp/layout/header.jsp">
    <jsp:param name="pageTitle" value="Route Map - YumeTrips" />
</jsp:include>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<section class="section">
    <div class="container text-center">
        <div class="section-header">
            <h2>Interactive Route Map</h2>
            <p>Visualize flights and transit routes across the globe.</p>
        </div>
        
        <div class="card" style="padding: 48px; background: var(--bg-glass);">
            <h3>Global Routing Intelligence</h3>
            <p class="text-muted mt-4 mb-6">
                (The 3D WebGL Globe from the React version is unavailable in the SSR JSP version. 
                Please use the mobile app or native client for full 3D rendering capabilities.)
            </p>
            
            <table style="width: 100%; text-align: left; border-collapse: collapse; margin-top: 24px;">
                <tr style="border-bottom: 1px solid var(--border);">
                    <th style="padding: 12px;">From</th>
                    <th style="padding: 12px;">To</th>
                    <th style="padding: 12px;">Airline</th>
                    <th style="padding: 12px;">Duration</th>
                    <th style="padding: 12px;">Price</th>
                </tr>
                <tr style="border-bottom: 1px solid var(--border-dark);">
                    <td style="padding: 12px;">New Delhi (DEL)</td>
                    <td style="padding: 12px;">Tokyo (HND)</td>
                    <td style="padding: 12px;">ANA / JAL</td>
                    <td style="padding: 12px;">8h 15m</td>
                    <td style="padding: 12px;">₹42,500</td>
                </tr>
                <tr style="border-bottom: 1px solid var(--border-dark);">
                    <td style="padding: 12px;">New Delhi (DEL)</td>
                    <td style="padding: 12px;">Bali (DPS)</td>
                    <td style="padding: 12px;">Singapore Airlines</td>
                    <td style="padding: 12px;">10h 45m</td>
                    <td style="padding: 12px;">₹31,000</td>
                </tr>
                <tr style="border-bottom: 1px solid var(--border-dark);">
                    <td style="padding: 12px;">New Delhi (DEL)</td>
                    <td style="padding: 12px;">Paris (CDG)</td>
                    <td style="padding: 12px;">Air France</td>
                    <td style="padding: 12px;">9h 30m</td>
                    <td style="padding: 12px;">₹48,200</td>
                </tr>
            </table>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
