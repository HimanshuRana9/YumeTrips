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

public class HotelsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Map<String, Object>> hotels = new ArrayList<>();
        hotels.add(createHotel("The Ritz-Carlton Kyoto", "Kyoto, Japan", "₹28,000/night", "4.9", "Riverside luxury with panoramic mountain views", "Luxury"));
        hotels.add(createHotel("COMO Uma Ubud", "Bali, Indonesia", "₹18,500/night", "4.8", "Rainforest retreat perched above the Tjujung River", "Boutique"));
        hotels.add(createHotel("Canaves Oia Epitome", "Santorini, Greece", "₹42,000/night", "5.0", "Iconic cliffside suite with infinity pool & caldera view", "Luxury"));
        hotels.add(createHotel("Soneva Jani", "Maldives", "₹65,000/night", "5.0", "Overwater villas with retractable rooftop for stargazing", "Luxury"));
        hotels.add(createHotel("Le Meurice", "Paris, France", "₹38,000/night", "4.8", "Belle Époque palace hotel facing the Tuileries Garden", "Historic"));
        hotels.add(createHotel("The Himalayan Hotel", "Manali, India", "₹6,500/night", "4.6", "Colonial-era heritage property with mountain vistas", "Heritage"));

        req.setAttribute("hotels", hotels);
        req.getRequestDispatcher("/WEB-INF/jsp/hotels.jsp").forward(req, resp);
    }

    private Map<String, Object> createHotel(String name, String location, String price, String rating, String desc, String type) {
        Map<String, Object> h = new HashMap<>();
        h.put("name", name);
        h.put("location", location);
        h.put("price", price);
        h.put("rating", rating);
        h.put("description", desc);
        h.put("type", type);
        return h;
    }
}
