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

@WebServlet("/RegisterOradores")
public class RegisterOradores extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            //out.println("<html>");
            //out.println("<head>");
            // out.println("<title>Resultado del Registro</title>");
            //out.println("</head>");
            //out.println("<body>");
            //out.println("<h2>Resultado del Registro</h2>");

            // Mensaje inicial
            //out.println("<p style='color: blue;'>Iniciando proceso de registro de oradores...</p>");

            String nombre   = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String email    = request.getParameter("email");
            String temario  = request.getParameter("temario");
            Connection connection = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Conectarse a la base de datos
                // out.println("<p style='color: blue;'>Conectándose a la base de datos...</p>"); -->
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cac23546?useSSL=false", "root", "root");

                // Insertar datos en la tabla
                // out.println("<p style='color: blue;'>Insertando datos en la tabla oradores...</p>"); -->
                final String STATEMENT = "INSERT INTO cac23546.oradores (nombre, apellido, email, temario) VALUES (?, ?, ?, ?)";

                // out.println("<p style='color: blue;'>Luego de final String STATEMENT, osea el INSERT...</p>");
                PreparedStatement pst = connection.prepareStatement(STATEMENT);
                // out.println("<p style='color: blue;'>Luego de connetion.prepareStatement...</p>");
                pst.setString(1, nombre);
                pst.setString(2, apellido);
                pst.setString(3, email);
                pst.setString(4, temario);

                // out.println("<p style='color: pink;'>Antes del executeUdate + pst.getResultSet()</p>");

                int rowCount = pst.executeUpdate();

                if (rowCount > 0) {
                    // out.println("<p style='color: green;'>Registro exitoso.</p>");
                    request.setAttribute("status", "success");
                } else {
                    // out.println("<p style='color: red;'>Fallo en el registro.</p>");
                    request.setAttribute("status", "failed");
                }

            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if(connection != null) {
                        connection.close();
                        // out.println("<p style='color: blue;'>Conexión cerrada.</p>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            response.sendRedirect("index.jsp?action=RegisterOradores");  // Redirige a la página principal, y al formulario, después del registro exitoso o fallido

            //out.println("</body>");
            //out.println("</html>");

        } finally {
            //out.close();
        }
    }
}
