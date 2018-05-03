package tdi.config;

import java.util.Properties;
import javax.sql.DataSource;
import org.hibernate.cfg.Environment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import tdi.model.BungaFlat;

@Configuration
@ComponentScan(basePackages = { "tdi.service","tdi.dao" })
@EnableTransactionManagement
public class KonfigurasiApps {

    //@Autowired
    //private Environment env;
    
//HIBERNATE
    @Bean
    public LocalSessionFactoryBean getSessionFactoryBean(){
        LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
        factoryBean.setDataSource(dataSource());
                
                Properties props = new Properties();
                props.put("hibernate.show_sql", true);
                props.put("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
                props.put("hibernate.hbm2ddl.auto", "create");
                
                factoryBean.setHibernateProperties(props);
                factoryBean.setAnnotatedClasses(BungaFlat.class);
                return factoryBean;
    }
    
    @Bean 
    public HibernateTransactionManager getHibernateTransactionManager(){
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        transactionManager.setSessionFactory(getSessionFactoryBean().getObject());
        return transactionManager;
    }   
    
    
//SPRING JDBC
    @Bean
    public DataSource dataSource(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        dataSource.setUsername("sa");
        dataSource.setUrl("jdbc:sqlserver://localhost;databaseName=DBTEST;instanceName=SQLEXPRESS2017");
        dataSource.setPassword("16agustus1994");
        return dataSource;
        
    }

    @Bean
    public JdbcTemplate jdbcTemplate(){
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource());
        jdbcTemplate.setResultsMapCaseInsensitive(true);
        return jdbcTemplate;
    }
    
    @Bean
    public NamedParameterJdbcTemplate nameJdbcTemplate(){
        NamedParameterJdbcTemplate nameJdbcTemplate = new NamedParameterJdbcTemplate(dataSource());
        //NamedParameterJdbcTemplate.setResultsMapCaseInsensitive(true);
        return nameJdbcTemplate;
    }
    
}
