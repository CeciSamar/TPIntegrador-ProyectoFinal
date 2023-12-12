<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%!
    // Función para formatear fechas
    private String formatDate(Timestamp timestamp) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return (timestamp != null) ? sdf.format(timestamp) : "";
    }
%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/mostrar-oradores.css">
    <link rel="shortcut icon" type="Imagen" href="./img/estudiantes.png">
    <title>Futuros Oradores</title>
</head>

<body>
    <h1>Futuros Oradores</h1>
    <table border="2">
        <tr>
            <th>Id</th>
            <th>Apellido</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Temario</th>
            <th>Fecha Envio</th>
        </tr>

        <%
            Logger logger = Logger.getLogger("UsuariosLogger");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cac23546?useSSL=false", "root", "root");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM oradores");

                int rowCount = 0;
                while (rs.next()) {
                    rowCount++;
        %>
                    <tr>
                        <td class="id_orador"><%= rs.getInt("id_orador") %></td>
                        <td><%= rs.getString("apellido") %></td>
                        <td><%= rs.getString("nombre") %></td>
                        <td class="email-cell"><%= rs.getString("email") %></td>
                        <td class="temario"><%= rs.getString("temario") %></td>
                        <td class="fecha"><%= formatDate(rs.getTimestamp("fechaenvio")) %></td>
                    </tr>
        <%
                }
                logger.info("Numero de filas recuperadas");

                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                logger.log(Level.SEVERE, "Error al recuperar datos", e);
            }
        %>
    </table>
</body>
</html>
