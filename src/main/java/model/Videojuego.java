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
public class Videojuego implements Serializable{
    private int id;
    private String name;
    private String imgCover;
    private String ranking;
    private int price;
    private String description;
    private String trailer;

    public Videojuego() {
        this.id=0;
        this.name=null;
        this.imgCover=null;
        this.ranking=null;
        this.price=0;
        this.description=null;
        this.trailer=null;
    }

    public Videojuego(int id, String name, String imgCover, String ranking, int price, String description,String trailer) {
        this.id = id;
        this.name = name;
        this.imgCover = imgCover;
        this.ranking = ranking;
        this.price = price;
        this.description = description;
        this.trailer=trailer;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgCover() {
        return imgCover;
    }

    public void setImgCover(String imgCover) {
        this.imgCover = imgCover;
    }

    public String getRanking() {
        return ranking;
    }

    public void setRanking(String ranking) {
        this.ranking = ranking;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
