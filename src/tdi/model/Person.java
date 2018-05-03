/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tdi.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "M_PERSON")     
public class Person {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "AGE", length = 5)
    private Integer umur;
    
    @Column(name = "FIRST_NAME", length = 15)
    private String namaDepan;
    
    @Column(name = "LAST_NAME", length = 15)
    private String namaBelakang;
    
    //JOIN TABEL
    @OneToOne(fetch=FetchType.LAZY, cascade = CascadeType.ALL) //
    @JoinColumn(name = "ID_ALAMAT_FK")
    private Address alamat;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getUmur() {
        return umur;
    }

    public void setUmur(Integer umur) {
        this.umur = umur;
    }

    public String getNamaDepan() {
        return namaDepan;
    }

    public void setNamaDepan(String namaDepan) {
        this.namaDepan = namaDepan;
    }

    public String getNamaBelakang() {
        return namaBelakang;
    }

    public void setNamaBelakang(String namaBelakang) {
        this.namaBelakang = namaBelakang;
    }

    public Address getAlamat() {
        return alamat;
    }

    public void setAlamat(Address alamat) {
        this.alamat = alamat;
    }
    
    
    
}
