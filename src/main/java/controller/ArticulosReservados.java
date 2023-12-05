/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.ReservacionDAO;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;

import java.time.LocalDate;
import model.Reserva;

/**
 *
 * @author esdras copado
 */
public class ArticulosReservados extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response){

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        



        
        
        
        LocalDate fechaReservacion= LocalDate.now();
        String status="Reservado";
        
        Reserva reserva=new Reserva();

        
        try (BufferedReader reader = request.getReader()) {
            StringBuilder stringBuilder = new StringBuilder();
            String linea;
            while ((linea = reader.readLine()) != null) {
                stringBuilder.append(linea);
            }
            JsonObject jsonObject=new Gson().fromJson(stringBuilder.toString(),JsonObject.class);
            
        String nombreCliente=jsonObject.get("nombreComprador").getAsString();
        String nombreProductos=jsonObject.get("nombreProductos").getAsString();
        String precioTotal=jsonObject.get("precioTotal").getAsString();
        String idArticulos=jsonObject.get("idArticulos").getAsString();
        
        
        reserva.setNombreArticulo(nombreProductos);
        reserva.setNombreCliente(nombreCliente);
        reserva.setPrecioTotal(Float.parseFloat(precioTotal));
        reserva.setFechaCompra(fechaReservacion);
        reserva.setStatus(status);
        reserva.setIdArticulos(idArticulos);
            
        } catch (IOException e) {
            System.out.println("error ArticulosReservados "+e.getMessage());
        }

        
        
        
        ReservacionDAO resDAO=new ReservacionDAO();
        
        boolean registrado=resDAO.Registro(reserva);
        enviarCorreo correoElectronico=new enviarCorreo();
        boolean correoEnviado=correoElectronico.EmailSender(reserva);
        request.setAttribute("mensaje", "usuario o clave incorrectas");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
