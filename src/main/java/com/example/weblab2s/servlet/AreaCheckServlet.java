package com.example.weblab2s.servlet;

import com.example.weblab2s.bean.Component;
import com.example.weblab2s.bean.ComponentStorage;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "areaCheckServlet", value = "/areaCheck-servlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long startTime = System.nanoTime();
        response.setContentType("text/html;charset=UTF-8");

        ServletContext servletContext = request.getServletContext();

        //получаем заданные атрибуты, приводим к нужному типу (строке)
        String x = (String) servletContext.getAttribute("x");
        String y = (String) servletContext.getAttribute("y");
        String r = (String) servletContext.getAttribute("r");
        String click = (String) servletContext.getAttribute("click");

        if (click == null) {
            addPointsToBeanComponent(x, y, r, startTime, request, true);
            servletContext.setAttribute("countOfNewPoints", 1);
            request.getRequestDispatcher("/result.jsp").forward(request, response);
        } else {
            addPointsToBeanComponent(x, y, r, startTime, request, false);
            servletContext.setAttribute("countOfNewPoints", 1);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

    private void addPointsToBeanComponent(String x, String y, String r, long startTime, HttpServletRequest request, boolean form) {

        Point point = getPoint(x, y, r, startTime, form);
        ComponentStorage storage = (ComponentStorage) request.getSession().getAttribute("storage");
        storage.addComponent(new Component(point));
        request.getSession().setAttribute("storage", storage);
    }

    private Point getPoint(String requestX, String requestY, String requestR, long startTime, boolean form) {
        Point point = new Point(requestX, requestY, requestR);
        point.setExecutingTime(0.0);
        point.setCurrentTime("0");
        String currentTime = new SimpleDateFormat("HH:mm:ss").format(new Date());

        point.validateAndCheckArea(form);

        point.setCurrentTime(currentTime);
        point.setExecutingTime((System.nanoTime() - startTime) / 1000000000d);
        return point;
    }
}