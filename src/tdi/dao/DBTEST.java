/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tdi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import tdi.model.BungaFlat;

/**
 *
 * @author arrai
 */
@Repository //MENANDAKAN CLASS YANG AKAN DIGUNAKAN
public class DBTEST {
    @Autowired //MENCARI JBDCTEMPLATE
    JdbcTemplate jdbcTemplate;
    
    @Autowired //MENCARI JBDCTEMPLATE
    NamedParameterJdbcTemplate nameJdbcTemplate;
    
    @Autowired
    private SessionFactory sessionFactory;
    
//HIBERNATE
    public List<BungaFlat> findAllHibernate(){
        Query query = sessionFactory.getCurrentSession().createQuery("from BungaFlat");
        return query.list();
    }
    
    @Transactional(readOnly =false)
    public void simpanHibernate(BungaFlat bungaFlat){
        sessionFactory.getCurrentSession().saveOrUpdate(bungaFlat);
    }
    public BungaFlat findByIdHibernate(int id, String FirstName){
        Query query = sessionFactory.getCurrentSession().createQuery("from BungaFlat b WHERE b.id = :id");
        return (BungaFlat) query.list().get(0);
    }
//======================================================================================================================    
    
    //MENGAMBIL DATA DARI DATABASE LALU DI TAMPUNG DI VARIABLE YANG ADA DI CLASS BUNGAFLAT
    public List < BungaFlat > findAll(){
        List < BungaFlat > listCustomer = jdbcTemplate.query("SELECT CustomerID as id, FirstName, LastName, ShipAddress FROM Customers", 
                new BeanPropertyRowMapper(BungaFlat.class));
        return listCustomer;
    }
    
    public BungaFlat findById(int id){
        return (BungaFlat) jdbcTemplate
                .queryForObject("SELECT CustomerID as id, FirstName, LastName, ShipAddress FROM Customers "
                        + "WHERE CustomerID = ?" , new Integer[] {id}, new BeanPropertyRowMapper(BungaFlat.class));
    }   
    
//CARA INSERT DATA KE DATA BASE
    public Number /*void*/ simpan(String nama1, String nama2, String Address){
        String sql= "INSERT INTO Customers (FirstName, LastName, ShipAddress) VALUES (:name1, :name2, :Address)";
                MapSqlParameterSource paramMap = new MapSqlParameterSource();
                
                paramMap.addValue("name1", nama1);
                paramMap.addValue("name2", nama2);
                paramMap.addValue("Address", nama2);
                KeyHolder keyHolder = new GeneratedKeyHolder();
                nameJdbcTemplate.update(sql, paramMap, keyHolder);
                return keyHolder.getKey();
    }
//CARA UPDATE
    public int simpanUpdate(BungaFlat bungaFlat){
        String sql = "Update Customers SET FirstName = :nama1, LastName = :nama2 WHERE CustomerID = :id ";
        Map<String, Object> paramMap = new HashMap <String, Object>();
        paramMap.put("nama1", bungaFlat.getFirstName());
        paramMap.put("nama2", bungaFlat.getLastName());
        paramMap.put("id", bungaFlat.getId());
        return nameJdbcTemplate.update(sql, paramMap);
    }
}
