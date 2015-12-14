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
 * Servlet implementation class ProbSubmit2
 */
@WebServlet("/ProbSubmit2")
public class ProbSubmit2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProbSubmit2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TDBC.createConnectionPool();
		 String answer = request.getParameter("key");
		 String pid = request.getParameter("pid"); 
		 int UID = Integer.parseInt(request.getParameter("UID"));
		 CachedRowSet CRS = TDC.ReadData("SELECT * from challenges WHERE PID = " + pid);
		 int challengeID = 0;
		 String buto = "";
		 JSONObject JO = new JSONObject();
		 try {
			 if(CRS.next()){
				 buto = CRS.getString("flag");
				 challengeID = CRS.getInt("id");
				 
			 }
			 
		 }catch (Exception e) {
				e.printStackTrace();
			}
		 
		 CachedRowSet CE = TDC.ReadData("Select * from submissons WHERE challenge = " + challengeID + " AND user_id = " + UID + " AND correct = 1" );
		 
		 if(answer.equals(buto)){
			 
			 boolean solvedPrior = false;
		
				if (CE.size() == 0){ 
				 TDC.UpdateData("INSERT INTO `mellivora`.`submissions` (`added`, `challenge`, `user_id`, `flag`, `correct`, `marked`) VALUES (1418859197, '"+ challengeID   + "' , '" + UID + "' , '"+ answer +"', 1, 1);");	
						 JO.put("status", 1);
						 JO.put("message", "Correct");
						 JO.put("points", 20);
				}
				else
				{
					// do nth
					JO.put("status", 1);
					 JO.put("message", "Correct");
					 JO.put("points", 20);
				}
			
					 
					 
					 
		 }
		 else {
			 TDC.UpdateData("INSERT INTO `mellivora`.`submissions` (`added`, `challenge`, `user_id`, `flag`, `correct`, `marked`) VALUES (1418859197, '"+ challengeID  + "' , '" + UID + "' , '" + answer +"', 0, 1);");
              	 JO.put("status", 0);
					 JO.put("message", "Try again, the answer is incorrect");
					 JO.put("points", 20);
		 }
		 System.out.println(request.getParameter("key"));
	
			PrintWriter out = response.getWriter();	 
			response.addHeader("Access-Control-Allow-Origin", "*");	
			out.print(JO.toString());		
			out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
