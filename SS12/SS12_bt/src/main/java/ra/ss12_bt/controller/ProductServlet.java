package ra.ss12_bt.controller;

import ra.ss12_bt.model.Product;
import ra.ss12_bt.service.IProductService;
import ra.ss12_bt.service.ProductServiceIMPL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.OptionalInt;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String searchName = request.getParameter("searchName");
        RequestDispatcher dispatcher;
        if (searchName != null) {
            List<Product> products = productService.searchProductsByName(searchName);
            request.setAttribute("products", products);
            dispatcher = request.getRequestDispatcher("WEB-INF/product/search.jsp");
            dispatcher.forward(request, response);
        }
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditProduct(request, response);
                break;
            case "delete":
                showDelete(request, response);
                break;
            case "view":
                viewProduct(request, response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("searchName");
        List<Product> products = productService.searchProductsByName(searchName);
        RequestDispatcher dispatcher;
        if (products.isEmpty()) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("products", products);
            System.out.println(products);
            dispatcher = request.getRequestDispatcher("WEB-INF/product/search.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("WEB-INF/product/view.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("WEB-INF/product/delete.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void showEditProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("WEB-INF/product/edit.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/product/create.jsp");
        dispatcher.forward(request, response);
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = this.productService.findAll();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("WEB-INF/product/list.jsp");
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
                createProduct(request, response);
                break;
            case "edit":
                UpdateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                break;
        }
    }

    private void searchProductList(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String searchName = request.getParameter("search");
        List<Product> searchResults = productService.searchProductsByName(searchName);
        RequestDispatcher dispatcher;
        if (searchResults.isEmpty()) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            dispatcher = request.getRequestDispatcher("WEB-INF/product/search.jsp");
            dispatcher.forward(request, response);
        }
        response.sendRedirect("/products");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.productService.remove(id);
        }
        response.sendRedirect("/products");
    }

    private void UpdateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("productName");
        String catalog = request.getParameter("catalog");
        int stock = Integer.parseInt(request.getParameter("stock"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setProductName(productName);
            product.setCatalog(catalog);
            product.setStock(stock);
            this.productService.save(product);
            request.setAttribute("message", "Product information was updated");
            dispatcher = request.getRequestDispatcher("WEB-INF/product/edit.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String catalog = request.getParameter("catalog");
        int stock = Integer.parseInt(request.getParameter("stock"));
        OptionalInt maxId = this.productService.findAll().stream()
                .mapToInt(Product::getId).max();
        int id = maxId.orElse(0) + 1;
        Product product = new Product(id, productName, catalog, stock);
        this.productService.save(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/product/create.jsp");
        request.setAttribute("message", "New product was created");
        dispatcher.forward(request, response);
    }

}