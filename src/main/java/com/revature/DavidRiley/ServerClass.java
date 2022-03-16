package com.revature.DavidRiley;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.startup.Tomcat;
import org.h2.util.IOUtils;

import java.io.IOException;
import java.io.InputStream;

public class ServerClass {
    public ServerClass() {
        Tomcat server = new Tomcat();
        server.setBaseDir("java.io.tmpdir");
        server.setPort(8080);
        server.getConnector();
        server.addContext("", null);
        server.addServlet("", "DefaultServlet", new AllElseServlet()).addMapping("/*");
        server.addServlet("", "DefaultServlet2", new AllElseServlet()).addMapping(" ");
        server.addServlet("","cardServlet", new CardServlet()).addMapping("/cards");

        try {
            server.start();
        } catch (LifecycleException e) {
            System.err.println("Failed to start Server: " + e.getMessage());
        }
    }
}
