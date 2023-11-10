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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Categoria;

/**
 *
 * @author esdras copado
 */
public class CategoriaDAO {
    
    public static boolean registrar(Categoria cat){
        String SQL ="INSERT INTO category(category) VALUES(?);";
        Conexion cc=new Conexion();
        Connection conn=cc.getConnection();
        
        try {
            PreparedStatement st=conn.prepareStatement(SQL);
            st.setString(1,cat.getCategoria());
            if(st.executeUpdate()>0){
                return true;
            }else{
                return false;
            }
        } catch (SQLException ex) {
           return false;
        }
        
    }
    
    public static ArrayList<Categoria> listar(){
        String SQL ="SELECT * FROM category;";
        Connection conn=Conexion.getConnection();
        try {
            PreparedStatement st=conn.prepareStatement(SQL);
            ResultSet resultado=st.executeQuery();
            ArrayList<Categoria> lista=null;
            
            Categoria cat;
            while(resultado.next()){
                cat=new Categoria();
                cat.setCodigo(resultado.getInt("id"));
                cat.setCategoria(resultado.getString("category"));
                lista.add(cat);
            }
            return lista;
        } catch (SQLException ex) {
           return null;
        }
        
    }
    

    
}
