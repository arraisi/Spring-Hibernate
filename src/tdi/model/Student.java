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
@Table(name = "STUDENT")    
public class Student {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    
    @Column(name = "NAMA", length = 50)
    private String namaStudent;
      
    //JOIN TABEL
    @OneToOne(fetch=FetchType.LAZY, cascade = CascadeType.ALL) //
    @JoinColumn(name = "ID_ALAMAT_FK")
    private Alamat alamat;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNamaStudent() {
        return namaStudent;
    }

    public void setNamaStudent(String namaStudent) {
        this.namaStudent = namaStudent;
    }

    public Alamat getAlamat() {
        return alamat;
    }

    public void setAlamat(Alamat alamat) {
        this.alamat = alamat;
    }
    
    
}
