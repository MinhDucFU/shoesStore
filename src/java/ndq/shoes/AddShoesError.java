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
public class AddShoesError {

    private String shoesIDError, shoesNameError, descriptionError, quantityError, priceError, statusError;

    public AddShoesError() {
    }

    public AddShoesError(String shoesIDError, String shoesNameError, String descriptionError, String quantityError, String priceError, String statusError) {
        this.shoesIDError = shoesIDError;
        this.shoesNameError = shoesNameError;
        this.descriptionError = descriptionError;
        this.quantityError = quantityError;
        this.priceError = priceError;
        this.statusError = statusError;
    }

    public String getShoesIDError() {
        return shoesIDError;
    }

    public void setShoesIDError(String shoesIDError) {
        this.shoesIDError = shoesIDError;
    }

    public String getShoesNameError() {
        return shoesNameError;
    }

    public void setShoesNameError(String shoesNameError) {
        this.shoesNameError = shoesNameError;
    }

    public String getDescriptionError() {
        return descriptionError;
    }

    public void setDescriptionError(String descriptionError) {
        this.descriptionError = descriptionError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

}
