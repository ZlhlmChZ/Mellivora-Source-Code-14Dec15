package database;


import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class TDBC {
	private static ComboPooledDataSource cpds;
	private static boolean connectionPoolCreated = false;

	public static void createConnectionPool(){
		
		if(connectionPoolCreated == false){
		cpds = new ComboPooledDataSource();
		try {
			cpds.setDriverClass( "com.mysql.jdbc.Driver" );
			cpds.setJdbcUrl("jdbc:mysql://localhost:3306/mellivora");
			cpds.setMinPoolSize(1);
			cpds.setMaxPoolSize(100);	
			cpds.setUser("mirandalawson");
			cpds.setPassword("mirandalawson");
			connectionPoolCreated = true;
			System.out.println("TDBC | Connection Pool successfully initialized.");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		} 
		
		} else{
			System.out.println("TDBC | Connection Pool already established.");
		}
		
		
	}
	
	public Connection getConnection(){	
		
		Connection tempCon = null;
		try {tempCon = cpds.getConnection();} catch (SQLException e) {e.printStackTrace();}
		return tempCon;

	}
}