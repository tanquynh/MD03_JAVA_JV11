package ra.th3_changemoney;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "convert Money", value = "/convert")
public class ConvertServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        float rate = Float.parseFloat(request.getParameter("rate"));
        float usd = Float.parseFloat(request.getParameter("usd"));
        float vnd = rate * usd;
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1> Rate " + rate + "</h1>");
        writer.println("<h1> Usd " + usd + "</h1>");
        writer.println("<h1> Vnd" + vnd + "</h1>");
        writer.println("</html>");
    }


}