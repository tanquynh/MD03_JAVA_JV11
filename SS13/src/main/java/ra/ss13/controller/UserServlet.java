package ra.ss13.controller;

import ra.ss13.model.User;
import ra.ss13.service.IUserService;
import ra.ss13.service.UserServiceIMPL;

import java.io.*;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersion = 1L;
    private IUserService userService;

    public void init() {
        userService = new UserServiceIMPL();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                try {
                    deleteUserById(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        request.setAttribute("user", user);
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);

    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listUser = userService.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                try {
                    insertUser(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "edit":
                try {
                    editUser(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete":
                break;
        }
    }

    private void deleteUserById(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.deleteUser(id);
        List<User> listUser = userService.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        userService.updateUser(user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        userService.insertUser(user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
    }

}