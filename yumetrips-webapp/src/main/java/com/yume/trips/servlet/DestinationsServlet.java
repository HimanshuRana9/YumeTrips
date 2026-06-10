package com.yume.trips.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DestinationsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String search = req.getParameter("search");

        List<Map<String, Object>> destinations = new ArrayList<>();
        destinations.add(createDest("Kyoto", "Japan", "₹42,000", "4.9", "Ancient temples, cherry blossoms & zen gardens", "Cultural"));
        destinations.add(createDest("Bali", "Indonesia", "₹31,000", "4.8", "Tropical paradise with sacred temples & rice terraces", "Beach"));
        destinations.add(createDest("Santorini", "Greece", "₹68,000", "4.9", "Whitewashed clifftop villages above a volcanic caldera", "Romantic"));
        destinations.add(createDest("Maldives", "South Asia", "₹95,000", "5.0", "Crystal lagoons, overwater bungalows & coral reefs", "Luxury"));
        destinations.add(createDest("Paris", "France", "₹58,000", "4.7", "City of love — art, cuisine & the Eiffel Tower", "Cultural"));
        destinations.add(createDest("Manali", "India", "₹12,000", "4.6", "Snow-capped Himalayas, adventure sports & pine forests", "Adventure"));
        destinations.add(createDest("Goa", "India", "₹15,000", "4.5", "Sun-kissed beaches, vibrant nightlife & colonial heritage", "Beach"));
        destinations.add(createDest("Reykjavik", "Iceland", "₹85,000", "4.8", "Geysers, Northern Lights & raw volcanic landscapes", "Adventure"));
        destinations.add(createDest("Dubai", "UAE", "₹55,000", "4.7", "Futuristic skyline, gold souks & desert adventures", "Luxury"));

        // Filter by search if provided
        if (search != null && !search.isEmpty()) {
            final String query = search.toLowerCase();
            destinations = destinations.stream()
                .filter(d -> d.get("name").toString().toLowerCase().contains(query)
                          || d.get("location").toString().toLowerCase().contains(query))
                .collect(java.util.stream.Collectors.toList());
        }

        req.setAttribute("destinations", destinations);
        req.setAttribute("search", search);
        req.getRequestDispatcher("/WEB-INF/jsp/destinations.jsp").forward(req, resp);
    }

    private Map<String, Object> createDest(String name, String location, String price, String rating, String desc, String category) {
        Map<String, Object> d = new HashMap<>();
        d.put("name", name);
        d.put("location", location);
        d.put("price", price);
        d.put("rating", rating);
        d.put("description", desc);
        d.put("category", category);
        return d;
    }
}
