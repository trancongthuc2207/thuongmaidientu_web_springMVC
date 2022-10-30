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
@Table(name = "product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
    @NamedQuery(name = "Product.findByIdProduct", query = "SELECT p FROM Product p WHERE p.idProduct = :idProduct"),
    @NamedQuery(name = "Product.findByNameProduct", query = "SELECT p FROM Product p WHERE p.nameProduct = :nameProduct"),
    @NamedQuery(name = "Product.findByUnitPrice", query = "SELECT p FROM Product p WHERE p.unitPrice = :unitPrice"),
    @NamedQuery(name = "Product.findByProductDescription", query = "SELECT p FROM Product p WHERE p.productDescription = :productDescription"),
    @NamedQuery(name = "Product.findByManufacturer", query = "SELECT p FROM Product p WHERE p.manufacturer = :manufacturer"),
    @NamedQuery(name = "Product.findByImage", query = "SELECT p FROM Product p WHERE p.image = :image"),
    @NamedQuery(name = "Product.findByStatus", query = "SELECT p FROM Product p WHERE p.status = :status"),
    @NamedQuery(name = "Product.findByDateCreated", query = "SELECT p FROM Product p WHERE p.dateCreated = :dateCreated")})
public class Product implements Serializable {

    @OneToMany(mappedBy = "idProCmt")
    private Set<Comment> commentSet;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_product")
    private Integer idProduct;
    @Size(max = 45)
    @Column(name = "name_product")
    private String nameProduct;
    @Column(name = "unit_price")
    private Long unitPrice;
    @Size(max = 200)
    @Column(name = "product_description")
    private String productDescription;
    @Size(max = 100)
    @Column(name = "manufacturer")
    private String manufacturer;
    @Size(max = 200)
    @Column(name = "image")
    private String image;
    @Column(name = "status")
    private Integer status;
    @Column(name = "date_created")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreated;
    @JoinColumn(name = "id_shop", referencedColumnName = "id_shop_store")
    @ManyToOne
    private ShopStore idShop;
    @JoinColumn(name = "type_of_product", referencedColumnName = "id_type_product")
    @ManyToOne
    private TypeProduct typeOfProduct;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private Set<OrderDetails> orderDetailsSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private Set<ShopProducts> shopProductsSet;
    @OneToMany(mappedBy = "idProduct")
    private Set<Report> reportSet;

    @Transient
    private MultipartFile file;

    public Product() {
    }

    public Product(Integer idProduct) {
        this.idProduct = idProduct;
    }

    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Integer idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public Long getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Long unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public ShopStore getIdShop() {
        return idShop;
    }

    public void setIdShop(ShopStore idShop) {
        this.idShop = idShop;
    }

    public TypeProduct getTypeOfProduct() {
        return typeOfProduct;
    }

    public void setTypeOfProduct(TypeProduct typeOfProduct) {
        this.typeOfProduct = typeOfProduct;
    }

    @XmlTransient
    public Set<OrderDetails> getOrderDetailsSet() {
        return orderDetailsSet;
    }

    public void setOrderDetailsSet(Set<OrderDetails> orderDetailsSet) {
        this.orderDetailsSet = orderDetailsSet;
    }

    @XmlTransient
    public Set<ShopProducts> getShopProductsSet() {
        return shopProductsSet;
    }

    public void setShopProductsSet(Set<ShopProducts> shopProductsSet) {
        this.shopProductsSet = shopProductsSet;
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
        hash += (idProduct != null ? idProduct.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.idProduct == null && other.idProduct != null) || (this.idProduct != null && !this.idProduct.equals(other.idProduct))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.Product[ idProduct=" + idProduct + " ]";
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @XmlTransient
    public Set<Comment> getCommentSet() {
        return commentSet;
    }

    public void setCommentSet(Set<Comment> commentSet) {
        this.commentSet = commentSet;
    }
}
