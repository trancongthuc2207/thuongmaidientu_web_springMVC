/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author ADMIN
 */
@Embeddable
public class ShopProductsPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "id_shop")
    private String idShop;
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_product")
    private int idProduct;

    public ShopProductsPK() {
    }

    public ShopProductsPK(String idShop, int idProduct) {
        this.idShop = idShop;
        this.idProduct = idProduct;
    }

    public String getIdShop() {
        return idShop;
    }

    public void setIdShop(String idShop) {
        this.idShop = idShop;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idShop != null ? idShop.hashCode() : 0);
        hash += (int) idProduct;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ShopProductsPK)) {
            return false;
        }
        ShopProductsPK other = (ShopProductsPK) object;
        if ((this.idShop == null && other.idShop != null) || (this.idShop != null && !this.idShop.equals(other.idShop))) {
            return false;
        }
        if (this.idProduct != other.idProduct) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.ShopProductsPK[ idShop=" + idShop + ", idProduct=" + idProduct + " ]";
    }
    
}
