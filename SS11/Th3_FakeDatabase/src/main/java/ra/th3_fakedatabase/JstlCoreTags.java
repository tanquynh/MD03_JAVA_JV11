package ra.th3_fakedatabase;

import model.Dept;
import ra.th3_fakedatabase.database.DBUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="JstlCoreTags", value ="/JstlCoreTags")
public class JstlCoreTags extends HelloServlet {
    private  static final long serialVersionUID = 1L;
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Dept> list = DBUtils.queryDepartments();
        request.setAttribute("departments", list);
        RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher("/WEB-INF/jsps/jstl_core_tags.jsp");
        dispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
