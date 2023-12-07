<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/usuarios.css">
    <link rel="shortcut icon" type="Imagen" href="./img/usuario.png">
    <title>Usuarios</title>
</head>

<body>
    <h1>Usuarios Registrados</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Apellido</th>
            <th>Nombre</th>
            <th>Telefono</th>
            <th>Email</th>
            <th>Password</th>
        </tr>

        <%
            Logger logger = Logger.getLogger("UsuariosLogger");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cac23546?useSSL=false", "root", "root");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM USERS");

                int rowCount = 0;
                while (rs.next()) {
                    rowCount++;
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("apellido") %></td>
                        <td><%= rs.getString("nombre") %></td>
                        <td class="telefono-cell"><%= rs.getString("telefono") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td class="password-cell"><%= rs.getString("password") %></td>
                    </tr>
        <%
                }
                logger.info("Número de filas recuperadas: " + rowCount);

                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                logger.log(Level.SEVERE, "Error al recuperar datos", e);
            }
        %>
    </table>
    <script>   <!-- para mostrar una mascara de asteriscos en el campo password-->
        var passwordCells = document.getElementsByClassName("password-cell");
        for (var i = 0; i < passwordCells.length; i++) {
            var originalText = passwordCells[i].innerText;
            var maskedText = "*".repeat(originalText.length);
            passwordCells[i].innerText = maskedText;
        }
    </script>
</body>
</html>
