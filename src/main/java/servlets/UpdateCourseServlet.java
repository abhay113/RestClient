package servlets;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updatecourse")
public class UpdateCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int courseId = Integer.parseInt(request.getParameter("id"));
            String updatedName = request.getParameter("name");
            String updatedDuration = request.getParameter("duration");
            int updatedFees = Integer.parseInt(request.getParameter("fees"));

           
            JSONObject updateData = new JSONObject();
            updateData.put("cid", courseId);
            updateData.put("name", updatedName);
            updateData.put("duration", updatedDuration);
            updateData.put("fees", updatedFees);

            
            HttpResponse<JsonNode> apiResponse = Unirest.put("http://localhost:8085/courses")
                    .header("Content-Type", "application/json")
                    .body(updateData)
                    .asJson();

            int statusCode = apiResponse.getStatus();
            if (statusCode == 200) {
                
                response.sendRedirect("index.jsp");
                response.getWriter().println("updating course success : " + statusCode);
            } else {
              
                response.getWriter().println("Error updating course. Status code: " + statusCode);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
