<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="en" data-theme="dark">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="YumeTrips - Your anime-themed smart travel companion."/>
    <title>${not empty pageTitle ? pageTitle : 'YumeTrips ✈️ Dream Travel Platform'}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <c:if test="${not empty pageCss}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/${pageCss}"/>
    </c:if>
    <style>
        .navbar {
            height: var(--nav-height);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 32px;
            background: var(--bg-glass);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-bottom: 1px solid var(--border);
            position: fixed;
            top: 0; left: 0; right: 0;
            z-index: 100;
        }
        .nav-brand {
            font-family: var(--font-heading);
            font-weight: 700;
            font-size: 1.5rem;
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: 1px;
        }
        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }
        .nav-links a {
            color: var(--text-secondary);
            font-weight: 600;
            font-size: 0.92rem;
            transition: var(--transition);
            letter-spacing: 0.02em;
        }
        .nav-links a:hover { color: var(--primary); }
        .nav-user {
            color: var(--gold);
            font-weight: 600;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<nav class="navbar">
    <a href="${pageContext.request.contextPath}/" class="nav-brand">✈ YumeTrips</a>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/destinations">Destinations</a>
        <a href="${pageContext.request.contextPath}/hotels">Hotels</a>
        <a href="${pageContext.request.contextPath}/planner">Planner</a>
        <a href="${pageContext.request.contextPath}/route-map">Routes</a>
        <c:choose>
            <c:when test="${not empty sessionScope.userName}">
                <span class="nav-user">👤 ${sessionScope.userName}</span>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm btn-outline">Logout</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/login">Login</a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-sm btn-primary">Register</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<div class="page-wrapper">
