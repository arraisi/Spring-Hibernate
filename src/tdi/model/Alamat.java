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
@Table(name = "ALAMAT")   
public class Alamat {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "ALAMAT", length = 50)
    private String alamatStudent;
    
    @OneToOne(fetch=FetchType.LAZY, cascade = CascadeType.ALL) //
    @JoinColumn(name = "ID_KECAMATAN_FK")
    private Kecamatan kecamatan;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAlamatStudent() {
        return alamatStudent;
    }

    public void setAlamatStudent(String alamatStudent) {
        this.alamatStudent = alamatStudent;
    }

    public Kecamatan getKecamatan() {
        return kecamatan;
    }

    public void setKecamatan(Kecamatan kecamatan) {
        this.kecamatan = kecamatan;
    }
    
    

}
