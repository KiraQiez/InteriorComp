package com.interior.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RoomFilterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String capacity = request.getParameter("capacity");
        String availability = request.getParameter("availability");
        String roomType = request.getParameter("roomType");

        request.setAttribute("capacity", capacity);
        request.setAttribute("availability", availability);
        request.setAttribute("roomType", roomType);

        request.getRequestDispatcher("roomSLF.jsp").forward(request, response);
    }
}
