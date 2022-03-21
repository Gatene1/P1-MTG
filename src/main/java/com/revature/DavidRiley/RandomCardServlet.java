package com.revature.DavidRiley;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class RandomCardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        InputStream filename = getClass().getClassLoader().getResourceAsStream("static/randomCard.html");
        IOUtils.copy(filename, resp.getOutputStream());
    }
}
