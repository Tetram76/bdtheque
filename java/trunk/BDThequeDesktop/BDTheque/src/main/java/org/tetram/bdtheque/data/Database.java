package org.tetram.bdtheque.data;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by Thierry on 24/05/2014.
 */
public class Database {

    private static Database ourInstance = null;
    private final SqlSessionFactory sqlSessionFactory;

    private Database() {
        super();

        setFBLogged(true);

        String resource = "org/tetram/bdtheque/data/mybatis-config.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }

    public static Database getInstance() {
        if (ourInstance == null)
            ourInstance = new Database();
        return ourInstance;
    }

    static public boolean isFBLogged() {
        return Boolean.getBoolean("FBLog4j");
    }

    static public void setFBLogged(boolean value) {
        if (isFBLogged() != value)
            System.setProperty("FBLog4j", String.valueOf(value));
    }

    public SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }

    public SqlSession openSession() {
        return sqlSessionFactory.openSession();
    }
}