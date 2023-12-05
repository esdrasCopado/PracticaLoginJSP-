/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Producto;

/**
 *
 * @author esdras copado
 */
public class ProductosDAO {

   public static ArrayList<Producto> getAllProductos() {
    PreparedStatement pst = null;
    ResultSet rs = null;
    String SQL = "SELECT * FROM productos;";
    Conexion cc = new Conexion();
    Connection conn = cc.getConnection();
    
    try {
        PreparedStatement st = conn.prepareStatement(SQL);
        ResultSet resultado = st.executeQuery();
        ArrayList<Producto> lista = new ArrayList<>(); // Inicializa la lista

        Producto pro;
        while (resultado.next()) {
            pro = new Producto();
            pro.setId(resultado.getInt("id_producto"));
            pro.setNombre(resultado.getString("nombre"));
            pro.setImg(resultado.getString("img_producto"));
            pro.setPrecio(resultado.getDouble("precio"));
            pro.setStock(resultado.getInt("stok"));
            lista.add(pro);
        }
        return lista;
    } catch (SQLException ex) {
        ex.printStackTrace(); // Imprime la traza de la excepción para obtener más detalles
        return null;
    } finally {
        try {
            if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                e.printStackTrace(); // Imprime la traza de la excepción para obtener más detalles
            }
        }

    }

    public static void actualizar(Producto producto) {
        String sql = "UPDATE productos SET nombre = ?, precio = ?, stok = ? WHERE id_producto = ?";

        Conexion cc = new Conexion();
        Connection conn = cc.getConnection();

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setString(1, producto.getNombre());
            st.setDouble(2, producto.getPrecio());
            st.setInt(3, producto.getStock());
            st.setInt(4, producto.getId()); // ID del producto a actualizar

            int filasActualizadas=st.executeUpdate();
            if(filasActualizadas>0){
                System.out.println("actualizacion exitosa");
            }else{
                System.out.println("no se actualizo");
            }
        } catch (SQLException e) {
            System.out.println("error al actualizar "+ e.getMessage());
        }

    }

    public Producto getProducto(int idProducto) {
        PreparedStatement pst = null;
    ResultSet rs = null;
    String SQL = "SELECT * FROM productos WHERE id_producto = ?;";
    Conexion cc = new Conexion();
    Connection conn = cc.getConnection();

    try {
        pst = conn.prepareStatement(SQL);
        pst.setInt(1, idProducto);
        ResultSet resultado = pst.executeQuery();

        // Verifica si hay resultados antes de intentar acceder a ellos
        if (resultado.next()) {
            Producto pro = new Producto();
            pro.setId(resultado.getInt("id_producto"));
            pro.setNombre(resultado.getString("nombre"));
            pro.setImg(resultado.getString("img_producto"));
            pro.setPrecio(resultado.getDouble("precio"));
            pro.setStock(resultado.getInt("stok"));

            return pro;
        } else {
            // No se encontró ningún producto con el ID especificado
            return null;
        }
    } catch (SQLException ex) {
        ex.printStackTrace(); // Imprime la traza de la excepción para obtener más detalles
        return null;
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Imprime la traza de la excepción para obtener más detalles
        }
    }
    
    
}
public boolean RegistroProducto(Producto pro) {
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        // Consulta SQL para insertar un nuevo producto en la base de datos
        String consulta = "insert into productos(nombre,img_producto,precio,stok) values (?,?,?,?);";
        Conexion cc = new Conexion();
        Connection conn = cc.getConnection();

        // Preparar la declaración SQL con parámetros
        pst = conn.prepareStatement(consulta, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        pst.setString(1, pro.getNombre());
        pst.setString(2, pro.getImg());
        pst.setDouble(3, pro.getPrecio());
        pst.setInt(4, pro.getStock());

        // Ejecutar la consulta
        int filasAfectadas = pst.executeUpdate();

        // Verificar si al menos una fila fue afectada (indicando una inserción exitosa)
        if (filasAfectadas > 0) {
            return true;
        }
    } catch (Exception e) {
        System.out.println("Error: " + e);
    } finally {
        try {
            // Cerrar recursos
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
        } catch (Exception e) {
            // Manejar cualquier excepción al cerrar recursos
            System.out.println("Error al cerrar recursos: " + e);
        }
    }

    // Si llegamos a este punto, la inserción no fue exitosa
    return false;
}

public boolean EliminarProducto(int i){
    PreparedStatement pst=null;
    ResultSet rs=null;
    
    try {
        String sql="DELETE  FROM `e-commerce`.productos WHERE id_producto=?";
        Conexion conexion=new Conexion();
        Connection conn=conexion.getConnection();
        pst=conn.prepareStatement(sql);
        pst.setInt(1, i);
        
        int filasAfectadas=pst.executeUpdate();
        if (filasAfectadas > 0) {
            return true;
        }
        
    } catch (SQLException e) {
        System.out.println("error al intentar eliminar producto "+e.getMessage());
    }
    return false;
}


}
