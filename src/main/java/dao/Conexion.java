/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
/**
 *
 * @author esdras copado
 */

public class Conexion {

        private static Connection conn;
        
    public Conexion() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
             conn = DriverManager.getConnection(
  "jdbc:mysql://aws.connect.psdb.cloud/e-commerce?sslMode=VERIFY_IDENTITY",
  "h7qhovy13vxc7qckigu7",
  "pscale_pw_fmY4iCnIkN8uykjs0aDNASpw7jzuhxOmU0aEz0GaP0g");
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public static Connection getConnection() {
        return conn;
    }

}
