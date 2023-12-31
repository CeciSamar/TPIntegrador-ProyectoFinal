<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="es">
<head>
   <!-- <jsp:include page="head.jsp"/> -->

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/comprar-tickets.css">
    <link rel="shortcut icon" type="Imagen" href="./img/ticket.png">
    <title>Venta de Tickets</title>
</head>

<body>
    <!--  <jsp:include page="header.jsp"/>      no me gusta como queda, por eso lo anulo -->

    <!-- Las 3 cajas con los descuentos en cada una -->
    <div class="container">
        <!-- Caja 1 -->
        <div class="box box1">
            <h2>Estudiante</h2>
            <p class="texto-des">Tienen un descuento</p>
            <h3>80%</h3>
            <p class="texto-doc">* presentar documentación</p>
        </div>
        <!-- Caja 2 -->
        <div class="box box2">
            <h2>Trainee</h2>
            <p class="texto-des">Tienen un descuento</p>
            <h3>50%</h3>
            <p class="texto-doc">* presentar documentación</p>
        </div>
        <!-- Caja 3 -->
        <div class="box box3">
            <h2>Junior</h2>
            <p class="texto-des">Tienen un descuento></p>
            <h3>15%</h3>
            <p class="texto-doc">* presentar documentación</p>
        </div>
    </div>

	<section id="venta">
		<p class="texto-venta">VENTA</p>
		<p class="texto-valor">VALOR DE TICKET $200</h2>
	</section>

    <!-- FORMULARIO -->
    <div class="form-container">
        <form action="RegisterTickets" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label for="nombre"></label>
                    <input type="text" id="nombre" name="nombre" placeholder="Nombre" required>
                </div>
                <div class="form-group">
                    <label for="apellido"></label>
                    <input type="text" id="apellido" name="apellido" placeholder="Apellido" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="correo"></label>
                    <input type="email" id="correo" name="correo" placeholder="Correo" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="cantidad">Cantidad:</label>
                    <input type="number" id="cantidad" name="cantidad" placeholder="Cantidad" required min="1" step="1">
                </div>
                <div class="form-group">
                    <label for="categoria">Categoría:</label>
                    <select id="categoria" name="categoria">
                        <option value="opcion1">Estudiante</option>
                        <option value="opcion2">Trainee</option>
                        <option value="opcion3">Junior</option>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="text-total"></label>
                    <input type="text" id="text-total" placeholder="Total a Pagar: $" disabled>
                </div>
                <div class="form-group">
                    <label for="total"></label>
                    <input type="number" id="total" name="total" placeholder="0">
                </div>
            </div>

            <div class="form-row form-group-buttons">
                <button type="reset" class="btn btn-success">Borrar</button>
                <button type="submit" class="btn btn-success">Grabar Ticket</button>
            <!-- <input type="submit" class="btn btn-lg btn-form" value="Registrarse"> -->
            </div>
        </form>
    </div>

    <!-- <jsp:include page="footer.jsp"/> -->
    <script src="./js/comprar-tickets.js"></script>        <!-- Agrego esta línea que llama al codigo js-->
</body>
</html>
