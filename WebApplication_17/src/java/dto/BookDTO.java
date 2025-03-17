/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author tungi
 */
public class BookDTO {
    private String bookID;
    private String title;
    private String author;
    private int publishYear;
    private double price;
    private int quantity;
    private String image;

    public BookDTO() {
        this.bookID = "";
        this.title = "";
        this.author = "";
        this.publishYear = 0;
        this.price = 0;
        this.quantity = 0;
        this.image = "";
    }

    public BookDTO(String bookID, String title, String author, int publishYear, double price, int quantity, String image) {
        this.bookID = bookID;
        this.title = title;
        this.author = author;
        this.publishYear = publishYear;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPublishYear() {
        return publishYear;
    }

    public void setPublishYear(int publishYear) {
        this.publishYear = publishYear;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
}