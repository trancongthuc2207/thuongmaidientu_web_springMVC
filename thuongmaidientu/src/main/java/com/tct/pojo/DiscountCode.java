/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "discount_code")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DiscountCode.findAll", query = "SELECT d FROM DiscountCode d"),
    @NamedQuery(name = "DiscountCode.findByIdDiscount", query = "SELECT d FROM DiscountCode d WHERE d.idDiscount = :idDiscount"),
    @NamedQuery(name = "DiscountCode.findByNameDiscount", query = "SELECT d FROM DiscountCode d WHERE d.nameDiscount = :nameDiscount"),
    @NamedQuery(name = "DiscountCode.findByPercentDiscount", query = "SELECT d FROM DiscountCode d WHERE d.percentDiscount = :percentDiscount"),
    @NamedQuery(name = "DiscountCode.findByValueDiscount", query = "SELECT d FROM DiscountCode d WHERE d.valueDiscount = :valueDiscount"),
    @NamedQuery(name = "DiscountCode.findByDateBeginDis", query = "SELECT d FROM DiscountCode d WHERE d.dateBeginDis = :dateBeginDis"),
    @NamedQuery(name = "DiscountCode.findByDateFinishDis", query = "SELECT d FROM DiscountCode d WHERE d.dateFinishDis = :dateFinishDis"),
    @NamedQuery(name = "DiscountCode.findByStatus", query = "SELECT d FROM DiscountCode d WHERE d.status = :status")})
public class DiscountCode implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "id_discount")
    private String idDiscount;
    @Size(max = 100)
    @Column(name = "name_discount")
    private String nameDiscount;
    @Column(name = "percent_discount")
    private Long percentDiscount;
    @Column(name = "value_discount")
    private Long valueDiscount;
    @Column(name = "date_begin_dis")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateBeginDis;
    @Column(name = "date_finish_dis")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateFinishDis;
    @Column(name = "status")
    private Integer status;
    @JoinColumn(name = "id_shop_deli", referencedColumnName = "id_shop_store")
    @ManyToOne
    private ShopStore idShopDeli;
    @OneToMany(mappedBy = "idDiscount")
    private Set<OrderDetails> orderDetailsSet;
    @OneToMany(mappedBy = "idDiscount")
    private Set<ShopProducts> shopProductsSet;

    public DiscountCode() {
    }

    public DiscountCode(String idDiscount) {
        this.idDiscount = idDiscount;
    }

    public String getIdDiscount() {
        return idDiscount;
    }

    public void setIdDiscount(String idDiscount) {
        this.idDiscount = idDiscount;
    }

    public String getNameDiscount() {
        return nameDiscount;
    }

    public void setNameDiscount(String nameDiscount) {
        this.nameDiscount = nameDiscount;
    }

    public Long getPercentDiscount() {
        return percentDiscount;
    }

    public void setPercentDiscount(Long percentDiscount) {
        this.percentDiscount = percentDiscount;
    }

    public Long getValueDiscount() {
        return valueDiscount;
    }

    public void setValueDiscount(Long valueDiscount) {
        this.valueDiscount = valueDiscount;
    }

    public Date getDateBeginDis() {
        return dateBeginDis;
    }

    public void setDateBeginDis(Date dateBeginDis) {
        this.dateBeginDis = dateBeginDis;
    }

    public Date getDateFinishDis() {
        return dateFinishDis;
    }

    public void setDateFinishDis(Date dateFinishDis) {
        this.dateFinishDis = dateFinishDis;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public ShopStore getIdShopDeli() {
        return idShopDeli;
    }

    public void setIdShopDeli(ShopStore idShopDeli) {
        this.idShopDeli = idShopDeli;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDiscount != null ? idDiscount.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DiscountCode)) {
            return false;
        }
        DiscountCode other = (DiscountCode) object;
        if ((this.idDiscount == null && other.idDiscount != null) || (this.idDiscount != null && !this.idDiscount.equals(other.idDiscount))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.DiscountCode[ idDiscount=" + idDiscount + " ]";
    }
    
}
