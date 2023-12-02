/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.ProductosDAO;
import java.util.ArrayList;
import model.Articulo;
import model.Producto;

/**
 *
 * @author esdras copado
 */
public class ProductosControlador {
        public String getProductos(){
        ProductosDAO mp = new ProductosDAO();
        String htmlcode = "";
        for(Producto producto : mp.getAllProductos()){
            htmlcode += 
           "<div class=\"col-sm-4\">\n" +
"           <div class=\"card\">\n" +
"	    <div class=\"productinfo text-center\">\n" +
"	    <img src=\""+producto.getImg()+"\" alt=\"\" width=\"230\" height=\"230\" />\n" +
"	    <h2>$"+producto.getPrecio()+"</h2>\n" +
"	    <p>"+producto.getNombre()+"</p>\n" +
"	    <a href=\"product-details.jsp?id="+producto.getId()+"\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Ver detalles</a>\n" +
"	    </div>\n" +
"	    <div class=\"card-footer\">\n" +
"	    <li><a href=\"\"><i class=\"fa fa-plus-square\"></i>Agregar al carrito</a></li>\n" +
"	    </div>\n" +
"	    </div><br>\n" +
"	    </div>";
        }     
        return htmlcode;        
    }
        
 public ArrayList<Producto> getProductoList(){
 
     ProductosDAO mp = new ProductosDAO();
     ArrayList<Producto> ProductosList=mp.getAllProductos();
     return ProductosList;
 }   
       
  public String getProductoHTML(int i){
      ProductosDAO pm=new ProductosDAO();
      Producto pro=pm.getProducto(i);
      String htmlcode = "";
      htmlcode+=
"           <img src=\""+pro.getImg()+"\" alt=\"\" width=\"230\" height=\"230\" />\n" +
            "<h2>"+pro.getNombre()+"</h2>\n" +
            "<h4>ID del producto: "+pro.getId()+"</h4>\n" +
            "<form action=\"agregarproducto\" method=\"post\">\n" +
"           <span>\n" +
"	    <label>Cantidad:"+pro.getStock()+"</label>\n" +
             "<span>Precio $"+pro.getPrecio()+"</span>\n"+
"	    <input type=\"hidden\" value="+pro.getId()+" name=\"idproducto\">\n" +
"	    <input type=\"text\" value=\"1\" id=\"txt-cantidad\" name=\"cantidad\"/>\n" +
"	    <button type=\"submit\" class=\"btn btn-fefault cart\">" +
"	    <i class=\"fa fa-shopping-cart\"></i>" +
"	    Añadir al carrito\n" +
"	    </button>\n" +
"	    </span>\n" +
"	    </form>\n";
      return htmlcode; 
  }
  public Producto getProducto(int id){
      ProductosDAO pm=new ProductosDAO();
      Producto pro=pm.getProducto(id);
      return pro;
      
  }


        
}
