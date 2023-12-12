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

@WebServlet("/index")
public class RegisterOradoresProfe extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String inombre   = request.getParameter("nombre");
        String iapellido = request.getParameter("apellido");
        String iemail    = request.getParameter("email");
        String itemario  = request.getParameter("temario");
        RequestDispatcher disp = null;
        Connection con = null;


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // conectandose a la base de datos
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cac23546?useSSL=false", "root", "root");

            // pasa los datos a la BD para ser agregados a la tabla.
            final String STATEMENT = "INSERT INTO cac23546.oradores (nombre, apellido, email, temario) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(STATEMENT);
            pst.setString(1, inombre);
            pst.setString(2, iapellido);
            pst.setString(3, iemail);
            pst.setString(4, itemario);

            int rowCount = pst.executeUpdate();
            disp = request.getRequestDispatcher("login.jsp");
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
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

}
