<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="YumeTrips ✈️ Dream Travel Platform" scope="request"/>
<jsp:include page="/WEB-INF/jsp/layout/header.jsp"/>

<!-- HERO SECTION -->
<section style="min-height:70vh;display:flex;align-items:center;background:radial-gradient(ellipse at 60% 40%, rgba(201,169,110,0.12) 0%, transparent 70%), var(--bg);padding-top:var(--nav-height);">
    <div class="container text-center animate-fadeUp">
        <div class="badge badge-primary mb-4" style="padding:6px 18px;font-size:0.8rem;letter-spacing:0.1em;">
            YumeTrips Premium Curations
        </div>
        <h1 style="margin:20px 0;line-height:1.1;">
            Journeys crafted <em style="color:var(--gold);font-style:normal;">exactly as you dreamed</em>
        </h1>
        <p style="color:var(--text-secondary);font-size:1.1rem;max-width:560px;margin:0 auto 40px;">
            Discover the timeless serenity of Kyoto, the pristine lagoons of the Maldives,
            and the ethereal auroras of Iceland.
        </p>

        <!-- Search Form -->
        <div class="glass-card" style="max-width:700px;margin:0 auto;padding:28px 32px;">
            <form action="${pageContext.request.contextPath}/destinations" method="GET"
                  style="display:flex;gap:16px;align-items:center;flex-wrap:wrap;">
                <input type="text" name="search" class="input" placeholder="🔍  Where to? (e.g. Kyoto, Bali, Paris...)"
                       style="flex:1;min-width:200px;" value="${param.search}"/>
                <button type="submit" class="btn btn-primary btn-lg">Explore Now</button>
            </form>
            <div style="display:flex;gap:10px;margin-top:16px;flex-wrap:wrap;justify-content:center;">
                <span style="color:var(--text-muted);font-size:0.85rem;align-self:center;">Trending:</span>
                <c:forEach var="chip" items="${['Kyoto','Bali','Paris','Santorini','Maldives']}">
                    <a href="${pageContext.request.contextPath}/destinations?search=${chip}"
                       class="badge badge-primary" style="padding:6px 14px;cursor:pointer;">${chip}</a>
                </c:forEach>
            </div>
        </div>
    </div>
</section>

<!-- DESTINATIONS SECTION -->
<section class="section">
    <div class="container">
        <div class="section-header">
            <span class="overline">Curated Wonders</span>
            <h2>Featured Destinations</h2>
            <p>Hand-picked destinations complete with immersive travel guides and detailed transit info.</p>
        </div>

        <div class="grid-3">
            <c:forEach var="dest" items="${destinations}">
                <div class="card" style="position:relative;overflow:hidden;">
                    <div style="background:linear-gradient(135deg,var(--ink2),var(--ink3));padding:32px 24px 16px;min-height:140px;display:flex;flex-direction:column;justify-content:flex-end;">
                        <span style="font-size:3rem;position:absolute;top:12px;right:16px;opacity:0.15;font-family:var(--font-heading);">旅</span>
                        <span class="badge badge-primary" style="width:fit-content;margin-bottom:8px;">${dest.category}</span>
                        <h3 style="font-size:1.2rem;margin:0;">${dest.name}</h3>
                        <p style="color:var(--text-muted);font-size:0.85rem;margin:4px 0 0;">📍 ${dest.location}</p>
                    </div>
                    <div style="padding:16px 24px 20px;">
                        <p style="color:var(--text-secondary);font-size:0.88rem;line-height:1.5;margin:0 0 16px;">${dest.description}</p>
                        <div class="flex-between">
                            <span style="font-weight:700;color:var(--gold);">${dest.price}</span>
                            <span style="color:#fbbf24;">⭐ ${dest.rating}</span>
                        </div>
                        <a href="${pageContext.request.contextPath}/destinations?search=${dest.name}"
                           class="btn btn-outline btn-sm w-full mt-4" style="text-align:center;display:block;">
                            View Details →
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="text-center mt-6">
            <a href="${pageContext.request.contextPath}/destinations" class="btn btn-accent btn-lg">
                View All Destinations
            </a>
        </div>
    </div>
</section>

<!-- PACKAGES SECTION -->
<section class="section" style="background:var(--bg-elevated,var(--ink3));">
    <div class="container">
        <div class="section-header">
            <span class="overline">Editor's Choice</span>
            <h2>Signature Packages</h2>
            <p>All-inclusive curated experiences designed for unforgettable journeys.</p>
        </div>

        <div class="grid-2">
            <c:forEach var="pkg" items="${packages}">
                <div class="card" style="padding:28px;">
                    <div class="flex-between mb-4">
                        <span class="badge badge-primary">${pkg.duration}</span>
                        <span style="color:#fbbf24;font-weight:600;">⭐ ${pkg.rating}</span>
                    </div>
                    <h3 style="margin:0 0 12px;">${pkg.title}</h3>
                    <p style="color:var(--text-secondary);margin:0 0 20px;line-height:1.6;">${pkg.description}</p>
                    <div class="flex-between">
                        <span style="font-size:1.4rem;font-weight:700;color:var(--gold);">${pkg.price}</span>
                        <a href="${pageContext.request.contextPath}/planner" class="btn btn-primary">Book Package →</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- STATS BAR -->
<section style="background:var(--bg-glass);border-top:1px solid var(--border);border-bottom:1px solid var(--border);padding:40px 0;">
    <div class="container">
        <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:24px;text-align:center;">
            <div>
                <div style="font-size:2rem;margin-bottom:6px;">😊</div>
                <div style="font-size:1.8rem;font-weight:800;color:var(--gold);">14,200+</div>
                <div style="color:var(--text-muted);font-size:0.88rem;">Trips Guided</div>
            </div>
            <div>
                <div style="font-size:2rem;margin-bottom:6px;">⭐</div>
                <div style="font-size:1.8rem;font-weight:800;color:var(--gold);">99.4%</div>
                <div style="color:var(--text-muted);font-size:0.88rem;">Satisfaction Rate</div>
            </div>
            <div>
                <div style="font-size:2rem;margin-bottom:6px;">🌐</div>
                <div style="font-size:1.8rem;font-weight:800;color:var(--gold);">48+</div>
                <div style="color:var(--text-muted);font-size:0.88rem;">Global Destinations</div>
            </div>
            <div>
                <div style="font-size:2rem;margin-bottom:6px;">⚡</div>
                <div style="font-size:1.8rem;font-weight:800;color:var(--gold);">24/7</div>
                <div style="color:var(--text-muted);font-size:0.88rem;">Route Assistance</div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
