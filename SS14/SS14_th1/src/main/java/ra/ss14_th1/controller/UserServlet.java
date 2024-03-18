package ra.ss14_th1.controller;

import ra.ss14_th1.Model.User;
import ra.ss14_th1.service.IUserService;
import ra.ss14_th1.service.UserServiceIMPL;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService;

    public void init() {
        userService = new UserServiceIMPL();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertUser(req, resp);
                break;
            case "edit":
                updateUser(req, resp);
                break;
        }
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void insertUser(HttpServletRequest req, HttpServletResponse resp) {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                listUser(request, response);
                break;
        }

    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = userService.selectAllUsers();
        request.setAttribute("users", users);
        try {
            request.getRequestDispatcher("user/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }


}