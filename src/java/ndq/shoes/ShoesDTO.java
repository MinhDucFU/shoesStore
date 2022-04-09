/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ndq.shoes;

/**
 *
 * @author Minh Hoang
 */
public class ShoesDTO {
    private String shoesID,shoesName,description,status,image,categoryID;
    private float price;
    private int quantity;

    public ShoesDTO() {
    }

    public ShoesDTO(String shoesID, String shoesName, String description, String status, String image, String categoryID, float price, int quantity) {
        this.shoesID = shoesID;
        this.shoesName = shoesName;
        this.description = description;
        this.status = status;
        this.image = image;
        this.categoryID = categoryID;
        this.price = price;
        this.quantity = quantity;
    }

    public ShoesDTO(String shoesID, String shoesName, String description, String status, String image) {
        this.shoesID = shoesID;
        this.shoesName = shoesName;
        this.description = description;
        this.status = status;
        this.image = image;
    }

    public ShoesDTO(String shoesID, String shoesName, String description) {
        this.shoesID = shoesID;
        this.shoesName = shoesName;
        this.description = description;
    }

    public String getShoesID() {
        return shoesID;
    }

    public void setShoesID(String shoesID) {
        this.shoesID = shoesID;
    }

    public String getShoesName() {
        return shoesName;
    }

    public void setShoesName(String shoesName) {
        this.shoesName = shoesName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
