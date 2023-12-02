<%-- 
    Document   : cart
    Created on : 10 nov 2023, 14:24:01
    Author     : esdras copado
--%>

<%@page import="model.Articulo"%>
<%@page import="model.Producto"%>
<%@page import="controller.ProductosControlador"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("user");

    if (usuario == null || usuario.isEmpty()) {
        response.sendRedirect("index.jsp");
    }
%>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <div class="col-sm-6">
                    <div class="table-responsive cart_info" id="cart-container">
                        <table class="table table-condensed" id="shop-table">
                            <thead>
                                <tr class="cart_menu">
                                    <td class="image">Productos</td>
                                    <td class="description"></td>
                                    <td class="price">Precio</td>
                                    <td class="quantity">Cantidad</td>
                                    <td class="total">Total</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ProductosControlador cp = new ProductosControlador();
                                    double total = 0;
                                    double iva = 0;
                                    if (articulos != null) {
                                        for (Articulo a : articulos) {
                                            Producto producto = cp.getProducto(a.getIdProducto());
                                            total += a.getCantidad() * producto.getPrecio();
                                            iva+=total*.16;
                                %>    
                                <tr>
                                    <td class="cart_product">
                                        <a href=""><img src="<%=producto.getImg()%>" alt="" width="230" height="230"></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href=""><%=producto.getNombre()%></a></h4>
                                        <p>Web ID: <%=producto.getId()%></p>
                                    </td>
                                    <td class="cart_price">
                                        <p>$<%=producto.getPrecio()%></p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <a class="cart_quantity_up" href=""> + </a>
                                            <input class="cart_quantity_input" type="text" name="quantity" value="<%= a.getCantidad()%>" autocomplete="off" size="2">
                                            <a class="cart_quantity_down" href=""> ~ </a>
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">$<%= Math.round(producto.getPrecio() * a.getCantidad() * 100.0) / 100.0%></p>
                                    </td>
                                    <td class="cart_delete">
                                        <span id="idarticulo" style="display:none;"><%= producto.getId()%> </span>
                                        <a class="cart_quantity_delete" href="" id="deleteitem"><i class="fa fa-times"></i></a>
                                    </td>

                                    <%      }
                                        }
                                    %>
                            </tbody>
                        </table>
                        <% if (articulos == null) {%>
                        <h4>No hay articulos en el carrito de compras</h4>
                        <% }%>
                    </div><a href="javascript:window.history.go(-2);">Seguir Comprando</a>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Carrito</div>
                        <div class="card-body">
                            <table>
                                <tr>
                                    <td>Sub-total <span id="txt-subtotal"></td>
                                    <td>$ <%= Math.round(total * 100.0) / 100.0%></span></td>
                                </tr>
                                <tr>
                                    <td>IVA<span></td>
                                    <td>$ <%= Math.round(iva * 100.0) / 100.0%></span></td>
                                </tr>
                                <tr>
                                    <td>Total</td>
                                    <td><span id="txt-total">$ <%= Math.round((total+iva) * 100.0) / 100.0%></span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
