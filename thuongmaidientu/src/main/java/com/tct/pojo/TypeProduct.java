/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name = "type_product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TypeProduct.findAll", query = "SELECT t FROM TypeProduct t"),
    @NamedQuery(name = "TypeProduct.findByIdTypeProduct", query = "SELECT t FROM TypeProduct t WHERE t.idTypeProduct = :idTypeProduct"),
    @NamedQuery(name = "TypeProduct.findByTypeName", query = "SELECT t FROM TypeProduct t WHERE t.typeName = :typeName"),
    @NamedQuery(name = "TypeProduct.findByDescription", query = "SELECT t FROM TypeProduct t WHERE t.description = :description")})
public class TypeProduct implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_type_product")
    private Integer idTypeProduct;
    @Size(max = 50)
    @Column(name = "type_name")
    private String typeName;
    @Size(max = 120)
    @Column(name = "description")
    private String description;
    @OneToMany(mappedBy = "typeOfProduct")
    private Set<Product> productSet;
    @OneToMany(mappedBy = "mainType")
    private Set<ShopStore> shopStoreSet;
    @OneToMany(mappedBy = "ortherType1")
    private Set<ShopStore> shopStoreSet1;
    @OneToMany(mappedBy = "ortherType2")
    private Set<ShopStore> shopStoreSet2;

    public TypeProduct() {
    }

    public TypeProduct(Integer idTypeProduct) {
        this.idTypeProduct = idTypeProduct;
    }

    public Integer getIdTypeProduct() {
        return idTypeProduct;
    }

    public void setIdTypeProduct(Integer idTypeProduct) {
        this.idTypeProduct = idTypeProduct;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public Set<Product> getProductSet() {
        return productSet;
    }

    public void setProductSet(Set<Product> productSet) {
        this.productSet = productSet;
    }

    @XmlTransient
    public Set<ShopStore> getShopStoreSet() {
        return shopStoreSet;
    }

    public void setShopStoreSet(Set<ShopStore> shopStoreSet) {
        this.shopStoreSet = shopStoreSet;
    }

    @XmlTransient
    public Set<ShopStore> getShopStoreSet1() {
        return shopStoreSet1;
    }

    public void setShopStoreSet1(Set<ShopStore> shopStoreSet1) {
        this.shopStoreSet1 = shopStoreSet1;
    }

    @XmlTransient
    public Set<ShopStore> getShopStoreSet2() {
        return shopStoreSet2;
    }

    public void setShopStoreSet2(Set<ShopStore> shopStoreSet2) {
        this.shopStoreSet2 = shopStoreSet2;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTypeProduct != null ? idTypeProduct.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TypeProduct)) {
            return false;
        }
        TypeProduct other = (TypeProduct) object;
        if ((this.idTypeProduct == null && other.idTypeProduct != null) || (this.idTypeProduct != null && !this.idTypeProduct.equals(other.idTypeProduct))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.TypeProduct[ idTypeProduct=" + idTypeProduct + " ]";
    }
    
}
