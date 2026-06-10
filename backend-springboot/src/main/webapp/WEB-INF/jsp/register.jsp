<jsp:include page="/WEB-INF/jsp/layout/header.jsp">
    <jsp:param name="pageTitle" value="Register - YumeTrips" />
</jsp:include>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<section class="section">
    <div class="container" style="max-width: 500px;">
        <div class="card" style="padding: 32px;">
            <h2 class="text-center mb-6">Join YumeTrips</h2>
            
            <c:if test="${not empty error}">
                <div class="badge badge-danger w-full mb-4" style="padding: 12px; justify-content: center;">${error}</div>
            </c:if>

            <form action="/register" method="POST">
                <div class="form-group">
                    <label class="label">Full Name</label>
                    <input type="text" name="name" class="input" required />
                </div>
                <div class="form-group">
                    <label class="label">Email Address</label>
                    <input type="email" name="email" class="input" required />
                </div>
                <div class="form-group">
                    <label class="label">Password</label>
                    <input type="password" name="password" class="input" required />
                </div>
                <button type="submit" class="btn btn-primary w-full" style="justify-content: center; margin-top: 16px;">Create Account</button>
            </form>
            
            <p class="text-center mt-6 text-muted">
                Already have an account? <a href="/login" style="color: var(--primary);">Sign in</a>
            </p>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/jsp/layout/footer.jsp" />
