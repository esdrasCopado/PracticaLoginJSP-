/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Usuario;

/**
 *
 * @author esdras copado
 */
public class UsuarioDao {
    public static boolean registrar(Usuario usuario){
        String SQL ="INSERT INTO usuarios(nombre,pass) VALUES(?,?);";
        Conexion cc=new Conexion();
        Connection conn=cc.getConnection();
        
        try {
            PreparedStatement st=conn.prepareStatement(SQL);
            st.setString(1,usuario.getName());
            st.setString(2,usuario.getPassword());
            if(st.executeUpdate()>0){
                return true;
            }else{
                return false;
            }
        } catch (SQLException ex) {
           return false;
        }
        
    }
    public static boolean autenticacion(Usuario usuario){
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
            String consulta="SELECT * FROM usuarios WHERE nombre=? and pass=?;";
            Conexion cc=new Conexion();
            Connection conn=cc.getConnection();
            
            pst=conn.prepareStatement(consulta,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pst.setString(1, usuario.getName());
            pst.setString(2, usuario.getPassword());
            
            rs=pst.executeQuery();
            
            if(rs.absolute(1)){
                return true;
            }
        } catch (Exception e) {
            System.out.println("error "+ e);
        }finally{
            try {
                if (rs != null) {
                    rs.close();
                }
                if(pst!=null){
                    pst.close();
                }
                
            } catch (Exception e) {
                
            }
        }
        return false;
    }
}
