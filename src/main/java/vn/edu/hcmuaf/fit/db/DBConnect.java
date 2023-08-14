package vn.edu.hcmuaf.fit.db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class DBConnect {
    private static DBConnect install;

    private final String DbUrl="jdbc:mysql://localhost:3306/shop_phone";
    private final String user ="root";
    private final String pass="";

    private final Connection connection;

    private DBConnect(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DbUrl,user,pass);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static DBConnect getInstall() {
        if(install==null) install= new DBConnect();
        return install;
    }

    public PreparedStatement get(String sql) throws SQLException {
        if(connection==null) throw new SQLException("DB do not connect");
        return connection.prepareStatement(sql);
    }

    public static void main(String[] args) {
        try {
            PreparedStatement statement =  DBConnect.getInstall().get("select username, password from users ");
            ResultSet rs=statement.executeQuery();
            rs.last();
            System.out.println(rs.getRow());
//            while (rs.next()) System.out.println(rs.getString(1));
//            System.out.println(rs.getRow());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
