package com.example.weblab2s.servlet;

import com.example.weblab2s.bean.ComponentStorage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "controllerServlet", value = "/controller-servlet")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //получаем контекст сервлета
        ServletContext servletContext = request.getServletContext();

        if (request.getSession().getAttribute("storage") == null) {
            request.getSession().setAttribute("storage", new ComponentStorage());
        }

        //получаем параметры
        Object attX = request.getParameter("x");
        Object attY = request.getParameter("y");
        Object attR = request.getParameter("r");
        Object attPoints = request.getParameter("click");

        //создаём атрибуты из полученных параметров
        servletContext.setAttribute("x", attX);
        servletContext.setAttribute("y", attY);
        servletContext.setAttribute("r", attR);
        servletContext.setAttribute("click", attPoints);

        //проверка на null
        //перенаправление запроса другим сервлетам и jsp
        if (servletContext.getAttribute("x") != null
                && servletContext.getAttribute("y") != null
                && servletContext.getAttribute("r") != null) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/AreaCheckServlet");
            requestDispatcher.forward(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
            requestDispatcher.forward(request, response);
        }
    }
}

