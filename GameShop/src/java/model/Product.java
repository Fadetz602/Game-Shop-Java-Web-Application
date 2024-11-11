package model;

import java.util.Date;

public class Product {
    private int id;
    private String name;
    private String publisher;
    private String description;
    private double price;
    private Date releaseDate;
    private String img;
    private String category; // Add the category field

    public Product() {
    }

    public Product(int id, String name, String publisher, String description, double price, Date releaseDate, String img, String category) {
        this.id = id;
        this.name = name;
        this.publisher = publisher;
        this.description = description;
        this.price = price;
        this.releaseDate = releaseDate;
        this.img = img;
        this.category = category; // Initialize the category field
    }

    // Getters and setters for all fields, including category

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

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", publisher='" + publisher + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", releaseDate=" + releaseDate +
                ", img='" + img + '\'' +
                ", category='" + category + '\'' + // Include category in toString
                '}';
    }
}
