package com.revature.DavidRiley;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CardServlet extends HttpServlet {
    Connection conn;

    {
        try {
            conn = DriverManager.getConnection("jdbc:h2:mem:test;MODE=PostgreSQL;DATABASE_TO_LOWER=TRUE;INIT=runscript from 'classpath:schema.sql'", "sa", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Card> cards = new ArrayList();
        try {
            ResultSet rs = conn.prepareStatement("select * from cards").executeQuery();
            while (rs.next()) {
                cards.add(new Card(rs.getInt("CardId"), rs.getString("ManaCost"), rs.getString("TypeId"),
                        rs.getString("Name"), rs.getString("Artist"), rs.getString("ColorIdentity"),
                        rs.getLong("Multiverse"), rs.getString("Rarity"), rs.getInt("Power"),
                        rs.getInt("Toughness")));
            }
        } catch (SQLException e) {
            System.err.println("Failed to retrieve form DB: " + e.getMessage());
        }
        // Get a JSON Mapper
        ObjectMapper mapper = new ObjectMapper();
        String results = mapper.writeValueAsString(cards);
        resp.setContentType("application/json");
        resp.getWriter().println(results);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        Card newCard = mapper.readValue(req.getInputStream(), Card.class);
        try {
            PreparedStatement stmt = conn.prepareStatement("insert into 'cards' values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            stmt.setInt(1, newCard.getCardId());
            stmt.setString(2, newCard.getCost());
            stmt.setString(3, newCard.getTypeId());
            stmt.setString(4, newCard.getName());
            stmt.setString(5, newCard.getArtist());
            stmt.setString(6, newCard.getColorIdentity());
            stmt.setLong(7, newCard.getMultiverse());
            stmt.setString(8, newCard.getRarity());
            stmt.setInt(9, newCard.getPower());
            stmt.setInt(10, newCard.getToughness());

            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.err.println("Failed to insert: " + e.getMessage());
        }
    }
}