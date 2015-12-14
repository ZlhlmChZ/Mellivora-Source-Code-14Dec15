package retrieveProb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.CachedRowSet;

import org.json.simple.JSONObject;

import database.TDBC;
import database.TDC;
/**
 * Servlet implementation class ProbRetreive
 */
@WebServlet(description = "To retrieve problems", urlPatterns = { "/ProbRetreive" })
public class ProbRetreive extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProbRetreive() { 
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		TDBC.createConnectionPool();
		int PID = Integer.parseInt(request.getParameter("PID"));
		CachedRowSet CRS = TDC.ReadData("SELECT * from challenges WHERE PID =" + PID);
		JSONObject JO = new JSONObject();
		try {
			while(CRS.next()){
				System.out.println(CRS.getString("description"));
				 JO.put("displayname", CRS.getString("title"));
			        JO.put("hint", CRS.getString("hint"));
			        JO.put("pid", CRS.getInt("pid"));
			        JO.put("basescore", CRS.getInt("points"));
			        JO.put("correct", false);
			        JO.put("desc", CRS.getString("description"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	 
		
       
	    
	
	    PrintWriter out = response.getWriter();
		response.addHeader("Access-Control-Allow-Origin", "*");	
		out.print( JO.toString());
		
		out.flush();
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
