<%@ page contentType="text/html;charset=UTF-8" %>
<!--%
    if(session.getAttribute("email") == null){
        response.sendRedirect("login.jsp");
    }
%-->
<!doctype html>
<html lang="es">
    <jsp:include page="head.jsp"/>
<body>
    <jsp:include page="header.jsp"/>
    <main>
        <div id="myCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true"
                    aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active bg-carousel-ba1">
                    <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#000"/></svg>
                    <div class="container">
                        <div class="carousel-caption text-end pb-5">
                            <div class="row">
                                <div class="col-lg-8 offset-lg-6">
                                    <h3>Conf Bs. As</h3>
                                    <p>Bs. As. llega por primera vez a la Argentina. Un evento para compartir con nuestra comunidad el conocimiento y la experiencia de los expertos que están creando el futuro de internet. Ven a conocer a miembros del evento, a otros estudiantes de Codo a Codo y a los oradores de primer nivel que tenemos para ti. Te esperamos!</p>
                                    <p><a class="btn btn-outline-light mb-3" href="#form-orador">Quiero ser orador</a> <a class="btn btn-success ms-2 mb-3" href="comprar-tickets.jsp">Comprar tickets</a></p>
                                    <!-- NOMBRE DE USUARIO -->
                                    <p class="usuario">
                                        <%
                                            if(session.getAttribute("email") != null){
                                        %>
                                            <section class="text-center mb-4 mt-4">
                                               <h1><span class="badge bg-primary btn-log-reg"><%= session.getAttribute("nombre") %></span></h1>
                                            </section>
                                        <%
                                            }
                                        %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="carousel-item bg-carousel-ba2">
                    <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#000"/></svg>
                    <div class="container">
                        <div class="carousel-caption text-end pb-5">
                            <div class="row">
                                <div class="col-lg-6 offset-lg-6">
                                    <h3>Conf Bs. As.</h3>
                                    <p>Bs. As. llega por primera vez a la Argentina. Un evento para compartir con nuestra comunidad el conocimiento y la experiencia de los expertos que están creando el futuro de internet. Ven a conocer a miembros del evento, a otros estudiantes de Codo a Codo y a los oradores de primer nivel que tenemos para ti. Te esperamos!</p>
                                    <p><a class="btn btn-outline-light mb-3" href="#form-orador">Quiero ser orador</a> <a class="btn btn-success ms-2 mb-3" href="comprar-tickets.jsp">Comprar tickets</a></p>
                                    <!-- NOMBRE DE USUARIO -->
                                    <p class="usuario">
                                        <%
                                            if(session.getAttribute("email") != null){
                                        %>
                                            <section class="text-center mb-4 mt-4">
                                                <h1><span class="badge bg-primary btn-log-reg"><%= session.getAttribute("nombre") %></span></h1>
                                            </section>
                                        <%
                                            }
                                        %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item bg-carousel-ba3">
                    <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#000"/></svg>
                    <div class="container">
                        <div class="carousel-caption text-end pb-5">
                            <div class="row">
                                <div class="col-lg-6 offset-lg-6">
                                    <h3>Conf Bs. As.</h3>
                                    <p>Bs. As. llega por primera vez a la Argentina. Un evento para compartir con nuestra comunidad el conocimiento y la experiencia de los expertos que están creando el futuro de internet. Ven a conocer a miembros del evento, a otros estudiantes de Codo a Codo y a los oradores de primer nivel que tenemos para ti. Te esperamos!</p>
                                    <p><a class="btn btn-outline-light mb-3" href="#form-orador">Quiero ser orador</a> <a class="btn btn-success ms-2 mb-3" href="comprar-tickets.jsp">Comprar tickets</a></p>
                                    <!-- NOMBRE DE USUARIO -->
                                    <p class="usuario">
                                        <%
                                            if(session.getAttribute("email") != null){
                                        %>
                                            <section class="text-center mb-4 mt-4">
                                               <h1><span class="badge bg-primary btn-log-reg"><%= session.getAttribute("nombre") %></span></h1>
                                            </section>
                                        <%
                                            }
                                        %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>


        <section class="container mb-4" id="oradores">
            <h2 class="titulo-gral">Conoce a los <span>oradores</span></h2>
            <div class="row justify-content-center">
                <div class="col-md-11">
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <div class="col">
                            <div class="card h-100">
                                <img src="img/steve.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <div class="mb-2">
                                        <span class="badge bg-warning text-dark">Javascript</span>
                                        <span class="badge bg-info">React</span>
                                    </div>
                                    <h5 class="card-title">Steve Jobs</h5>
                                    <p class="card-text">Steve Jobs, nacido el 24 de febrero de 1955 en San Francisco, California, fue un influyente empresario y visionario tecnológico estadounidense.
                                                         Es cofundador de Apple Inc., una de las compañías más exitosas del mundo. Jobs apoyó un papel fundamental en la creación de productos revolucionarios como el
                                                         iPhone, el iPod, el iPad y las computadoras Macintosh. Su enfoque en el diseño elegante y la experiencia del usuario transformó la industria de la tecnología y
                                                         cambió la forma en que interactuamos con la informática y la comunicación. Su legado perdura como un ícono de la innovación y el espíritu empresarial. Falleció
                                                         el 5 de octubre de 2011, dejando una huella imborrable en la tecnología y la cultura contemporáneas.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="img/bill.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <div class="mb-2">
                                        <span class="badge bg-warning text-dark">Javascript</span>
                                        <span class="badge bg-info">React</span>
                                    </div>
                                    <h5 class="card-title">Bill Gates</h5>
                                    <p class="card-text">Bill Gates, nacido el 28 de octubre de 1955 en Seattle, Washington, es un influyente empresario y filántropo estadounidense. Cofundador de Microsoft
                                                         en 1975, su liderazgo revolucionó la informática con el sistema operativo Windows, convirtiendo a Microsoft en un gigante tecnológico. Bill Gates es ampliamente reconocido
                                                         por su riqueza y por la Fundación Bill y Melinda Gates, que desde 2000 ha impactado globalmente en salud, educación y desarrollo, mejorando la vida de millones de personas.
                                                         Su visión y contribuciones tecnológicas dejarán una huella muy marcada y duradera en la industria informática y el mundo entero, inspirando a generaciones a explorar la
                                                         innovación y el cambio positivo en beneficio de la humanidad.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <img src="img/ada.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <div class="mb-2">
                                        <span class="badge bg-secondary">Negocios</span>
                                        <span class="badge bg-danger">Startups</span>
                                    </div>
                                    <h5 class="card-title">Ada Lovelace</h5>
                                    <p class="card-text">Ada Lovelace, nacida el 10 de diciembre de 1815 en Londres, fue una visionaria matemática y escritora británica. Considerada la primera programadora de
                                                         computadoras, colaboró ​​con Charles Babbage en el "motor analítico". Su legado trasciende las máquinas, anticipando la programación moderna y la inteligencia artificial.
                                                         Inspiró a futuras generaciones a explorar la intersección entre la ciencia y la creatividad, sentando las bases para la revolución tecnológica actual. Su visión innovadora
                                                         y pasión por la informática abrieron nuevos horizontes, resaltando la importancia de las mujeres en la informática y el papel fundamental de la imaginación en el progreso
                                                         tecnológico. Hoy sigue siendo un faro de inspiración en el mundo de la ciencia y la tecnología.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <section class="mb-4" id="lugar">
            <div class="row g-0">
                <div class="col-md">
                    <img src="img/honolulu.jpg" alt="Honolulu" class="img-fluid">
                </div>
                <div class="col-md text-light bg-aside1">
                    <h2>Bs As - Octubre</h2>
                    <p>Buenos Aires es la provincia y localidad mas grande del estado de Argentina, en los Estado Unidos,
                       Honolulu es la más sureña de entre las principales ciudades estadounidenses. Aunque el nombre de Honolulu
                       se refiere al area urbana en la costa sureste de la isla de Oahu, la ciudad y el condado de Honolulu han
                       formado una ciudad-condado consolidada que cubre toda la ciudad (aproximadamente 600 km2 de superficie).
                    </p>
                    <a class="btn btn-outline-light" href="#">Conocé más</a>
                    <br><br>
                    <div class="mapa">
                        <iframe id="mapa-bsas" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3284.0168881863056!2d-58.384145323430566!3d-34.60373445750052!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4aa9f0a6da5edb%3A0x11bead4e234e558b!2sObelisco!5e0!3m2!1ses-419!2sar!4v1701486787473!5m2!1ses-419!2sar"
                                width="100%" height="238" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" ></iframe>
                    </div>
                </div>
            </div>
        </section>

        <script>
            // Obtener el elemento del iframe
            var iframe = document.getElementById('mapa-bsas');

            // Desactivar el evento de zoom en el iframe, para que no se salga fuera de la caja al hacer zoom
            iframe.contentDocument.addEventListener('wheel', function(event) {
                if (event.ctrlKey) {
                    event.preventDefault();
                }
            });
        </script>

        <section class="container" id="form-orador">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                    <h2 class="titulo-gral">Conviértete en un <span>orador</span></h2>
                    <p class="text-center">Anótate como orador para dar una <abbr title="attribute">charla ignite</abbr>. Cuéntanos de qué quieres hablar!</p>
                    <form action="">
                        <div class="row gx-2">
                            <div class="col-md mb-3">
                                <input class="form-control" type="text" placeholder="Nombre" aria-label="Nombre" required>
                            </div>
                            <div class="col-md mb-3">
                                <input class="form-control" type="text" placeholder="Apellido" aria-label="Apellido" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mb-3">
                                <input class="form-control" type="email" placeholder="Email" aria-label="Email" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mb-3">
                                <textarea class="form-control" id="exampleFormControlTextarea1" type="text" rows="4" placeholder="¿Sobre qué quieres hablar?" aria-label="Email" required>
                                </textarea>
                                <div id="emailHelp" class="form-text mb-3">Recuerda incluir un título para tu charla.</div>
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-lg btn-form" onclick="enviarFormulario()">Enviar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>

    </main>

    <jsp:include page="footer.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>