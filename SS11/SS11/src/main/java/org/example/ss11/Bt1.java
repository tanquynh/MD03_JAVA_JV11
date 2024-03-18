package org.example.ss11;

import model.Employees;
import org.example.ss11.database.DBUtils;

import java.io.*;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "Bt1", value = "/Bt1")
public class Bt1 extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employees> list = DBUtils.queryEmployees();
        request.setAttribute("employees",list);
        RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher("/WEB-INF/bt1.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


}