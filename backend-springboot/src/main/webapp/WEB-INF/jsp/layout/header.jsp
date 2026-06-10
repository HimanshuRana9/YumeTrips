<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="en" data-theme="dark">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="YumeTrips - Your anime-themed smart travel companion." />
    <title>${pageTitle != null ? pageTitle : 'YumeTrips ✈️ Dream Travel Platform'}</title>
    
    <!-- Global Styles -->
    <link rel="stylesheet" href="/css/index.css" />
    <!-- Page Specific Styles (if any) -->
    <c:if test="${not empty pageCss}">
        <link rel="stylesheet" href="/css/${pageCss}" />
    </c:if>

    <style>
        /* Basic Nav Styles for Layout */
        .navbar {
            height: var(--nav-height);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 24px;
            background: var(--bg-glass);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid var(--border);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 100;
        }
        .nav-brand {
            font-family: var(--font-heading);
            font-weight: 700;
            font-size: 1.5rem;
            color: var(--primary);
        }
        .nav-links {
            display: flex;
            gap: 24px;
        }
        .nav-links a {
            color: var(--text-primary);
            font-weight: 600;
            transition: var(--transition);
        }
        .nav-links a:hover {
            color: var(--primary);
        }
    </style>
</head>
<body>
    
    <nav class="navbar">
        <a href="/" class="nav-brand">YumeTrips</a>
        <div class="nav-links">
            <a href="/">Home</a>
            <a href="/destinations">Destinations</a>
            <a href="/hotels">Hotels</a>
            <a href="/planner">Planner</a>
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <a href="/dashboard">Dashboard</a>
                    <a href="/logout" class="btn btn-sm btn-outline">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="/login">Login</a>
                    <a href="/register" class="btn btn-sm btn-primary">Register</a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>

    <div class="page-wrapper">
        <!-- Main Content Starts Here -->
