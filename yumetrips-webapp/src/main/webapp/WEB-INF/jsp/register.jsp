<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Register - YumeTrips" scope="request"/>
<jsp:include page="/WEB-INF/jsp/layout/header.jsp"/>

<section class="section flex-center" style="min-height:80vh;">
    <div style="width:100%;max-width:460px;">
        <div class="glass-card" style="padding:40px;">
            <h2 class="text-center" style="margin:0 0 8px;">Join YumeTrips</h2>
            <p class="text-center" style="color:var(--text-muted);margin:0 0 32px;font-size:0.9rem;">
                Start planning your dream journeys today.
            </p>

            <c:if test="${not empty error}">
                <div style="background:rgba(239,68,68,0.1);border:1px solid rgba(239,68,68,0.3);border-radius:var(--radius-md);padding:12px 16px;margin-bottom:20px;color:#f87171;font-size:0.88rem;">
                    ⚠️ ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="POST">
                <div class="form-group">
                    <label class="label">Full Name</label>
                    <input type="text" name="name" class="input" required placeholder="Your Name"/>
                </div>
                <div class="form-group">
                    <label class="label">Email Address</label>
                    <input type="email" name="email" class="input" required placeholder="you@example.com"/>
                </div>
                <div class="form-group">
                    <label class="label">Password</label>
                    <input type="password" name="password" class="input" required
                           placeholder="At least 6 characters"/>
                </div>
                <button type="submit" class="btn btn-primary w-full" style="justify-content:center;margin-top:8px;">
                    Create Account →
                </button>
            </form>

            <div class="divider"></div>
            <p class="text-center" style="color:var(--text-muted);font-size:0.88rem;">
                Already have an account?
                <a href="${pageContext.request.contextPath}/login" style="color:var(--gold);font-weight:600;">Sign in</a>
            </p>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp"/>
