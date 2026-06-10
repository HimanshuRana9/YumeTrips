<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Luxury Hotels - YumeTrips" scope="request"/>
<jsp:include page="/WEB-INF/jsp/layout/header.jsp"/>

<section class="section">
    <div class="container">
        <div class="section-header">
            <span class="overline">Luxury Stays</span>
            <h2>Handpicked Hotels</h2>
            <p>The world's most breathtaking accommodations, curated for unforgettable stays.</p>
        </div>

        <div class="grid-3">
            <c:forEach var="hotel" items="${hotels}">
                <div class="card" style="overflow:hidden;">
                    <div style="background:linear-gradient(135deg,var(--ink3),#1a1030);padding:32px 24px 18px;position:relative;">
                        <span style="position:absolute;top:8px;right:12px;font-size:3rem;opacity:0.12;">🏨</span>
                        <span class="badge" style="background:rgba(124,58,237,0.2);color:#a78bfa;margin-bottom:10px;">${hotel.type}</span>
                        <h3 style="margin:0 0 4px;font-size:1.1rem;">${hotel.name}</h3>
                        <p style="color:var(--text-muted);font-size:0.84rem;margin:0;">📍 ${hotel.location}</p>
                    </div>
                    <div style="padding:18px 24px 20px;">
                        <p style="color:var(--text-secondary);font-size:0.87rem;line-height:1.6;margin:0 0 14px;">${hotel.description}</p>
                        <div class="flex-between">
                            <span style="font-weight:700;color:var(--gold);">${hotel.price}</span>
                            <span style="color:#fbbf24;">⭐ ${hotel.rating}</span>
                        </div>
                        <a href="${pageContext.request.contextPath}/planner"
                           class="btn btn-primary btn-sm w-full mt-4" style="text-align:center;justify-content:center;">
                            Book Room →
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
