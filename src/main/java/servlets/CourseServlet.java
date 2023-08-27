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


@WebServlet("/courses")
public class CourseServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpResponse<JsonNode> apiResponse = Unirest.get("http://localhost:8085/courses")
                    .header("accept", "application/json")
                    .asJson();

            JsonNode responseBody = apiResponse.getBody();
            request.setAttribute("courses", responseBody); 
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
