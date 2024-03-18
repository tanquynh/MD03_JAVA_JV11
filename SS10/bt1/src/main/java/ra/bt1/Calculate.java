package ra.bt1;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "discount", value = "/discount")
public class Calculate extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        float price = Float.parseFloat(request.getParameter("price"));
        float discount = Float.parseFloat(request.getParameter("discount_percent"));
        double discount_price = price * discount * 0.01;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Discount Amount" + discount_price + "</h1>");
        writer.println("<h1>Discount Price" + (price - discount_price) + "</h1>");
        writer.println("</html>");
    }

}