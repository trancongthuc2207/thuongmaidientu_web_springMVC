/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "shop_store")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ShopStore.findAll", query = "SELECT s FROM ShopStore s"),
    @NamedQuery(name = "ShopStore.findByIdShopStore", query = "SELECT s FROM ShopStore s WHERE s.idShopStore = :idShopStore"),
    @NamedQuery(name = "ShopStore.findByNameStore", query = "SELECT s FROM ShopStore s WHERE s.nameStore = :nameStore")})
public class ShopStore implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "id_shop_store")
    private String idShopStore;
    @Size(max = 45)
    @Column(name = "name_store")
    private String nameStore;
    @OneToMany(mappedBy = "idShop")
    private Set<Product> productSet;
    @OneToMany(mappedBy = "idShopDeli")
    private Set<DiscountCode> discountCodeSet;
    @JoinColumn(name = "id_acc", referencedColumnName = "id_account")
    @ManyToOne
    private Account idAcc;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "shopStore")
    private Set<ShopProducts> shopProductsSet;

    public ShopStore() {
    }

    public ShopStore(String idShopStore) {
        this.idShopStore = idShopStore;
    }

    public String getIdShopStore() {
        return idShopStore;
    }

    public void setIdShopStore(String idShopStore) {
        this.idShopStore = idShopStore;
    }

    public String getNameStore() {
        return nameStore;
    }

    public void setNameStore(String nameStore) {
        this.nameStore = nameStore;
    }

    @XmlTransient
    public Set<Product> getProductSet() {
        return productSet;
    }

    public void setProductSet(Set<Product> productSet) {
        this.productSet = productSet;
    }

    @XmlTransient
    public Set<DiscountCode> getDiscountCodeSet() {
        return discountCodeSet;
    }

    public void setDiscountCodeSet(Set<DiscountCode> discountCodeSet) {
        this.discountCodeSet = discountCodeSet;
    }

    public Account getIdAcc() {
        return idAcc;
    }

    public void setIdAcc(Account idAcc) {
        this.idAcc = idAcc;
    }

    @XmlTransient
    public Set<ShopProducts> getShopProductsSet() {
        return shopProductsSet;
    }

    public void setShopProductsSet(Set<ShopProducts> shopProductsSet) {
        this.shopProductsSet = shopProductsSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idShopStore != null ? idShopStore.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ShopStore)) {
            return false;
        }
        ShopStore other = (ShopStore) object;
        if ((this.idShopStore == null && other.idShopStore != null) || (this.idShopStore != null && !this.idShopStore.equals(other.idShopStore))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.ShopStore[ idShopStore=" + idShopStore + " ]";
    }
    
}
