<%-- 
    Document   : productosReservados
    Created on : 3 dic 2023, 17:52:36
    Author     : esdras copado
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Reserva" %>
<%@ page import="controller.ControladorReservaciones" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("user");
    ControladorReservaciones controlador = new ControladorReservaciones();
    if(usuario==null|| usuario.isEmpty()){
         response.sendRedirect("index.jsp");
    }
    ArrayList<Reserva> res=controlador.getReservaList(usuario);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos Comprados</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        
        
        // SDK MercadoPago.js
        <script src="https://sdk.mercadopago.com/js/v2"></script>
        <script src="mercadoPago.js"></script>
        
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
            <!-- Brand/logo -->
            <a class="navbar-brand" href="menu.jsp">Sistema JSP</a>

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
                <div class="col-sm-6">
                    <div class="table-responsive cart_info" id="cart-container">
                        <table class="table table-condensed" id="shop-table">
                            <thead>
                                <tr class="cart_menu">
                                    <td class="comprador">Comprador</td>
                                    <td class="articulos">Articulos</td>
                                    <td class="status">Status</td>
                                    <td class="fecha">Fecha</td>
                                    <td class="total">Total</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                int total=0;
                                if(res!=null){
                                for (Reserva r : res) { %>    
                                <tr>
                                    <td class="cart_product">
                                        <p><%= r.getNombreCliente() %></p>
                                    </td>
                                    <td class="cart_description">
                                        <p><%= r.getNombreArticulo() %></p>
                                    </td>
                                    <td class="cart_price">
                                       <p><%= r.getStatus() %></p>
                                    </td>
                                    <td class="cart_quantity">
                                        <p><%= r.getFechaCompra() %></p>
                                    </td>
                                    <td class="cart_total">
                                        <p><%= r.getPrecioTotal() %></p>
                                    </td>
                                    <% total+=r.getPrecioTotal(); %>
                                </tr>
                                <% }
                                    }
                                  %>
                                  <td class="cart_total">
                                        <h4>Total de compra <%= total %></h4>
                                    </td>
                            </tbody>
                        </table>
                            
                            
                            <%
                            if(res==null){
                            %>
                            <h2>no hay compras realizadas</h2>
                   <%}%>


            </div>
                    <div id="wallet_container"></div>
        </div>
        
<script>
       const mp = new MercadoPago('APP_USR-27d41402-138f-46f0-bf77-a22285ae9696');
        const bricksBuilder = mp.bricks();
</script>

    </body>
    
</html>
