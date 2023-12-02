/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dao.ProductosDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import model.Producto;

/**
 *
 * @author esdras copado
 */
public class ControladorProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
        Producto pro=new Producto();
        String nombre=request.getParameter("nombre");
        String imagen=request.getParameter("imagen");
        String precio=request.getParameter("precio");
        String stock=request.getParameter("stock");
        
        
        double pre=Double.parseDouble(precio);
        int st=Integer.parseInt(stock);
        
        pro.setNombre(nombre);
        pro.setImg(imagen);
        pro.setPrecio(pre);
        pro.setStock(st);
        
        ProductosDAO productoDao=new ProductosDAO();
        
        if(productoDao.RegistroProducto(pro)){
            request.setAttribute("mensaje","Guardado Correctamente");
            request.getRequestDispatcher("RegistrarProducto.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         response.setContentType("text/plain");

        // Obtén los datos enviados en la solicitud PUT
        BufferedReader reader = request.getReader();
        String line;
        StringBuilder requestBody = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            requestBody.append(line);
        }

        
        Gson gson = new Gson();
        Producto producto = gson.fromJson(requestBody.toString(), Producto.class);
        
        ProductosDAO productoDao=new ProductosDAO();
        
        productoDao.actualizar(producto);
        
        // Envía una respuesta simple al cliente
        PrintWriter out = response.getWriter();
        out.println("Datos recibidos en el servidor. Revisa la consola del servidor para verlos.");
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
