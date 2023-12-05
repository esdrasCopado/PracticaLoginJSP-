<%-- 
    Document   : product-details
    Created on : 10 nov 2023, 12:36:36
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
    int id = Integer.parseInt(request.getParameter("id"));
    
    
    ProductosControlador cp=new ProductosControlador();
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Detalles del Producto</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        
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
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Cerrar sesión</a>
                </li>

            </ul>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-9 padding-right">
                    <div class="view-product">
                        <%= cp.getProductoHTML(id)%>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
