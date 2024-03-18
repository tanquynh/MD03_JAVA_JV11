package ra.ss12_bt1.controller;

import java.io.*;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import ra.ss12_bt1.model.Product;
import ra.ss12_bt1.service.IProductService;
import ra.ss12_bt1.service.ProductServiceIMPL;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "sort":
                break;
            default:
                listProduct(request , response);
                break;
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = this.productService.findAll();
        request.setAttribute("products",products);
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("WEB-INF/product/list.jsp");
        try {
            dispatcher.forward(request,response);
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
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "sort":
                break;
            default:
                break;
        }
    }
}