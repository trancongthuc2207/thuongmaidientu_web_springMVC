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
@Table(name = "account_shop")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccountShop.findAll", query = "SELECT a FROM AccountShop a"),
    @NamedQuery(name = "AccountShop.findByIdAccountS", query = "SELECT a FROM AccountShop a WHERE a.idAccountS = :idAccountS"),
    @NamedQuery(name = "AccountShop.findByUsernameS", query = "SELECT a FROM AccountShop a WHERE a.usernameS = :usernameS"),
    @NamedQuery(name = "AccountShop.findByPasswordS", query = "SELECT a FROM AccountShop a WHERE a.passwordS = :passwordS")})
public class AccountShop implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "id_account_s")
    private String idAccountS;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "username_s")
    private String usernameS;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "password_s")
    private String passwordS;
    @JoinColumn(name = "id_pos", referencedColumnName = "id_position")
    @ManyToOne
    private PositionStaff idPos;
    @OneToMany(mappedBy = "idAccountS")
    private Set<ShopStore> shopStoreSet;

    public AccountShop() {
    }

    public AccountShop(String idAccountS) {
        this.idAccountS = idAccountS;
    }

    public AccountShop(String idAccountS, String usernameS, String passwordS) {
        this.idAccountS = idAccountS;
        this.usernameS = usernameS;
        this.passwordS = passwordS;
    }

    public String getIdAccountS() {
        return idAccountS;
    }

    public void setIdAccountS(String idAccountS) {
        this.idAccountS = idAccountS;
    }

    public String getUsernameS() {
        return usernameS;
    }

    public void setUsernameS(String usernameS) {
        this.usernameS = usernameS;
    }

    public String getPasswordS() {
        return passwordS;
    }

    public void setPasswordS(String passwordS) {
        this.passwordS = passwordS;
    }

    public PositionStaff getIdPos() {
        return idPos;
    }

    public void setIdPos(PositionStaff idPos) {
        this.idPos = idPos;
    }

    @XmlTransient
    public Set<ShopStore> getShopStoreSet() {
        return shopStoreSet;
    }

    public void setShopStoreSet(Set<ShopStore> shopStoreSet) {
        this.shopStoreSet = shopStoreSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idAccountS != null ? idAccountS.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AccountShop)) {
            return false;
        }
        AccountShop other = (AccountShop) object;
        if ((this.idAccountS == null && other.idAccountS != null) || (this.idAccountS != null && !this.idAccountS.equals(other.idAccountS))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.AccountShop[ idAccountS=" + idAccountS + " ]";
    }
    
}
