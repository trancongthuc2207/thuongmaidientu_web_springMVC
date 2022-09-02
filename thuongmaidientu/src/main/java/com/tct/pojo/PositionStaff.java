/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
@Table(name = "position_staff")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PositionStaff.findAll", query = "SELECT p FROM PositionStaff p"),
    @NamedQuery(name = "PositionStaff.findByIdPosition", query = "SELECT p FROM PositionStaff p WHERE p.idPosition = :idPosition"),
    @NamedQuery(name = "PositionStaff.findByNamePosition", query = "SELECT p FROM PositionStaff p WHERE p.namePosition = :namePosition"),
    @NamedQuery(name = "PositionStaff.findByDescriptions", query = "SELECT p FROM PositionStaff p WHERE p.descriptions = :descriptions")})
public class PositionStaff implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_position")
    private Integer idPosition;
    @Size(max = 50)
    @Column(name = "name_position")
    private String namePosition;
    @Size(max = 200)
    @Column(name = "descriptions")
    private String descriptions;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "positionStaff")
    private Administrator administrator;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPos")
    private Set<Account> accountSet;

    public PositionStaff() {
    }

    public PositionStaff(Integer idPosition) {
        this.idPosition = idPosition;
    }

    public Integer getIdPosition() {
        return idPosition;
    }

    public void setIdPosition(Integer idPosition) {
        this.idPosition = idPosition;
    }

    public String getNamePosition() {
        return namePosition;
    }

    public void setNamePosition(String namePosition) {
        this.namePosition = namePosition;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public Administrator getAdministrator() {
        return administrator;
    }

    public void setAdministrator(Administrator administrator) {
        this.administrator = administrator;
    }

    @XmlTransient
    public Set<Account> getAccountSet() {
        return accountSet;
    }

    public void setAccountSet(Set<Account> accountSet) {
        this.accountSet = accountSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPosition != null ? idPosition.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PositionStaff)) {
            return false;
        }
        PositionStaff other = (PositionStaff) object;
        if ((this.idPosition == null && other.idPosition != null) || (this.idPosition != null && !this.idPosition.equals(other.idPosition))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.PositionStaff[ idPosition=" + idPosition + " ]";
    }
    
}
