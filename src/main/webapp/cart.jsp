<%-- 
    Document   : cart
    Created on : 10 nov 2023, 14:24:01
    Author     : esdras copado
--%>

<%@page import="model.Articulo"%>
<%@page import="model.Producto"%>
<%@page import="controller.ProductosControlador"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays" %>
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
        <link rel="stylesheet" href="style.css">
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
                                    String[] nombresProductos=new String[articulos.size()];
                                    int[] idArticulo=new int[articulos.size()];
                                    int index=0;
                                    if (articulos != null) {
                                        for (Articulo a : articulos) {
                                            Producto producto = cp.getProducto(a.getIdProducto());
                                            total += a.getCantidad() * producto.getPrecio();
                                            iva+=total*.16;
                                            nombresProductos[index]=producto.getNombre();
                                            idArticulo[index]=a.getIdProducto();
                                            index++;
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
                    
                    <button class="HacerRecerva" onclick="GuardarCompra()">Hacer Reservación</button>
                    
                </div>
                    <div id="myModal" class="ESmodal">
                        <div class="Mymodal-content">
                            <button class="ModalClose" onclick="cerrarModal()">&times;</button>
                            <p id="modalMessage"></p>
                        </div>
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
                             
<script>

    var totalPrecio= <%= Math.round((total+iva) * 100.0) / 100.0 %>;
    var comprador='<%= (String) objSesion.getAttribute("user") %>';
    var productosNom = '<%= Arrays.toString(nombresProductos) %>';
    var idArticulo='<%= Arrays.toString(idArticulo) %>';

    
    function GuardarCompra(){
        var datos={
            precioTotal:totalPrecio,
            nombreComprador:comprador,
            nombreProductos:productosNom,
            idArticulos:idArticulo
        };

        var opciones={
            method: 'POST',
        headers: {
        'Content-Type': 'application/json'
        },
        body: JSON.stringify(datos)
        };

        fetch('ArticulosReservados',opciones)
            .then(Response=>{
                mostrarModal("Reservación Realizada");
        }).catch(error=>{
            console.error('error al enviar solicitud', error);
        });
        
        
    };
  function mostrarModal(mensaje) {
    var modal = document.getElementById('myModal');
    var modalMessage = document.getElementById('modalMessage');
    modalMessage.innerHTML = mensaje;
    modal.style.display = 'block';
}

function cerrarModal() {
    var modal = document.getElementById('myModal');
    limpiarCarrito();
    modal.style.display = 'none';
    javascript:window.history.go(-2);
}
function limpiarCarrito() {
    fetch('LimpiarCarritoServlet', {
        method: 'POST', // Método utilizado en el servlet
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (response.ok) {
            console.log('Variable de sesión "carrito" limpiada exitosamente');
        } else {
            console.error('Error al limpiar la variable de sesión "carrito"');
        }
    })
    .catch(error => {
        console.error('Error en la solicitud al servidor:', error);
    });
}


</script>


    </body>
</html>
