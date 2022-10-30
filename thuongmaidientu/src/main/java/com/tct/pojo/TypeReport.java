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
@Table(name = "type_report")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TypeReport.findAll", query = "SELECT t FROM TypeReport t"),
    @NamedQuery(name = "TypeReport.findByIdTypeRp", query = "SELECT t FROM TypeReport t WHERE t.idTypeRp = :idTypeRp"),
    @NamedQuery(name = "TypeReport.findByNameRp", query = "SELECT t FROM TypeReport t WHERE t.nameRp = :nameRp"),
    @NamedQuery(name = "TypeReport.findByPos", query = "SELECT t FROM TypeReport t WHERE t.pos = :pos")})
public class TypeReport implements Serializable {

    @OneToMany(mappedBy = "idTypeReport")
    private Set<Report> reportSet;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_type_rp")
    private Integer idTypeRp;
    @Size(max = 100)
    @Column(name = "name_rp")
    private String nameRp;
    @Size(max = 45)
    @Column(name = "pos")
    private String pos;

    public TypeReport() {
    }

    public TypeReport(Integer idTypeRp) {
        this.idTypeRp = idTypeRp;
    }

    public Integer getIdTypeRp() {
        return idTypeRp;
    }

    public void setIdTypeRp(Integer idTypeRp) {
        this.idTypeRp = idTypeRp;
    }

    public String getNameRp() {
        return nameRp;
    }

    public void setNameRp(String nameRp) {
        this.nameRp = nameRp;
    }

    public String getPos() {
        return pos;
    }

    public void setPos(String pos) {
        this.pos = pos;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTypeRp != null ? idTypeRp.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TypeReport)) {
            return false;
        }
        TypeReport other = (TypeReport) object;
        if ((this.idTypeRp == null && other.idTypeRp != null) || (this.idTypeRp != null && !this.idTypeRp.equals(other.idTypeRp))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.TypeReport[ idTypeRp=" + idTypeRp + " ]";
    }

    @XmlTransient
    public Set<Report> getReportSet() {
        return reportSet;
    }

    public void setReportSet(Set<Report> reportSet) {
        this.reportSet = reportSet;
    }
    
}
