package com.revature.DavidRiley;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.h2.util.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class AddACard extends HttpServlet {
    public AddACard() {

    }

    @Override
    protected void doGet (HttpServletRequest req, HttpServletResponse resp) {
        InputStream fileName = getClass().getClassLoader().getResourceAsStream("static/addCard.html");

        try {
            IOUtils.copy(fileName,resp.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
