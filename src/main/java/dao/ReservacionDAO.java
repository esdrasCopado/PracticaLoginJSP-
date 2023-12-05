/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;

import model.Reserva;

/**
 *
 * @author esdras copado
 */
public class ReservacionDAO {
    
   
    public boolean Registro(Reserva reserva){
        String sql="insert into Compra(comprador,articulo,precio,status,fecha,idProducto) values (?,?,?,?,?,?);";
        
        PreparedStatement pst=null;
        ResultSet rs=null;
        
        try {
            Conexion cc=new Conexion();
            Connection conn = cc.getConnection();
            
            Date fecha=Date.valueOf(reserva.getFechaCompra());
            
            pst=conn.prepareStatement(sql);
            pst.setString(1, reserva.getNombreCliente());
            pst.setString(2, reserva.getNombreArticulo());
            pst.setFloat(3, reserva.getPrecioTotal());
            pst.setString(4, reserva.getStatus());
            pst.setDate(5, fecha);
            pst.setString(6, reserva.getIdArticulos());
            
            int fila=pst.executeUpdate();
            
            if(fila>0){
                return true;
            }
            
            
        } catch (SQLException e) {
            System.out.println("error al registrar Reservacion "+e.getMessage());
            
        }
        return false;
        
    }
    
    public ArrayList<Reserva> getReservaciones(String comprador){
       String sql = "SELECT * FROM `e-commerce`.Compra WHERE comprador = ?";

        
        try {
            Conexion cc=new Conexion();
            Connection conn=cc.getConnection();
            
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, comprador);
            ResultSet rs=ps.executeQuery();
            
            ArrayList<Reserva> listaReserva=new ArrayList<>();
            
            Reserva res;
            while(rs.next()){
                res=new Reserva();
                res.setIdReserva(rs.getInt("idCompra"));
                res.setIdArticulos(rs.getString("idProducto"));
                res.setNombreCliente(rs.getString("comprador"));
                res.setNombreArticulo(rs.getString("articulo"));
                res.setStatus(rs.getString("status"));
                res.setPrecioTotal(rs.getFloat("precio"));
               
                LocalDate fecha=Instant.ofEpochMilli( rs.getDate("fecha").getTime())
                .atZone(ZoneId.systemDefault())
                .toLocalDate();
                res.setFechaCompra(fecha);
                
                listaReserva.add(res);
                
            }
            return listaReserva;
            
        } catch (Exception e) {
            System.out.println("error al intentar obtener las reservaciones "+e.getMessage());
        }
        return null;
    }
    public void convertir(){
                /*idArticulos = idArticulos.replaceAll("\\[|\\]|\\s", "");
        
        
        String[] numerosComoString = idArticulos.split(",");
        int[] numeros = new int[numerosComoString.length];
        
        for (int i = 0; i < numerosComoString.length; i++) {
            numeros[i] = Integer.parseInt(numerosComoString[i]);
        }
        */
    }


    
}
