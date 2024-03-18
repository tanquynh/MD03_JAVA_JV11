package ra.md03_th1_time_word;

import java.io.*;
import java.util.Date;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/time-word")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello Word";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Hello Word<h1>");
        writer.println("</html>");
        writer.println(("<html>"));
        Date today = new Date();
        writer.println("<h1>" + today + "</h1>");
        writer.println("</html>");
    }
}