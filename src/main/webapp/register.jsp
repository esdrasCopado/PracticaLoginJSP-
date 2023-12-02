<%-- 
    Document   : register
    Created on : 9 nov 2023, 19:46:55
    Author     : esdras copado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro usuarios</title>
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
        .error {
        color: red;
        font-size: 12px;
  
        }
        </style>
    </head>
    <body>
    <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="RegistroUsuario" method="post">
                            <h3 class="text-center text-info">Registro</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Nombre</label><br>
                                <input type="text" name="username" id="username" class="form-control" placeholder="nombre de usuario" onblur="validarCampo()">
                                <span id="errorMensaje" class="error"></span>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Contraseña</label><br>
                                <input type="text" name="password" id="password" class="form-control" placeholder="contraseña">
                            </div>
                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Registrar" id="botonRegistrar">
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="index.jsp" class="text-info">Iniciar Sesion</a>
                                <%= request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : "" %>
                            </div>
                        </form>
                        <script>
                        function validarCampo() {
                        var entrada = document.getElementById("username").value;
                        var mensajeError = document.getElementById("errorMensaje");
                        var boton = document.getElementById("botonRegistrar");
                        event.preventDefault();
                        var patron = /^[a-zA-Z0-9\s]+$/;

                        if (!patron.test(entrada)) {
                        mensajeError.textContent = "solo texto y numeros";
                        boton.disabled = true;
                        // Puedes hacer más acciones aquí si la validación falla
                        }else{
                        mensajeError.textContent="";
                         boton.disabled = false;
                        }
                        }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
