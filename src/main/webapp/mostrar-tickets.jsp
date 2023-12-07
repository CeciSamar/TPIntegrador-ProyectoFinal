<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.logging.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/mostrar-tickets.css">
    <link rel="shortcut icon" type="Imagen" href="./img/ticket.png">
    <title>Tickets Vendidos</title>
</head>

<body>
    <h1>Tickets Vendidos</h1>
    <table border="2">
        <tr>
            <th>Tickets</th>
            <th>Apellido</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Cantidad</th>
            <th>Categoria</th>
            <th>IMP. TOTAL</th>
        </tr>

        <%
            Logger logger = Logger.getLogger("UsuariosLogger");
            BigDecimal sumaTotal = BigDecimal.ZERO; // Inicializa la suma en cero

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cac23546?useSSL=false", "root", "root");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM ventatickets");

                int rowCount = 0;
                while (rs.next()) {
                    rowCount++;
        %>
                    <tr>
                        <td class="tickets"><%= rs.getInt("id_tickets") %></td>
                        <td><%= rs.getString("apellido") %></td>
                        <td><%= rs.getString("nombre") %></td>
                        <td class="email-cell"><%= rs.getString("email") %></td>
                        <td class="cantidad"><%= rs.getInt("cantidad") %></td>
                        <td><%= rs.getString("categoria") %></td>
                        <td class="total">$<%= rs.getBigDecimal("total") %></td>
                    </tr>
        <%
                    // Obtén el valor decimal de la columna "total" y suma a la variable sumaTotal
                    BigDecimal total = rs.getBigDecimal("total");
                    sumaTotal = sumaTotal.add(total);
                }
            } catch (Exception e) {
                logger.log(Level.SEVERE, "Error al recuperar datos", e);
            }
        %>
            <!-- Muestra la fila de sumatotal después de haber recorrido todas las filas -->
            <tr>
               <td class"text-total" colspan="6">Suma Total:</td>
               <td class="total-gral">$<%= sumaTotal %></td>
            </tr>

    </table>

</body>
</html>
