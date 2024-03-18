package ra.th4_dictionnary;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(value = "/translate")
public class TranslationServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
       Map<String,String> dictionnary = new HashMap<>();
       dictionnary.put("hello", "Xin chao");
       dictionnary.put("how", "The nao");
       dictionnary.put("book","Quyen vo");
       dictionnary.put("computer","May tinh");
       String search = request.getParameter("txtSearch");
       PrintWriter writer = response.getWriter();
       writer.println("<html>");
       String result = dictionnary.get(search);
       if(result != null) {
           writer.println("word " + search);
           writer.println("Result " + result);

       } else {
           writer.println("Not found");
       }
       writer.println("</html>");
    }


}