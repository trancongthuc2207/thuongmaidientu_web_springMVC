/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "shop_products")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ShopProducts.findAll", query = "SELECT s FROM ShopProducts s"),
    @NamedQuery(name = "ShopProducts.findByIdShop", query = "SELECT s FROM ShopProducts s WHERE s.shopProductsPK.idShop = :idShop"),
    @NamedQuery(name = "ShopProducts.findByIdProduct", query = "SELECT s FROM ShopProducts s WHERE s.shopProductsPK.idProduct = :idProduct"),
    @NamedQuery(name = "ShopProducts.findByAmount", query = "SELECT s FROM ShopProducts s WHERE s.amount = :amount"),
    @NamedQuery(name = "ShopProducts.findByTimeBegin", query = "SELECT s FROM ShopProducts s WHERE s.timeBegin = :timeBegin"),
    @NamedQuery(name = "ShopProducts.findByTimeFinish", query = "SELECT s FROM ShopProducts s WHERE s.timeFinish = :timeFinish")})
public class ShopProducts implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ShopProductsPK shopProductsPK;
    @Column(name = "amount")
    private Integer amount;
    @Column(name = "time_begin")
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeBegin;
    @Column(name = "time_finish")
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeFinish;
    @JoinColumn(name = "id_discount", referencedColumnName = "id_discount")
    @ManyToOne
    private DiscountCode idDiscount;
    @JoinColumn(name = "id_product", referencedColumnName = "id_product", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;
    @JoinColumn(name = "id_shop", referencedColumnName = "id_shop_store", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private ShopStore shopStore;

    public ShopProducts() {
    }

    public ShopProducts(ShopProductsPK shopProductsPK) {
        this.shopProductsPK = shopProductsPK;
    }

    public ShopProducts(String idShop, int idProduct) {
        this.shopProductsPK = new ShopProductsPK(idShop, idProduct);
    }

    public ShopProductsPK getShopProductsPK() {
        return shopProductsPK;
    }

    public void setShopProductsPK(ShopProductsPK shopProductsPK) {
        this.shopProductsPK = shopProductsPK;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Date getTimeBegin() {
        return timeBegin;
    }

    public void setTimeBegin(Date timeBegin) {
        this.timeBegin = timeBegin;
    }

    public Date getTimeFinish() {
        return timeFinish;
    }

    public void setTimeFinish(Date timeFinish) {
        this.timeFinish = timeFinish;
    }

    public DiscountCode getIdDiscount() {
        return idDiscount;
    }

    public void setIdDiscount(DiscountCode idDiscount) {
        this.idDiscount = idDiscount;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ShopStore getShopStore() {
        return shopStore;
    }

    public void setShopStore(ShopStore shopStore) {
        this.shopStore = shopStore;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (shopProductsPK != null ? shopProductsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ShopProducts)) {
            return false;
        }
        ShopProducts other = (ShopProducts) object;
        if ((this.shopProductsPK == null && other.shopProductsPK != null) || (this.shopProductsPK != null && !this.shopProductsPK.equals(other.shopProductsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.ShopProducts[ shopProductsPK=" + shopProductsPK + " ]";
    }
    
}
