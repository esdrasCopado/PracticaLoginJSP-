<%-- 
    Document   : menu
    Created on : 8 nov 2023, 14:38:45
    Author     : esdras copado
--%>

<%@page import="controller.ProductosControlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("user");

    if (usuario == null || usuario.isEmpty()) {
        response.sendRedirect("index.jsp");
    }

%>

<%
    ProductosControlador cp=new ProductosControlador();
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-
              lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
        <title>Menu</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
            <!-- Brand/logo -->
            <a class="navbar-brand" href="#">Sistema JSP</a>

            <!-- Links -->
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Productos</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Cerrar sesión</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="productosReservados.jsp">Mis Compras</a>
                </li>

            </ul>
        </nav>
        <div class="alert alert-primary">
            <strong>Bienvenido usuario</strong> <%= usuario%> 
        </div>
        <div class="container-fluid">
            <div class="row">
                <%= cp.getProductos()%>
            </div>
        </div>
    </body>
</html>
