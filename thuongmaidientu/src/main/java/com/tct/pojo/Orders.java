/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import java.io.Serializable;
import java.util.Date;
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
@Table(name = "orders")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findByIdOrders", query = "SELECT o FROM Orders o WHERE o.idOrders = :idOrders"),
    @NamedQuery(name = "Orders.findByIdShopStore", query = "SELECT o FROM Orders o WHERE o.idShopStore = :idShopStore"),
    @NamedQuery(name = "Orders.findByTotalMoney", query = "SELECT o FROM Orders o WHERE o.totalMoney = :totalMoney"),
    @NamedQuery(name = "Orders.findByTimeBooked", query = "SELECT o FROM Orders o WHERE o.timeBooked = :timeBooked"),
    @NamedQuery(name = "Orders.findByStatus", query = "SELECT o FROM Orders o WHERE o.status = :status")})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_orders")
    private Long idOrders;
    @Size(max = 10)
    @Column(name = "id_shop_store")
    private String idShopStore;
    @Column(name = "total_money")
    private Long totalMoney;
    @Column(name = "time_booked")
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeBooked;
    @Size(max = 50)
    @Column(name = "status")
    private String status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orders")
    private Set<OrderDetails> orderDetailsSet;
    @JoinColumn(name = "id_customer", referencedColumnName = "id_customer")
    @ManyToOne
    private Customers customer;

    public Orders() {
    }

    public Orders(Long idOrders) {
        this.idOrders = idOrders;
    }

    public Long getIdOrders() {
        return idOrders;
    }

    public void setIdOrders(Long idOrders) {
        this.idOrders = idOrders;
    }

    public String getIdShopStore() {
        return idShopStore;
    }

    public void setIdShopStore(String idShopStore) {
        this.idShopStore = idShopStore;
    }

    public Long getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Long totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Date getTimeBooked() {
        return timeBooked;
    }

    public void setTimeBooked(Date timeBooked) {
        this.timeBooked = timeBooked;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @XmlTransient
    public Set<OrderDetails> getOrderDetailsSet() {
        return orderDetailsSet;
    }

    public void setOrderDetailsSet(Set<OrderDetails> orderDetailsSet) {
        this.orderDetailsSet = orderDetailsSet;
    }

    public Customers getCustomer() {
        return customer;
    }

    public void setCustomer(Customers idCustomer) {
        this.customer = idCustomer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idOrders != null ? idOrders.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.idOrders == null && other.idOrders != null) || (this.idOrders != null && !this.idOrders.equals(other.idOrders))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.Orders[ idOrders=" + idOrders + " ]";
    }
    
}
