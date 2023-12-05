/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.ReservacionDAO;
import java.util.ArrayList;
import model.Reserva;

/**
 *
 * @author esdras copado
 */
public class ControladorReservaciones {
    
    public ArrayList<Reserva> getReservaList(String Cliente){
        ReservacionDAO reservadao=new ReservacionDAO();
        ArrayList<Reserva> li=reservadao.getReservaciones(Cliente);
        return li;
    }
    
}
