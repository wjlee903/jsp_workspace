package com.example.demo1.utlls;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnUtils {
    public static Connection getConnection() {
        try {
            String dbURL = "jdbc:mariadb://localhost:3306/practice01";
            String dbID = "practice01";
            String dbPW = "practice01";
            Class.forName("org.mariadb.jdbc.Driver");
            return DriverManager.getConnection(dbURL, dbID, dbPW);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
