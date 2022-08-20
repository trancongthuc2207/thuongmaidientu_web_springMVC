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
@Table(name = "administrator")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Administrator.findAll", query = "SELECT a FROM Administrator a"),
    @NamedQuery(name = "Administrator.findByIdAdmin", query = "SELECT a FROM Administrator a WHERE a.idAdmin = :idAdmin"),
    @NamedQuery(name = "Administrator.findByUsernameAd", query = "SELECT a FROM Administrator a WHERE a.usernameAd = :usernameAd"),
    @NamedQuery(name = "Administrator.findByPasswordAd", query = "SELECT a FROM Administrator a WHERE a.passwordAd = :passwordAd"),
    @NamedQuery(name = "Administrator.findByIdPos", query = "SELECT a FROM Administrator a WHERE a.idPos = :idPos"),
    @NamedQuery(name = "Administrator.findByIdAcc", query = "SELECT a FROM Administrator a WHERE a.idAcc = :idAcc")})
public class Administrator implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_admin")
    private Integer idAdmin;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "username_ad")
    private String usernameAd;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "password_ad")
    private String passwordAd;
    @Column(name = "id_pos")
    private Integer idPos;
    @Size(max = 25)
    @Column(name = "id_acc")
    private String idAcc;
    @JoinColumn(name = "id_admin", referencedColumnName = "id_position", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private PositionStaff positionStaff;

    public Administrator() {
    }

    public Administrator(Integer idAdmin) {
        this.idAdmin = idAdmin;
    }

    public Administrator(Integer idAdmin, String usernameAd, String passwordAd) {
        this.idAdmin = idAdmin;
        this.usernameAd = usernameAd;
        this.passwordAd = passwordAd;
    }

    public Integer getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(Integer idAdmin) {
        this.idAdmin = idAdmin;
    }

    public String getUsernameAd() {
        return usernameAd;
    }

    public void setUsernameAd(String usernameAd) {
        this.usernameAd = usernameAd;
    }

    public String getPasswordAd() {
        return passwordAd;
    }

    public void setPasswordAd(String passwordAd) {
        this.passwordAd = passwordAd;
    }

    public Integer getIdPos() {
        return idPos;
    }

    public void setIdPos(Integer idPos) {
        this.idPos = idPos;
    }

    public String getIdAcc() {
        return idAcc;
    }

    public void setIdAcc(String idAcc) {
        this.idAcc = idAcc;
    }

    public PositionStaff getPositionStaff() {
        return positionStaff;
    }

    public void setPositionStaff(PositionStaff positionStaff) {
        this.positionStaff = positionStaff;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idAdmin != null ? idAdmin.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Administrator)) {
            return false;
        }
        Administrator other = (Administrator) object;
        if ((this.idAdmin == null && other.idAdmin != null) || (this.idAdmin != null && !this.idAdmin.equals(other.idAdmin))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.Administrator[ idAdmin=" + idAdmin + " ]";
    }
    
}
