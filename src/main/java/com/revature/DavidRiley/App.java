package com.revature.DavidRiley;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.startup.Tomcat;
import org.h2.util.IOUtils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

class Card {
    private int cardId;
    private int cost;
    private int typeId;
    private String name;

    public Card(int cardId, int cost, int typeId, String name) {
        this.cardId = cardId;
        this.cost = cost;
        this.typeId = typeId;
        this.name = name;
    }

    public Card() {

    }

    @Override
    public String toString() {
        return "Card{" +
                "CardID='" + cardId + '\'' +
                ", cost=" + cost +
                ", typeId=" + typeId +
                "name='" + name + '\'' +
                '}';
    }

    public int getCardId() { return cardId; }
    public void setCardId(int cardId) { this.cardId = cardId; }
    public int getCost() { return cost; }
    public void setCost(int cost) { this.cost = cost; }
    public int getTypeId() { return typeId; }
    public void setTypeId(int typeId) { this.typeId = typeId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}

public class App {
    public static void main(String[] args) throws SQLException {
        Connection conn = DriverManager.getConnection("jdbc:h2:mem:test;MODE=PostgreSQL;DATABASE_TO_LOWER=TRUE;INIT=runscript from 'classpath:schema.sql'", "sa", "");

        HttpServlet cardServlet = new HttpServlet() {
            @Override
            protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                List<Card> cards = new ArrayList();
                try {
                    ResultSet rs = conn.prepareStatement("select * from cards").executeQuery();
                    while (rs.next()) {
                        cards.add(new Card(rs.getInt("CardId"), rs.getInt("ManaCost"), rs.getInt("TypeId"), rs.getString("Name")));
                    }
                } catch (SQLException e) {
                    System.err.println("Failed to retrieve form DB: " + e.getSQLState());
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
                    PreparedStatement stmt = conn.prepareStatement("insert into cards values (?, ?, ?, ?)");
                    stmt.setInt(1, newCard.getCardId());
                    stmt.setInt(2, newCard.getCost());
                    stmt.setInt(3, newCard.getTypeId());
                    stmt.setString(4, newCard.getName());
                    stmt.executeUpdate();
                    stmt.close();
                } catch (SQLException e) {
                    System.err.println("Failed to insert: " + e.getMessage());
                }
            }
        };

        // Run Server
        Tomcat server = new Tomcat();
        server.setBaseDir("java.io.tmpdir");
        server.setPort(8080);
        server.getConnector();
        server.addContext("", null);
        server.addServlet("", "DefaultServlet", new HttpServlet() {
            @Override
            protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
                String fileName = req.getPathInfo();
                String resourceDir = "static";

                if (fileName == null || fileName.equals("/"))
                    fileName = "/index.html";

                InputStream file = getClass().getClassLoader().getResourceAsStream(resourceDir + fileName);

                if (file == null) {
                    file = getClass().getClassLoader().getResourceAsStream(resourceDir + "/index.html");
                }

                IOUtils.copy(file,resp.getOutputStream());
            }
            }).addMapping("/*");
        server.addServlet("","cardServlet", cardServlet).addMapping("/cards");
        try {
            server.start();
        } catch (LifecycleException e) {
            System.err.println("Failed to start Server: " + e.getMessage());
        }
    }
}

