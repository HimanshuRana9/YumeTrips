<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Route Map - YumeTrips" scope="request"/>
<jsp:include page="/WEB-INF/jsp/layout/header.jsp"/>

<section class="section">
    <div class="container">
        <div class="section-header">
            <span class="overline">Global Routes</span>
            <h2>Flight Route Intelligence</h2>
            <p>All available routes from New Delhi hub — flight times, airlines, and estimated prices.</p>
        </div>

        <div class="card" style="overflow:hidden;">
            <table style="width:100%;border-collapse:collapse;text-align:left;">
                <thead>
                    <tr style="background:var(--bg-elevated,var(--ink3));">
                        <th style="padding:16px 20px;color:var(--text-muted);font-size:0.82rem;letter-spacing:0.08em;text-transform:uppercase;font-weight:600;">From</th>
                        <th style="padding:16px 20px;color:var(--text-muted);font-size:0.82rem;letter-spacing:0.08em;text-transform:uppercase;font-weight:600;">To</th>
                        <th style="padding:16px 20px;color:var(--text-muted);font-size:0.82rem;letter-spacing:0.08em;text-transform:uppercase;font-weight:600;">Airline</th>
                        <th style="padding:16px 20px;color:var(--text-muted);font-size:0.82rem;letter-spacing:0.08em;text-transform:uppercase;font-weight:600;">Duration</th>
                        <th style="padding:16px 20px;color:var(--text-muted);font-size:0.82rem;letter-spacing:0.08em;text-transform:uppercase;font-weight:600;">Type</th>
                        <th style="padding:16px 20px;color:var(--text-muted);font-size:0.82rem;letter-spacing:0.08em;text-transform:uppercase;font-weight:600;">Est. Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr style="border-top:1px solid var(--border);">
                        <td style="padding:16px 20px;">New Delhi (DEL)</td>
                        <td style="padding:16px 20px;font-weight:600;color:var(--text-primary);">Tokyo (HND)</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">ANA / JAL</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">8h 15m</td>
                        <td style="padding:16px 20px;"><span class="badge badge-success">Direct</span></td>
                        <td style="padding:16px 20px;font-weight:700;color:var(--gold);">₹42,500</td>
                    </tr>
                    <tr style="border-top:1px solid var(--border);">
                        <td style="padding:16px 20px;">New Delhi (DEL)</td>
                        <td style="padding:16px 20px;font-weight:600;color:var(--text-primary);">Bali (DPS)</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">Singapore Airlines</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">10h 45m</td>
                        <td style="padding:16px 20px;"><span class="badge badge-warning">1 Stop</span></td>
                        <td style="padding:16px 20px;font-weight:700;color:var(--gold);">₹31,000</td>
                    </tr>
                    <tr style="border-top:1px solid var(--border);">
                        <td style="padding:16px 20px;">New Delhi (DEL)</td>
                        <td style="padding:16px 20px;font-weight:600;color:var(--text-primary);">Paris (CDG)</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">Air France</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">9h 30m</td>
                        <td style="padding:16px 20px;"><span class="badge badge-success">Direct</span></td>
                        <td style="padding:16px 20px;font-weight:700;color:var(--gold);">₹48,200</td>
                    </tr>
                    <tr style="border-top:1px solid var(--border);">
                        <td style="padding:16px 20px;">New Delhi (DEL)</td>
                        <td style="padding:16px 20px;font-weight:600;color:var(--text-primary);">Santorini (JTR)</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">Emirates</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">11h 20m</td>
                        <td style="padding:16px 20px;"><span class="badge badge-warning">1 Stop</span></td>
                        <td style="padding:16px 20px;font-weight:700;color:var(--gold);">₹52,000</td>
                    </tr>
                    <tr style="border-top:1px solid var(--border);">
                        <td style="padding:16px 20px;">New Delhi (DEL)</td>
                        <td style="padding:16px 20px;font-weight:600;color:var(--text-primary);">Maldives (MLE)</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">IndiGo / Air India</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">4h 10m</td>
                        <td style="padding:16px 20px;"><span class="badge badge-success">Direct</span></td>
                        <td style="padding:16px 20px;font-weight:700;color:var(--gold);">₹22,000</td>
                    </tr>
                    <tr style="border-top:1px solid var(--border);">
                        <td style="padding:16px 20px;">New Delhi (DEL)</td>
                        <td style="padding:16px 20px;font-weight:600;color:var(--text-primary);">Reykjavik (KEF)</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">Icelandair</td>
                        <td style="padding:16px 20px;color:var(--text-secondary);">14h 30m</td>
                        <td style="padding:16px 20px;"><span class="badge badge-warning">1 Stop</span></td>
                        <td style="padding:16px 20px;font-weight:700;color:var(--gold);">₹72,000</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="text-center mt-6">
            <a href="${pageContext.request.contextPath}/planner" class="btn btn-primary btn-lg">
                Plan Your Route →
            </a>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
