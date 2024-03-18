package ra.ss12_th1.controller;

import ra.ss12_th1.model.Customer;
import ra.ss12_th1.service.CustomerServiceIMPL;
import ra.ss12_th1.service.ICustomerService;

import java.io.*;
import java.util.List;
import java.util.OptionalInt;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerServiceIMPL();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "delete":
                showDelete(request, response);
                break;
            case "view" :
                viewCustomer(request,response);

            default:
                listCustomer(request, response);
                break;
        }
    }
private void viewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        request.setAttribute("customer" , customer);
        dispatcher = request.getRequestDispatcher("WEB-INF/customer/view.jsp");
        dispatcher.forward(request,response);
}
    private void showDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("WEB-INF/customer/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("WEB-INF/customer/edit.jsp");
        }
        dispatcher.forward(request, response);


    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.customerService.delete(id);
        }
        response.sendRedirect("/customers");

    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            customer.setName(name);
            customer.setAddress(address);
            customer.setEmail(email);
            this.customerService.update(id, customer);
            request.setAttribute("customer", customer);
            request.setAttribute("message", "Customer information was updated");
            dispatcher = request.getRequestDispatcher("WEB-INF/customer/edit.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        OptionalInt maxId = customerService.findAll().stream()
                .mapToInt(Customer::getId)
                .max();
        int id = maxId.orElse(0) + 1;
        Customer customer = new Customer(id, name, email, address);
        this.customerService.save(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/customer/create.jsp");
        request.setAttribute("message", "New customer was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> list = customerService.findAll();
        request.setAttribute("customers", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}