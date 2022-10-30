/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import java.io.Serializable;
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
@Table(name = "account")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Account.findAll", query = "SELECT a FROM Account a"),
    @NamedQuery(name = "Account.findByIdAccount", query = "SELECT a FROM Account a WHERE a.idAccount = :idAccount"),
    @NamedQuery(name = "Account.findByUsernameC", query = "SELECT a FROM Account a WHERE a.usernameC = :usernameC"),
    @NamedQuery(name = "Account.findByPasswordC", query = "SELECT a FROM Account a WHERE a.passwordC = :passwordC")})
public class Account implements Serializable {

    @Size(max = 45)
    @Column(name = "stt")
    private String stt;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_account")
    private Integer idAccount;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "username_c")
    private String usernameC;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "password_c")
    private String passwordC;
    @OneToMany(mappedBy = "idAcc")
    private Set<ShopStore> shopStoreSet;
    @JoinColumn(name = "id_pos", referencedColumnName = "id_position")
    @ManyToOne(optional = false)
    private PositionStaff idPos;
    @Transient
    @Size(min = 1, max = 250)
    private String confirmPassword;

    public Account() {
    }

    public Account(Integer idAccount) {
        this.idAccount = idAccount;
    }

    public Account(Integer idAccount, String usernameC, String passwordC) {
        this.idAccount = idAccount;
        this.usernameC = usernameC;
        this.passwordC = passwordC;
    }

    public Integer getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(Integer idAccount) {
        this.idAccount = idAccount;
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

    @XmlTransient
    public Set<ShopStore> getShopStoreSet() {
        return shopStoreSet;
    }

    public void setShopStoreSet(Set<ShopStore> shopStoreSet) {
        this.shopStoreSet = shopStoreSet;
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
        hash += (idAccount != null ? idAccount.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Account)) {
            return false;
        }
        Account other = (Account) object;
        if ((this.idAccount == null && other.idAccount != null) || (this.idAccount != null && !this.idAccount.equals(other.idAccount))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.Account[ idAccount=" + idAccount + " ]";
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getStt() {
        return stt;
    }

    public void setStt(String stt) {
        this.stt = stt;
    }
}
