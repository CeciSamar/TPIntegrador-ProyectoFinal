package com.cac.pensadores.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegisterTickets")
public class RegisterTickets extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Resultado del Registro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>Resultado del Registro Venta de Tickets</h2>");

            // Mensaje inicial
            out.println("<p style='color: blue;'>Iniciando proceso de registro de tickets...</p>");

            String nombre    = request.getParameter("nombre");
            out.println("<p style='color: blue;'>Paso el de nombre...</p>");
            String apellido  = request.getParameter("apellido");
            out.println("<p style='color: blue;'>Paso el de apellido...</p>");
            String email     = request.getParameter("email");
            out.println("<p style='color: blue;'>Paso el de mail...</p>");
            int cantidad     = Integer.parseInt(request.getParameter("cantidad"));
            out.println("<p style='color: blue;'>Paso el de cantidad...</p>");
            String categoria = request.getParameter("categoria");
            out.println("<p style='color: blue;'>Paso el de categoria...</p>");
            out.println("<p style='color: blue;'>ANTES DE TOTAL...</p>");
            out.println("<p style='color: blue;'>" + request.getParameter("total") + "</p>");
            float total      = Float.parseFloat(request.getParameter("total"));
            out.println("<p style='color: blue;'>Paso el de total...</p>");

            Connection connection = null;
            out.println("<p style='color: blue;'>Despues de Connection connection = null...</p>");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Conectarse a la base de datos
                out.println("<p style='color: blue;'>Conectándose a la base de datos...</p>");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cac23546?useSSL=false", "root", "root");

                // Insertar datos en la tabla
                out.println("<p style='color: blue;'>Insertando datos en la tabla oradores...</p>");
                final String STATEMENT = "INSERT INTO cac23546.ventatickets (nombre, apellido, email, cantidad, categoria, total) VALUES (?, ?, ?, ?, ?, ?)";

                out.println("<p style='color: blue;'>Luego de final String STATEMENT, osea el INSERT...</p>");
                PreparedStatement pst = connection.prepareStatement(STATEMENT);
                out.println("<p style='color: blue;'>Luego de connetion.prepareStatement...</p>");
                pst.setString(1, nombre);
                pst.setString(2, apellido);
                pst.setString(3, email);
                pst.setInt(4, cantidad);
                pst.setString(5, categoria);
                pst.setFloat(6, total);

                out.println("<p style='color: pink;'>Antes del executeUdate + pst.getResultSet()</p>");
                int rowCount = pst.executeUpdate();

                if (rowCount > 0) {
                    out.println("<p style='color: green;'>Registro exitoso.</p>");
                    request.setAttribute("status", "success");
                } else {
                    out.println("<p style='color: red;'>Fallo en el registro.</p>");
                    request.setAttribute("status", "failed");
                }

            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            response.sendRedirect("RegisterTickets?comprar-tickets");

            out.println("</body");
            out.println("</html>");

        } finally {
            out.close();
        }
    }
}
