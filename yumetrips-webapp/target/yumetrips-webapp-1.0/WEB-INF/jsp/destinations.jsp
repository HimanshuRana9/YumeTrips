<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Destinations - YumeTrips" scope="request"/>
<jsp:include page="/WEB-INF/jsp/layout/header.jsp"/>

<section class="section">
    <div class="container">
        <div class="section-header">
            <span class="overline">Explore the World</span>
            <h2>All Destinations</h2>
            <p>Discover your next dream vacation from our curated selection of top global destinations.</p>
        </div>

        <!-- Search Bar -->
        <div style="max-width:500px;margin:0 auto 48px;">
            <form action="${pageContext.request.contextPath}/destinations" method="GET" style="display:flex;gap:12px;">
                <input type="text" name="search" class="input" placeholder="Search destinations..."
                       value="${not empty search ? search : ''}"/>
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>

        <c:if test="${not empty search}">
            <p style="color:var(--text-muted);margin-bottom:32px;text-align:center;">
                Showing results for: <strong style="color:var(--gold);">"${search}"</strong>
            </p>
        </c:if>

        <div class="grid-3">
            <c:forEach var="dest" items="${destinations}">
                <div class="card" style="overflow:hidden;">
                    <div style="background:linear-gradient(135deg,var(--ink2),var(--accent2),var(--ink3));padding:40px 24px 20px;position:relative;">
                        <span style="position:absolute;top:8px;right:12px;font-size:3.5rem;opacity:0.1;font-family:var(--font-heading);">旅</span>
                        <span class="badge" style="background:rgba(201,169,110,0.2);color:var(--gold);margin-bottom:12px;">${dest.category}</span>
                        <h3 style="margin:0 0 4px;font-size:1.3rem;">${dest.name}</h3>
                        <p style="color:var(--text-muted);font-size:0.85rem;margin:0;">📍 ${dest.location}</p>
                    </div>
                    <div style="padding:20px 24px;">
                        <p style="color:var(--text-secondary);font-size:0.88rem;line-height:1.6;margin:0 0 16px;">${dest.description}</p>
                        <div class="flex-between">
                            <span style="font-weight:700;color:var(--gold);font-size:1rem;">${dest.price}</span>
                            <span style="color:#fbbf24;font-weight:600;">⭐ ${dest.rating}</span>
                        </div>
                        <div style="display:flex;gap:10px;margin-top:14px;">
                            <a href="${pageContext.request.contextPath}/planner"
                               class="btn btn-primary btn-sm" style="flex:1;text-align:center;justify-content:center;">
                               Book Now
                            </a>
                            <a href="${pageContext.request.contextPath}/hotels"
                               class="btn btn-outline btn-sm" style="flex:1;text-align:center;justify-content:center;">
                               Hotels
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty destinations}">
                <div style="grid-column:1/-1;text-align:center;padding:60px 0;">
                    <p style="font-size:3rem;">🔍</p>
                    <p style="color:var(--text-muted);margin-top:12px;">No destinations found for "<strong>${search}</strong>"</p>
                    <a href="${pageContext.request.contextPath}/destinations" class="btn btn-outline mt-4">Clear Search</a>
                </div>
            </c:if>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
