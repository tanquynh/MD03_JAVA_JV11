package ra.th3_fakedatabase;

import model.Dept;
import ra.th3_fakedatabase.database.DBUtils;

import java.io.*;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Dept> list = DBUtils.queryDepartments();
        request.setAttribute("departments", list);
        RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher("/WEB-INF/jsps/jstl_example.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}