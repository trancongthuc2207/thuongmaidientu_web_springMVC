/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "account_cus")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccountCus.findAll", query = "SELECT a FROM AccountCus a"),
    @NamedQuery(name = "AccountCus.findByIdAccountCus", query = "SELECT a FROM AccountCus a WHERE a.idAccountCus = :idAccountCus"),
    @NamedQuery(name = "AccountCus.findByUsernameC", query = "SELECT a FROM AccountCus a WHERE a.usernameC = :usernameC"),
    @NamedQuery(name = "AccountCus.findByPasswordC", query = "SELECT a FROM AccountCus a WHERE a.passwordC = :passwordC")})
public class AccountCus implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "id_account_cus")
    private String idAccountCus;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "username_c")
    private String usernameC;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "password_c")
    private String passwordC;
    @JoinColumn(name = "id_account_cus", referencedColumnName = "id_customer", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Customers customers;
    @JoinColumn(name = "id_pos", referencedColumnName = "id_position")
    @ManyToOne(optional = false)
    private PositionStaff idPos;

    public AccountCus() {
    }

    public AccountCus(String idAccountCus) {
        this.idAccountCus = idAccountCus;
    }

    public AccountCus(String idAccountCus, String usernameC, String passwordC) {
        this.idAccountCus = idAccountCus;
        this.usernameC = usernameC;
        this.passwordC = passwordC;
    }

    public String getIdAccountCus() {
        return idAccountCus;
    }

    public void setIdAccountCus(String idAccountCus) {
        this.idAccountCus = idAccountCus;
    }

    public String getUsernameC() {
        return usernameC;
    }

    public void setUsernameC(String usernameC) {
        this.usernameC = usernameC;
    }

    public String getPasswordC() {
        return passwordC;
    }

    public void setPasswordC(String passwordC) {
        this.passwordC = passwordC;
    }

    public Customers getCustomers() {
        return customers;
    }

    public void setCustomers(Customers customers) {
        this.customers = customers;
    }

    public PositionStaff getIdPos() {
        return idPos;
    }

    public void setIdPos(PositionStaff idPos) {
        this.idPos = idPos;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idAccountCus != null ? idAccountCus.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AccountCus)) {
            return false;
        }
        AccountCus other = (AccountCus) object;
        if ((this.idAccountCus == null && other.idAccountCus != null) || (this.idAccountCus != null && !this.idAccountCus.equals(other.idAccountCus))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.AccountCus[ idAccountCus=" + idAccountCus + " ]";
    }
    
}
