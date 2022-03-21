package com.revature.DavidRiley;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.Servlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ViewAddACard extends HttpServlet {
    Connection connection;

    {
        try {
            connection = DriverManager.getConnection("jdbc:h2:mem:test;MODE=PostgreSQL;DATABASE_TO_LOWER=TRUE;", "sa", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ViewAddACard() {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Card> addACards = new ArrayList<>();
        PreparedStatement stmt;
        ResultSet rs;

        try {
            stmt = connection.prepareStatement("SELECT * FROM cards");
            rs = stmt.executeQuery();

            while (rs.next()) {
                addACards.add(new Card(
                        rs.getInt("cardId"),
                        rs.getInt("typeId"),
                        rs.getString("manacost"),
                        rs.getString("name"),
                        rs.getString("artist"),
                        rs.getString("colorIdentity"),
                        rs.getLong("multiverse"),
                        rs.getString("rarity"),
                        rs.getString("scryfallId")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Failed to retrieve from db: " + e.getMessage());
        }

        ObjectMapper mapper = new ObjectMapper();
        String results = mapper.writeValueAsString(addACards);
        resp.getWriter().println("<html>" +
                "                   <head>" +
                "                       <style>" +
                "                           body { background-image: linear-gradient(#231c29,#431e3f); color:#c7c7c7; font-size:18pt; }" +
                "                           tr, td { padding:5px; }" +
                "                           td.tdH { font-weight:bold; color:#ffffff; background-color:#000000; }" +
                "                           tr.highlight:hover { background-color:#e6cdfa; cursor:crosshair; color:#000000; }" +
                "                           table { border-color:#c7c7c7; margin:auto; }" +
                "                       </style>" +
                "                   </head>" +
                "                       <body>" +
                "                           <table border=2; cellspacing=0 cellpadding=0>" +
                "                               <tr>" +
                "                                   <td class='tdH'>Card ID</td>" +
                "                                   <td class='tdH'>Name of Card</td>" +
                "                                   <td class='tdH'>Type of Card</td>" +
                "                                   <td class='tdH'>Mana Cost</td>" +
                "                                   <td class='tdH'>Border Color</td>" +
                "                                   <td class='tdH'>Rarity</td>" +
                "                                   <td class='tdH'>Artist</td>" +
                "                                   <td class='tdH'>Multiverse ID</td>" +
                "                                   <td class='tdH'>Scryfall ID</td>" +
                "                               </tr>" +
                "                               <tr class='highlight'>");
        for (Card cardResults : addACards) {
            resp.getWriter().println("                  <td>" + cardResults.getCardId() + "</td>" +
                    "                                   <td>" + cardResults.getName() + "</td>" +
                    "                                   <td>" + cardResults.getTypeId() + "</td>" +
                    "                                   <td>" + cardResults.getCost() + "</td>" +
                    "                                   <td>" + cardResults.getColorIdentity() + "</td>" +
                    "                                   <td>" + cardResults.getRarity() + "</td>" +
                    "                                   <td>" + cardResults.getArtist() + "</td>" +
                    "                                   <td>" + cardResults.getMultiverse() + "</td>" +
                    "                                   <td>" + cardResults.getScryfallId() + "</td>" +
                    "                               </tr><tr class='highlight'>");
        }
        resp.getWriter().print("              </table>" +
                "                         </body>" +
                "                     </html>");
    }
}
