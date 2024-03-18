package org.example.bt2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="CalculatorServlet", value="CalculatorServlet")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            double num1 = Double.parseDouble(req.getParameter("num1"));
            double num2 = Double.parseDouble(req.getParameter("num2"));
            String operation = req.getParameter("operation");
            double result = Calculator.calculator(num1, num2, operation);
            resp.getWriter().println("Result: " + result);
        } catch (NumberFormatException e) {
            resp.getWriter().println("Invalid input. Please enter valid numbers.");
        } catch (ArithmeticException e) {
            resp.getWriter().println("Error: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            resp.getWriter().println("Invalid operation. Please select a valid operation.");
        }
    }
}
