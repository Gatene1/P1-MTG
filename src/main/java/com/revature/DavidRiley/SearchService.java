package com.revature.DavidRiley;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
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

public class SearchService extends HttpServlet {
    public SearchService() {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String searchName = req.getQueryString();
        String[] getVariable = searchName.split("=");
        String replacedString;
        if (getVariable.length == 1) {
            replacedString = "Black Lotus";
        } else {
            replacedString = getVariable[1].replaceAll("\\+", " ");
        }

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
            ResultSet rs = conn.prepareStatement("select * from cards ").executeQuery();
            while (rs.next()) {
                Card cardToAdd = new Card(rs.getInt("CardId"), rs.getString("ManaCost"), rs.getString("TypeId"),
                        rs.getString("Name"), rs.getString("Artist"), rs.getString("ColorIdentity"),
                        rs.getLong("Multiverse"), rs.getString("Rarity"), rs.getString("ScryfallId"));

                cards.add(cardToAdd);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(cards.size());

        resp.getWriter().println(
                "<html>" +
                "<head>" +
                "<title>Welcome to the Graveyard</title>" +
                "<link rel='icon' href='favicon.ico'>" +
                "<link rel='stylesheet' href='SearchPage.css'>" +
                "<body>" +
                "<div class='outerContents'>" +
                    "<a href='index.html'><img class='logo' src='https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Magicthegathering-logo.svg/512px-Magicthegathering-logo.svg.png?20160501122627%3E%27%3E'></a><br><br><br>" +
                    "<h1><center><b>Search Results For <i>" + replacedString + "</i></b></center></h1><br><br>" +
                    "<div class='cardsToShow'>");


        int count = 0;
       for (Card stackOfCards : cards) {
           if (cards.get(count).getName().toLowerCase().contains(replacedString.toLowerCase())) {
               resp.getWriter().println("<a href='viewcard.html?scryfallId="+cards.get(count).getScryfallId()+"'><img src='https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid="+cards.get(count).getMultiverse()+"&type=card'></a>");

           }

           count++;
       }

        resp.getWriter().println("</div>" +
                "</div>" +
                "</body>" +
                "</html>");

    }
}


