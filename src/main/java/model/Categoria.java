/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

/**
 *
 * @author esdras copado
 */
public class Categoria implements Serializable{
    private int codigo;
    private String categoria;
    
    public Categoria(){
        this.codigo=0;
        this.categoria=null;
    }

    public Categoria(int codigo, String categoria) {
        this.codigo = codigo;
        this.categoria = categoria;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    
        
}
