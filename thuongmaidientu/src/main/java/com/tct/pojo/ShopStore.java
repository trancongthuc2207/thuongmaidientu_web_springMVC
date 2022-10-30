/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.*;
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
    @NamedQuery(name = "ShopStore.findByNameStore", query = "SELECT s FROM ShopStore s WHERE s.nameStore = :nameStore"),
    @NamedQuery(name = "ShopStore.findByImageS", query = "SELECT s FROM ShopStore s WHERE s.imageS = :imageS"),
    @NamedQuery(name = "ShopStore.findByDateBegin", query = "SELECT s FROM ShopStore s WHERE s.dateBegin = :dateBegin")})
public class ShopStore implements Serializable {

    @Column(name = "rating")
    private Integer rating;

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
    @Size(max = 250)
    @Column(name = "image_s")
    private String imageS;
    @Column(name = "date_begin")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateBegin;
    @OneToMany(mappedBy = "idShop")
    private Set<Product> productSet;
    @OneToMany(mappedBy = "idShopDeli")
    private Set<DiscountCode> discountCodeSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "shopStore")
    private Set<ShopProducts> shopProductsSet;
    @JoinColumn(name = "id_acc", referencedColumnName = "id_account")
    @ManyToOne
    private Account idAcc;
    @JoinColumn(name = "main_type", referencedColumnName = "id_type_product")
    @ManyToOne
    private TypeProduct mainType;
    @JoinColumn(name = "orther_type1", referencedColumnName = "id_type_product")
    @ManyToOne
    private TypeProduct ortherType1;
    @JoinColumn(name = "orther_type2", referencedColumnName = "id_type_product")
    @ManyToOne
    private TypeProduct ortherType2;
    @OneToMany(mappedBy = "idShopStore")
    private Set<Report> reportSet;

    @Transient
    private MultipartFile file;

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

    public String getImageS() {
        return imageS;
    }

    public void setImageS(String imageS) {
        this.imageS = imageS;
    }

    public Date getDateBegin() {
        return dateBegin;
    }

    public void setDateBegin(Date dateBegin) {
        this.dateBegin = dateBegin;
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

    @XmlTransient
    public Set<ShopProducts> getShopProductsSet() {
        return shopProductsSet;
    }

    public void setShopProductsSet(Set<ShopProducts> shopProductsSet) {
        this.shopProductsSet = shopProductsSet;
    }

    public Account getIdAcc() {
        return idAcc;
    }

    public void setIdAcc(Account idAcc) {
        this.idAcc = idAcc;
    }

    public TypeProduct getMainType() {
        return mainType;
    }

    public void setMainType(TypeProduct mainType) {
        this.mainType = mainType;
    }

    public TypeProduct getOrtherType1() {
        return ortherType1;
    }

    public void setOrtherType1(TypeProduct ortherType1) {
        this.ortherType1 = ortherType1;
    }

    public TypeProduct getOrtherType2() {
        return ortherType2;
    }

    public void setOrtherType2(TypeProduct ortherType2) {
        this.ortherType2 = ortherType2;
    }

    @XmlTransient
    public Set<Report> getReportSet() {
        return reportSet;
    }

    public void setReportSet(Set<Report> reportSet) {
        this.reportSet = reportSet;
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

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }
}
