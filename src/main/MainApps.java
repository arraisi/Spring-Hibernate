package main;

import java.util.List;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import tdi.HelloWorld;
import tdi.HelloWorldConfig;
import tdi.config.KonfigurasiApps;
import tdi.dao.DBTEST;
import tdi.model.BungaFlat;
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
//INSERT HIBERNATE        
//
//
        BungaFlat bungaFlat = new BungaFlat();
        bungaFlat.setFirstName("INI");
        bungaFlat.setLastName("DARI");
        bungaFlat.setLastName("HIBERNATE");
        dbtest.simpanHibernate(bungaFlat);
//SELECT HIBERNATE        
//
//
        List<BungaFlat> listMap = dbtest.findAllHibernate();
        for (BungaFlat map : listMap) {
            System.out.println(map.toString());
        }

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
