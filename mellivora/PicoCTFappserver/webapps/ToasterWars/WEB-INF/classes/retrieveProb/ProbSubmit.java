package retrieveProb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.concurrent.Exchanger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.CachedRowSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import database.TDBC;
import database.TDC;

/**
 * Servlet implementation class ProbSubmit
 */
@WebServlet("/ProbSubmit")
public class ProbSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProbSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TDBC.createConnectionPool(); 
		int PID = Integer.parseInt(request.getParameter("PID"));
		int UID = Integer.parseInt(request.getParameter("UID"));
		CachedRowSet CRS = TDC.ReadData("SELECT * from challenges WHERE PID =" + PID);
		int CID = 0;
		
		System.out.println(UID);
		System.out.println(CID);
		
		try {
			if(CRS.next()){
				CID = CRS.getInt("id");
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		
		CachedRowSet CS = TDC.ReadData("SELECT * from submissions WHERE challenge =" + CID + " AND user_id =" + UID);
		JSONObject JO = new JSONObject();
		try {
			if(CS.next()){
				System.out.println(CS.getBoolean("correct"));
				JO.put("correct",CS.getBoolean("correct"));
			}
		}catch (Exception e){
			e.printStackTrace();							
		}
		
		PrintWriter out = response.getWriter();
		    
		out.print( JO.toString());
		response.addHeader("Access-Control-Allow-Origin", "*");	
		out.flush();
			
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 TDBC.createConnectionPool();
		 String answer = request.getParameter("key");
		 String pid = request.getParameter("pid");
		 CachedRowSet CRS = TDC.ReadData("SELECT * from challenges WHERE PID = " + pid);
		 String challengeID = "";
		 String buto = "";
		 JSONObject JO = new JSONObject();
		 try {
			 if(CRS.next()){
				 buto = CRS.getString("flag");
				 challengeID = CRS.getString("id");
				 JO.put("status", "0");
				 JO.put("message", "WRONG BODOH!");
				 JO.put("points", "20");
			 }
			 
		 }catch (Exception e) {
				e.printStackTrace();
			}
		 if(answer.equals(buto)){
			 TDC.UpdateData("INSERT INTO `mellivora`.`submissions` (`added`, `challenge`, `user_id`, `flag`, `correct`, `marked`) VALUES (1418859197, '"+ challengeID  +"', 5, '"+ answer +"', 1, 1);");
		 }
		 else
			 TDC.UpdateData("INSERT INTO `mellivora`.`submissions` (`added`, `challenge`, `user_id`, `flag`, `correct`, `marked`) VALUES (1418859197, '"+ challengeID  +"', 5, '"+ answer +"', 0, 1);");
			
		 System.out.println(request.getParameter("key"));
	
			PrintWriter out = response.getWriter();	    
			response.addHeader("Access-Control-Allow-Origin", "*");	
			out.print(JO.toString());		
			out.flush();
	}

}
