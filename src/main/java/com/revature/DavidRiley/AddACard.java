package com.revature.DavidRiley;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.h2.util.IOUtils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AddACard extends HttpServlet {
    int cardAddStart = 0;
    public AddACard() {

    }

    @Override
    protected void doGet (HttpServletRequest req, HttpServletResponse resp) {
        Card cardToAdd;

        InputStream fileName = getClass().getClassLoader().getResourceAsStream("static/addCard.html");

        Connection conn = null;
        try {
            String url = "jdbc:h2:mem:test;MODE=PostgreSQL;DATABASE_TO_LOWER=TRUE;";
            String username = "sa";
            String password = "";
            conn = DriverManager.getConnection(url, "sa", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        List<Card> cards = new ArrayList<>();
        try {
            ResultSet rs = conn.prepareStatement("SELECT * FROM cards").executeQuery();
            while (rs.next()){
                cardAddStart++;
            }
            cardAddStart++;
            // Added 1 to the amount of rows in the database, to know what to set CardId to.
        } catch (SQLException e) {
            e.printStackTrace();
        }


        try {
            Cookie cookie = new Cookie("cardAddStart", String.valueOf(cardAddStart));
            cookie.setPath("");
            resp.addCookie(cookie);

            IOUtils.copy(fileName,resp.getOutputStream());

            // Placed a hidden field within the page to hold the Card number the card should be in the database.
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
