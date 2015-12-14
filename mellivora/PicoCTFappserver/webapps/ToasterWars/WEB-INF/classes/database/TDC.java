package database;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.rowset.CachedRowSet;

import com.sun.rowset.CachedRowSetImpl;

public class TDC {
	
	public static void UpdateData(String query){
		
		try{
	      TDBC DC = new TDBC();
		  Connection conn = DC.getConnection();
		  Statement stmt = conn.createStatement() ;		  
		  stmt.executeUpdate(query);  
		  stmt.close() ;
	      conn.close() ;
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static CachedRowSet ReadData(String query){
		CachedRowSet CRS = null;
		/*query = query.replaceAll("'", "\\\\'");*/
		try{
			CRS = new CachedRowSetImpl();
			try { 
			    Connection conn = null;
			    Statement stmt = null;
			    ResultSet rs = null; 

			    try {
			    	TDBC CL = new TDBC();
			        conn = CL.getConnection();
			        
			        stmt = conn.createStatement(); 
			        rs = stmt.executeQuery(query); 
                    CRS.populate(rs);
			    } catch (Exception e) { 
			        System.err.println("Got an exception! "); 
			        e.printStackTrace();
			    } finally {
			        if (rs != null) { 
			            rs.close();
			        }

			        if (stmt != null) {
			            stmt.close();
			        }

			        if (conn != null) {
			            conn.close();
			        }
			    }
			} catch (Exception e) {
			    System.err.println("Got an exception! "); 
			    e.printStackTrace();
			}
			
			return CRS;
		} catch(Exception e){
			e.printStackTrace();
		}
		return CRS;	
	}
}