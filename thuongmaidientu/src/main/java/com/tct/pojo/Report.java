/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "report")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Report.findAll", query = "SELECT r FROM Report r"),
    @NamedQuery(name = "Report.findByIdRp", query = "SELECT r FROM Report r WHERE r.idRp = :idRp"),
    @NamedQuery(name = "Report.findByDescriptionRp", query = "SELECT r FROM Report r WHERE r.descriptionRp = :descriptionRp"),
    @NamedQuery(name = "Report.findByStt", query = "SELECT r FROM Report r WHERE r.stt = :stt"),
    @NamedQuery(name = "Report.findByDateRp", query = "SELECT r FROM Report r WHERE r.dateRp = :dateRp"),
    @NamedQuery(name = "Report.findByDateSolve", query = "SELECT r FROM Report r WHERE r.dateSolve = :dateSolve"),
    @NamedQuery(name = "Report.findByIdEmplSolve", query = "SELECT r FROM Report r WHERE r.idEmplSolve = :idEmplSolve")})
public class Report implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_rp")
    private Integer idRp;
    @Size(max = 200)
    @Column(name = "description_rp")
    private String descriptionRp;
    @Size(max = 45)
    @Column(name = "stt")
    private String stt;
    @Column(name = "date_rp")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateRp;
    @Column(name = "date_solve")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateSolve;
    @Size(max = 45)
    @Column(name = "id_empl_solve")
    private String idEmplSolve;
    @JoinColumn(name = "id_cus", referencedColumnName = "id_customer")
    @ManyToOne
    private Customers idCus;
    @JoinColumn(name = "id_product", referencedColumnName = "id_product")
    @ManyToOne
    private Product idProduct;
    @JoinColumn(name = "id_shop_store", referencedColumnName = "id_shop_store")
    @ManyToOne
    private ShopStore idShopStore;
    @JoinColumn(name = "id_type_report", referencedColumnName = "id_type_rp")
    @ManyToOne
    private TypeReport idTypeReport;

    public Report() {
    }

    public Report(Integer idRp) {
        this.idRp = idRp;
    }

    public Integer getIdRp() {
        return idRp;
    }

    public void setIdRp(Integer idRp) {
        this.idRp = idRp;
    }

    public String getDescriptionRp() {
        return descriptionRp;
    }

    public void setDescriptionRp(String descriptionRp) {
        this.descriptionRp = descriptionRp;
    }

    public String getStt() {
        return stt;
    }

    public void setStt(String stt) {
        this.stt = stt;
    }

    public Date getDateRp() {
        return dateRp;
    }

    public void setDateRp(Date dateRp) {
        this.dateRp = dateRp;
    }

    public Date getDateSolve() {
        return dateSolve;
    }

    public void setDateSolve(Date dateSolve) {
        this.dateSolve = dateSolve;
    }

    public String getIdEmplSolve() {
        return idEmplSolve;
    }

    public void setIdEmplSolve(String idEmplSolve) {
        this.idEmplSolve = idEmplSolve;
    }

    public Customers getIdCus() {
        return idCus;
    }

    public void setIdCus(Customers idCus) {
        this.idCus = idCus;
    }

    public Product getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Product idProduct) {
        this.idProduct = idProduct;
    }

    public ShopStore getIdShopStore() {
        return idShopStore;
    }

    public void setIdShopStore(ShopStore idShopStore) {
        this.idShopStore = idShopStore;
    }

    public TypeReport getIdTypeReport() {
        return idTypeReport;
    }

    public void setIdTypeReport(TypeReport idTypeReport) {
        this.idTypeReport = idTypeReport;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idRp != null ? idRp.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Report)) {
            return false;
        }
        Report other = (Report) object;
        if ((this.idRp == null && other.idRp != null) || (this.idRp != null && !this.idRp.equals(other.idRp))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.Report[ idRp=" + idRp + " ]";
    }
    
}
