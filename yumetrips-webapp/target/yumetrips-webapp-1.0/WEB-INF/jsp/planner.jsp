<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Trip Planner - YumeTrips" scope="request"/>
<jsp:include page="/WEB-INF/jsp/layout/header.jsp"/>

<section class="section">
    <div class="container">
        <div class="section-header">
            <span class="overline">AI Generation</span>
            <h2>Smart Trip Planner</h2>
            <p>Fill in your preferences and get a custom day-by-day itinerary generated instantly.</p>
        </div>

        <div style="display:grid;grid-template-columns:1fr 1fr;gap:32px;max-width:1000px;margin:0 auto;">

            <!-- Form Panel -->
            <div class="glass-card" style="padding:32px;">
                <h3 style="margin:0 0 8px;">✨ Planner Configuration</h3>
                <p style="color:var(--text-muted);font-size:0.88rem;margin:0 0 24px;">
                    Set your preferences to generate your dream itinerary.
                </p>

                <form action="${pageContext.request.contextPath}/planner" method="POST">
                    <div class="form-group">
                        <label class="label">📍 Destination</label>
                        <input type="text" name="destination" class="input"
                               placeholder="e.g. Kyoto, Bali, Paris" required
                               value="${not empty destination ? destination : ''}"/>
                    </div>
                    <div class="form-group">
                        <label class="label">💰 Budget (₹)</label>
                        <input type="number" name="budget" class="input"
                               placeholder="e.g. 75000" required min="1000"/>
                    </div>
                    <div class="form-group">
                        <label class="label">📅 Duration (Days)</label>
                        <select name="days" class="input" required>
                            <option value="3">3 Days (Weekend)</option>
                            <option value="5" selected>5 Days</option>
                            <option value="7">7 Days (1 Week)</option>
                            <option value="10">10 Days</option>
                            <option value="14">14 Days (2 Weeks)</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="label">🎯 Travel Style</label>
                        <select name="tripType" class="input" required>
                            <option value="Adventure">Adventure</option>
                            <option value="Romantic">Romantic</option>
                            <option value="Family">Family</option>
                            <option value="Cultural">Cultural</option>
                            <option value="Luxury">Luxury</option>
                            <option value="Beach">Beach</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-full" style="justify-content:center;margin-top:8px;">
                        🚀 Generate Itinerary
                    </button>
                </form>
            </div>

            <!-- Result Panel -->
            <div class="glass-card" style="padding:32px;">
                <h3 style="margin:0 0 20px;">📋 Your Itinerary</h3>
                <c:choose>
                    <c:when test="${not empty itineraryPlan}">
                        <div style="line-height:2;color:var(--text-secondary);">${itineraryPlan}</div>
                        <div class="divider"></div>
                        <a href="${pageContext.request.contextPath}/planner" class="btn btn-outline btn-sm">
                            ← Generate Another
                        </a>
                    </c:when>
                    <c:otherwise>
                        <div style="text-align:center;padding:40px 20px;color:var(--text-muted);">
                            <p style="font-size:3rem;margin-bottom:16px;">🗺️</p>
                            <p style="font-size:0.95rem;line-height:1.7;">
                                Fill in your travel preferences on the left and click
                                <strong style="color:var(--gold);">Generate Itinerary</strong>
                                to see your personalized day-by-day plan here.
                            </p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
