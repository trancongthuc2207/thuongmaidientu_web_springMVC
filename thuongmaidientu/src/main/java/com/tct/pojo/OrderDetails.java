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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "order_details")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderDetails.findAll", query = "SELECT o FROM OrderDetails o"),
    @NamedQuery(name = "OrderDetails.findByIdOrderDetails", query = "SELECT o FROM OrderDetails o WHERE o.orderDetailsPK.idOrderDetails = :idOrderDetails"),
    @NamedQuery(name = "OrderDetails.findByIdProduct", query = "SELECT o FROM OrderDetails o WHERE o.orderDetailsPK.idProduct = :idProduct"),
    @NamedQuery(name = "OrderDetails.findByAmount", query = "SELECT o FROM OrderDetails o WHERE o.amount = :amount"),
    @NamedQuery(name = "OrderDetails.findByUnitPrice", query = "SELECT o FROM OrderDetails o WHERE o.unitPrice = :unitPrice"),
    @NamedQuery(name = "OrderDetails.findByDateCreated", query = "SELECT o FROM OrderDetails o WHERE o.dateCreated = :dateCreated"),
    @NamedQuery(name = "OrderDetails.findByDateShopaccept", query = "SELECT o FROM OrderDetails o WHERE o.dateShopaccept = :dateShopaccept"),
    @NamedQuery(name = "OrderDetails.findByDateEmployaccept", query = "SELECT o FROM OrderDetails o WHERE o.dateEmployaccept = :dateEmployaccept"),
    @NamedQuery(name = "OrderDetails.findByStt", query = "SELECT o FROM OrderDetails o WHERE o.stt = :stt")})
public class OrderDetails implements Serializable {

    @Column(name = "value_discount")
    private Long valueDiscount;

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OrderDetailsPK orderDetailsPK;
    @Column(name = "amount")
    private Integer amount;
    @Column(name = "unit_price")
    private Long unitPrice;
    @Column(name = "date_created")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreated;
    @Column(name = "date_shopaccept")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateShopaccept;
    @Column(name = "date_employaccept")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateEmployaccept;
    @Size(max = 45)
    @Column(name = "stt")
    private String stt;
    @JoinColumn(name = "id_discount", referencedColumnName = "id_discount")
    @ManyToOne
    private DiscountCode idDiscount;
    @JoinColumn(name = "id_order_details", referencedColumnName = "id_orders", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Orders orders;
    @JoinColumn(name = "id_product", referencedColumnName = "id_product", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;

    public OrderDetails() {
    }

    public OrderDetails(OrderDetailsPK orderDetailsPK) {
        this.orderDetailsPK = orderDetailsPK;
    }

    public OrderDetails(long idOrderDetails, int idProduct) {
        this.orderDetailsPK = new OrderDetailsPK(idOrderDetails, idProduct);
    }

    public OrderDetailsPK getOrderDetailsPK() {
        return orderDetailsPK;
    }

    public void setOrderDetailsPK(OrderDetailsPK orderDetailsPK) {
        this.orderDetailsPK = orderDetailsPK;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Long getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Long unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getDateShopaccept() {
        return dateShopaccept;
    }

    public void setDateShopaccept(Date dateShopaccept) {
        this.dateShopaccept = dateShopaccept;
    }

    public Date getDateEmployaccept() {
        return dateEmployaccept;
    }

    public void setDateEmployaccept(Date dateEmployaccept) {
        this.dateEmployaccept = dateEmployaccept;
    }

    public String getStt() {
        return stt;
    }

    public void setStt(String stt) {
        this.stt = stt;
    }

    public DiscountCode getIdDiscount() {
        return idDiscount;
    }

    public void setIdDiscount(DiscountCode idDiscount) {
        this.idDiscount = idDiscount;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderDetailsPK != null ? orderDetailsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderDetails)) {
            return false;
        }
        OrderDetails other = (OrderDetails) object;
        if ((this.orderDetailsPK == null && other.orderDetailsPK != null) || (this.orderDetailsPK != null && !this.orderDetailsPK.equals(other.orderDetailsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.OrderDetails[ orderDetailsPK=" + orderDetailsPK + " ]";
    }

    public Long getValueDiscount() {
        return valueDiscount;
    }

    public void setValueDiscount(Long valueDiscount) {
        this.valueDiscount = valueDiscount;
    }
    
}
