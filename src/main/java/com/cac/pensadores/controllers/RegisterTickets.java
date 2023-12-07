package com.cac.pensadores.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/comprar-tickets")
public class RegisterTickets extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String inombre    = request.getParameter("nombre");
        String iapellido  = request.getParameter("apellido");
        String iemail     = request.getParameter("email");
        String icantidad  = request.getParameter("cantidad");
        String icategoria = request.getParameter("categoria");
        String itotal     = request.getParameter("total");
        RequestDispatcher disp = null;
        Connection con1 = null;


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // conectandose a la base de datos
            con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cac23546?useSSL=false", "root", "root");

            // pasa los datos a la BD para ser agregados a la tabla.
            final String STATEMENT = "INSERT INTO ventatickets (nombre, apellido, email, cantidad, categoria, total) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con1.prepareStatement(STATEMENT);
            pst.setString(1, inombre);
            pst.setString(2, iapellido);
            pst.setString(3, iemail);
            pst.setString(4, icantidad);
            pst.setString(5, icategoria);
            pst.setString(6, itotal);

            int rowCount = pst.executeUpdate();

            disp = request.getRequestDispatcher("comprar-tickets.jsp");  // para que se quede en la misma pagina
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            disp.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            try {
                con1.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

}