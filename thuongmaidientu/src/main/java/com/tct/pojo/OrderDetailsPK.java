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

/**
 *
 * @author ADMIN
 */
@Embeddable
public class OrderDetailsPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "id_order_details")
    private long idOrderDetails;
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_product")
    private int idProduct;

    public OrderDetailsPK() {
    }

    public OrderDetailsPK(long idOrderDetails, int idProduct) {
        this.idOrderDetails = idOrderDetails;
        this.idProduct = idProduct;
    }

    public long getIdOrderDetails() {
        return idOrderDetails;
    }

    public void setIdOrderDetails(long idOrderDetails) {
        this.idOrderDetails = idOrderDetails;
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
        hash += (int) idOrderDetails;
        hash += (int) idProduct;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDetailsPK)) {
            return false;
        }
        OrderDetailsPK other = (OrderDetailsPK) object;
        if (this.idOrderDetails != other.idOrderDetails) {
            return false;
        }
        if (this.idProduct != other.idProduct) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.OrderDetailsPK[ idOrderDetails=" + idOrderDetails + ", idProduct=" + idProduct + " ]";
    }
    
}
