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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Card> cards = new ArrayList<>();
        try {
            ResultSet rs = conn.prepareStatement("select * from cards").executeQuery();
            while (rs.next()) {
                Card cardToAdd = new Card(
                        rs.getInt("CardId"),
                        rs.getInt("TypeId"),
                        rs.getString("ManaCost"),
                        rs.getString("Name"),
                        rs.getString("Artist"),
                        rs.getString("ColorIdentity"),
                        rs.getLong("Multiverse"),
                        rs.getString("Rarity"),
                        rs.getString("scryfallId"));
                cards.add(cardToAdd);
            }
        } catch (SQLException e) {
            System.err.println("Failed to retrieve from database: " + e.getSQLState());
        }
        // Get JSON mapper
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
            PreparedStatement stmt = conn.prepareStatement("insert into cards values (?,?,?,?,?,?,?,?,?)");
            stmt.setInt(1, newCard.getCardId());
            stmt.setInt(2, newCard.getTypeId());
            stmt.setString(3, newCard.getCost());
            stmt.setString(4, newCard.getName());
            stmt.setString(5, newCard.getArtist());
            stmt.setString(6, newCard.getColorIdentity());
            stmt.setLong(7, newCard.getMultiverse());
            stmt.setString(8, newCard.getRarity());
            stmt.setString(9, newCard.getScryfallId());
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.err.println("Failed to insert: " + e.getMessage());
        }
    }
}
