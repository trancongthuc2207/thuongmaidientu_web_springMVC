/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.pojo;

import org.springframework.web.multipart.MultipartFile;

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
@Table(name = "customers")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customers.findAll", query = "SELECT c FROM Customers c"),
    @NamedQuery(name = "Customers.findByIdCustomer", query = "SELECT c FROM Customers c WHERE c.idCustomer = :idCustomer"),
    @NamedQuery(name = "Customers.findByNameC", query = "SELECT c FROM Customers c WHERE c.nameC = :nameC"),
    @NamedQuery(name = "Customers.findBySex", query = "SELECT c FROM Customers c WHERE c.sex = :sex"),
    @NamedQuery(name = "Customers.findBySerialNumberC", query = "SELECT c FROM Customers c WHERE c.serialNumberC = :serialNumberC"),
    @NamedQuery(name = "Customers.findByPhoneNumber", query = "SELECT c FROM Customers c WHERE c.phoneNumber = :phoneNumber"),
    @NamedQuery(name = "Customers.findByAddress", query = "SELECT c FROM Customers c WHERE c.address = :address"),
    @NamedQuery(name = "Customers.findByVipPos", query = "SELECT c FROM Customers c WHERE c.vipPos = :vipPos"),
    @NamedQuery(name = "Customers.findByIdAcc", query = "SELECT c FROM Customers c WHERE c.idAcc = :idAcc"),
    @NamedQuery(name = "Customers.findByImage", query = "SELECT c FROM Customers c WHERE c.image = :image")})
public class Customers implements Serializable {

    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 100)
    @Column(name = "email")
    private String email;

    @OneToMany(mappedBy = "idCus")
    private Set<Report> reportSet;
    @OneToMany(mappedBy = "idCusCmt")
    private Set<Comment> commentSet;
    @OneToMany(mappedBy = "customer")
    private Set<Orders> ordersSet;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "id_customer")
    private String idCustomer;
    @Size(max = 100)
    @Column(name = "name_c")
    private String nameC;
    @Size(max = 25)
    @Column(name = "sex")
    private String sex;
    @Size(max = 12)
    @Column(name = "serial_number_c")
    private String serialNumberC;
    @Size(max = 10)
    @Column(name = "phone_number")
    private String phoneNumber;
    @Size(max = 200)
    @Column(name = "address")
    private String address;
    @Column(name = "vip_pos")
    private Integer vipPos;
    @Column(name = "id_acc")
    private Integer idAcc;
    @Size(max = 200)
    @Column(name = "image")
    private String image;

    @Transient
    private MultipartFile file;

    public Customers() {
    }

    public Customers(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getNameC() {
        return nameC;
    }

    public void setNameC(String nameC) {
        this.nameC = nameC;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSerialNumberC() {
        return serialNumberC;
    }

    public void setSerialNumberC(String serialNumberC) {
        this.serialNumberC = serialNumberC;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getVipPos() {
        return vipPos;
    }

    public void setVipPos(Integer vipPos) {
        this.vipPos = vipPos;
    }

    public Integer getIdAcc() {
        return idAcc;
    }

    public void setIdAcc(Integer idAcc) {
        this.idAcc = idAcc;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCustomer != null ? idCustomer.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customers)) {
            return false;
        }
        Customers other = (Customers) object;
        if ((this.idCustomer == null && other.idCustomer != null) || (this.idCustomer != null && !this.idCustomer.equals(other.idCustomer))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tct.pojo.Customers[ idCustomer=" + idCustomer + " ]";
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @XmlTransient
    public Set<Report> getReportSet() {
        return reportSet;
    }

    public void setReportSet(Set<Report> reportSet) {
        this.reportSet = reportSet;
    }

    @XmlTransient
    public Set<Comment> getCommentSet() {
        return commentSet;
    }

    public void setCommentSet(Set<Comment> commentSet) {
        this.commentSet = commentSet;
    }

    @XmlTransient
    public Set<Orders> getOrdersSet() {
        return ordersSet;
    }

    public void setOrdersSet(Set<Orders> ordersSet) {
        this.ordersSet = ordersSet;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
