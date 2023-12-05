/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author esdras copado
 */
public class Reserva {
    int idReserva;


    String nombreCliente;
    String nombreArticulo;
    String status;
    float PrecioTotal;
    LocalDate fechaCompra;
    String idArticulos;

    public Reserva() {
    }

    public Reserva(String nombreCliente, String nombreArticulo, String status, float PrecioTotal, LocalDate fechaCompra, String idArticulos) {
        this.nombreCliente = nombreCliente;
        this.nombreArticulo = nombreArticulo;
        this.status = status;
        this.PrecioTotal = PrecioTotal;
        this.fechaCompra = fechaCompra;
        this.idArticulos=idArticulos;
    }
        public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public String getIdArticulos() {
        return idArticulos;
    }

    public void setIdArticulos(String idArticulos) {
        this.idArticulos = idArticulos;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getNombreArticulo() {
        return nombreArticulo;
    }

    public void setNombreArticulo(String nombreArticulo) {
        this.nombreArticulo = nombreArticulo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getPrecioTotal() {
        return PrecioTotal;
    }

    public void setPrecioTotal(float PrecioTotal) {
        this.PrecioTotal = PrecioTotal;
    }

    public LocalDate getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(LocalDate fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    @Override
    public String toString() {
        return "Reserva{" + "nombreCliente=" + nombreCliente + ", nombreArticulo=" + nombreArticulo + ", status=" + status + ", PrecioTotal=" + PrecioTotal + ", fechaCompra=" + fechaCompra + '}';
    }
    
    
    
    
    
}
