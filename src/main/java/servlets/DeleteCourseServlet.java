package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;


@WebServlet("/delete/*")
 public class DeleteCourseServlet extends HttpServlet {
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String pathInfo = request.getPathInfo();
	        if (pathInfo != null) {
	            String courseId = pathInfo.substring(1);
	            
	            try {
	                HttpResponse<JsonNode> apiResponse = Unirest.delete("http://localhost:8085/courses/" + courseId)
	                        .asJson();
	          
	            } catch (Exception e) {
	                e.printStackTrace();
	            
	            }
	            finally{
		        	response.sendRedirect("/restc");
		        }
	        }
	    }
	}
