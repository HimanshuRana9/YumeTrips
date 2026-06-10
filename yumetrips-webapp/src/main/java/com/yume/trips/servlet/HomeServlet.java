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

public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Sample destinations data
        List<Map<String, Object>> destinations = new ArrayList<>();
        destinations.add(createDest("Kyoto", "Japan", "₹42,000", "4.9", "Ancient temples, cherry blossoms & zen gardens"));
        destinations.add(createDest("Bali", "Indonesia", "₹31,000", "4.8", "Tropical paradise with sacred temples & rice terraces"));
        destinations.add(createDest("Santorini", "Greece", "₹68,000", "4.9", "Whitewashed clifftop villages above a volcanic caldera"));
        destinations.add(createDest("Maldives", "South Asia", "₹95,000", "5.0", "Crystal lagoons, overwater bungalows & coral reefs"));
        destinations.add(createDest("Paris", "France", "₹58,000", "4.7", "City of love — art, cuisine & the Eiffel Tower"));
        destinations.add(createDest("Manali", "India", "₹12,000", "4.6", "Snow-capped Himalayas, adventure sports & pine forests"));

        // Sample packages data
        List<Map<String, Object>> packages = new ArrayList<>();
        packages.add(createPkg("Ancient Kyoto & Nara Deer Park", "6 Days / 5 Nights", "₹78,000", "4.9",
                "Experience the timeless serenity of Japan's ancient capital."));
        packages.add(createPkg("Bali Tropical Escape", "5 Days / 4 Nights", "₹45,000", "4.8",
                "Balinese temples, rice terraces, and pristine beaches await."));

        req.setAttribute("destinations", destinations);
        req.setAttribute("packages", packages);
        req.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp);
    }

    private Map<String, Object> createDest(String name, String location, String price, String rating, String desc) {
        Map<String, Object> d = new HashMap<>();
        d.put("name", name);
        d.put("location", location);
        d.put("price", price);
        d.put("rating", rating);
        d.put("description", desc);
        return d;
    }

    private Map<String, Object> createPkg(String title, String duration, String price, String rating, String desc) {
        Map<String, Object> p = new HashMap<>();
        p.put("title", title);
        p.put("duration", duration);
        p.put("price", price);
        p.put("rating", rating);
        p.put("description", desc);
        return p;
    }
}
