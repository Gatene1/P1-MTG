package com.revature.DavidRiley;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.h2.util.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class AllElseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String fileName = req.getPathInfo();
        String resourceDir = "static";

        if (fileName == null || fileName.equals("/"))
            fileName = "/index.html";

        InputStream file = getClass().getClassLoader().getResourceAsStream(resourceDir + fileName);

        String mimeType = getServletContext().getMimeType(fileName);
        resp.setContentType(mimeType);

        if (file == null) {
            file = getClass().getClassLoader().getResourceAsStream(resourceDir + "/index.html");
        }

        IOUtils.copy(file,resp.getOutputStream());
    }
}
