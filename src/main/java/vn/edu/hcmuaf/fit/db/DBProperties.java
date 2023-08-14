package vn.edu.hcmuaf.fit.db;

import java.io.IOException;
import java.util.Properties;

public class  DBProperties {
    private static final Properties db = new Properties();
    static {
        try {
            db.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    public static String getDBHost(){
        return  db.get("db.host").toString();
    }
    public static String getDBPort(){
        return  db.get("db.port").toString();
    }
    public static String getDBUsername(){
        return  db.get("db.username").toString();
    }
    public static String getDBPassword(){
        return  db.get("db.password").toString();
    }
    public static String getDBDatabaseName(){
        return  db.get("db.databaseName").toString();
    }
}
