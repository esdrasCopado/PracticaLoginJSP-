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
  "i7mh0g8mibmut22fzdyn",
  "pscale_pw_aYPmffQhTONRZX8kS8yEFJU94ce5DbXClXoQTvK94cR");
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public static Connection getConnection() {
        return conn;
    }

}
