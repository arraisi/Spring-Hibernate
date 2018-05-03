package main;

import java.util.List;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import tdi.HelloWorld;
import tdi.HelloWorldConfig;
import tdi.config.KonfigurasiApps;
import tdi.dao.DBTEST;
//import tdi.model.Address;
import tdi.model.Alamat;
import tdi.model.BungaFlat;
import tdi.model.Kecamatan;
import tdi.model.Person;
import tdi.model.Student;
import tdi.service.VolService;

public class MainApps {

    public static void main(String[] args) {
        AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
        //ctx.register(HelloWorldConfig.class);
        ctx.register(KonfigurasiApps.class);
        ctx.refresh();

        /* HelloWorld hw =  ctx.getBean(HelloWorld.class);
		 hw.setMessage("dddddddddddddddd ");
		 hw.getMessage();
        VolService vol = ctx.getBean(VolService.class);
        System.out.println(vol.hitungLuasTinggi(10, 12, 20));
         */
//untuk membuat list yang isinya data yang dipanggil dari DBTEST
//
//
        DBTEST dbtest = ctx.getBean(DBTEST.class);
//HIBERNATE        
//
//
        BungaFlat bungaFlat = new BungaFlat();
        bungaFlat.setFirstName("INI");
        bungaFlat.setLastName("DARI");
        bungaFlat.setShipAddress("HIBERNATE");
        //dbtest.simpanHibernate(bungaFlat);
//TAMPILKAN HASIL HIBERNATE        
//
//
        List<BungaFlat> listMap = dbtest.findAllHibernate();
        for (BungaFlat map : listMap) {
            System.out.println(map.toString());
        }

//SIMPAN HIBERNATE MAP
//
//
        /*
    Address alamat = new Address();
    alamat.setJalan("Jatinangor");
    alamat.setKota("SUMEDANG");
    alamat.setKodePos("50351");
    
    Person person = new Person();
    person.setAlamat(alamat);
    person.setNamaDepan("Abdul");
    person.setNamaBelakang("Arraisi");
    person.setUmur(21);
    dbtest.simpanHibernate(person);*/
//INSERT HIBERNATE STUDENT
//
///
/*
        Kecamatan kecamatan = new Kecamatan();
        kecamatan.setKecamatan("Cililin");

        Alamat alamat = new Alamat();
        alamat.setKecamatan(kecamatan);
        alamat.setAlamatStudent("Rancapanggung");

        Student student = new Student();
        student.setNamaStudent("Yuda");
        student.setAlamat(alamat);
        
        dbtest.simpanHibernate(student);
         */
//UPDATE HIBERNATE STUDENT
//
///      
        Alamat alamat = dbtest.findByIdAlamat(6);
        alamat.setAlamatStudent("Sumedang");
        dbtest.simpanHibernateAlamat(alamat);

        Kecamatan kecamatan = dbtest.findByIdKecamatan(5);
        kecamatan.setKecamatan("Jatinangor");
        dbtest.simpanHibernateKecamatan(kecamatan);

        Student student = dbtest.findByIdStudent(8);
        student.setNamaStudent("yudhi");
        dbtest.simpanHibernate(student);

//DELETE HIBERNATE STUDENT
//
///     
/*
        Student student = new Student();
        student.setId(3);
        Alamat alamat = new Alamat();
        alamat.setId(2);
        Kecamatan kecamatan = new Kecamatan();
        kecamatan.setId(2);
        dbtest.deleteHibernate(student);
         */
//MENAMPILKAN HASIL QUERY
//
//
/*        List<BungaFlat> listCustomer = dbtest.findAll();
        for (BungaFlat bungaFlat : listCustomer) {
            System.out.println(bungaFlat.getId() + " " + bungaFlat.getFirstName()
                    + " " + bungaFlat.getLastName() + " " + bungaFlat.getShipAddress());
        }

//MENAMPILKAN HASIL DARI queryForObject
//
//
        System.out.println(dbtest.findById(4).toString());
        System.out.println(dbtest.findById(5).toString());
        System.out.println(dbtest.findById(6).toString());
        
        //System.out.println(dbtest.simpan("Dhio", "A", "Jakarta").intValue());
        
        BungaFlat bungaFlat = dbtest.findById(9);
        bungaFlat.setFirstName("my saroh");
        bungaFlat.setLastName("unch");
        bungaFlat.setShipAddress("tasik");
        System.out.println(dbtest.simpanUpdate(bungaFlat));*/
    }

}
