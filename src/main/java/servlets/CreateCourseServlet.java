package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;

@WebServlet("/createc")
 public class CreateCourseServlet extends HttpServlet {
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	
	    	int cid = Integer.parseInt(request.getParameter("id"));
	        String name = request.getParameter("name");
	        String duration = request.getParameter("duration");
	        int fees = Integer.parseInt(request.getParameter("fees")); 

	        JSONObject newCourse = new JSONObject();
	        newCourse.put("cid", cid);
	        newCourse.put("name", name);
	        newCourse.put("duration", duration);
	        newCourse.put("fees", fees);

	        try {
	            HttpResponse<JsonNode> apiResponse = Unirest.post("http://localhost:8085/courses")
	                    .header("Content-Type", "application/json")
	                    .body(newCourse)
	                    .asJson();

	        } catch (Exception e) {
	            e.printStackTrace();
	   
	        }
	        finally{
	        	response.sendRedirect("/restc");
	        }
	    }
	}
