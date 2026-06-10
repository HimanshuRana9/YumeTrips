package com.yume.trips.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PlannerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/planner.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String destination = req.getParameter("destination");
        String budget = req.getParameter("budget");
        String days = req.getParameter("days");
        String tripType = req.getParameter("tripType");

        // Build a simple itinerary response
        StringBuilder plan = new StringBuilder();
        plan.append("<strong>Your ").append(days).append("-Day ").append(tripType).append(" Trip to ").append(destination).append("</strong><br/><br/>");
        plan.append("📅 <strong>Day 1:</strong> Arrive and check into your hotel. Explore the local area.<br/>");
        plan.append("📅 <strong>Day 2:</strong> Visit top attractions and landmarks. Enjoy local cuisine.<br/>");
        if (Integer.parseInt(days) >= 3) plan.append("📅 <strong>Day 3:</strong> Day trip to nearby scenic spots.<br/>");
        if (Integer.parseInt(days) >= 4) plan.append("📅 <strong>Day 4:</strong> Adventure activities & cultural experiences.<br/>");
        if (Integer.parseInt(days) >= 5) plan.append("📅 <strong>Day 5:</strong> Shopping, relaxation & farewell dinner.<br/>");
        plan.append("<br/>💰 <strong>Estimated Budget:</strong> ₹").append(budget);

        req.setAttribute("itineraryPlan", plan.toString());
        req.setAttribute("destination", destination);
        req.getRequestDispatcher("/WEB-INF/jsp/planner.jsp").forward(req, resp);
    }
}
