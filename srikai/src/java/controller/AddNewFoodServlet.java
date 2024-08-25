package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Food;

@WebServlet(name = "AddNewFoodServlet", urlPatterns = {"/AddNewFoodServlet"})
public class AddNewFoodServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve parameters
        String foodName = request.getParameter("foodName");
        String foodType = request.getParameter("foodType");
        String[] sweetLevels = request.getParameterValues("sweetLevel");
        String[] toppingsArray = request.getParameterValues("topping");
        String foodPriceStr = request.getParameter("foodPrice");

        // Validate input
        if (foodName == null || foodName.trim().isEmpty()
                || foodType == null || foodType.trim().isEmpty()
                || foodPriceStr == null || foodPriceStr.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please fill in all required fields.");
            request.getRequestDispatcher("/addNewFood.html").forward(request, response);
            return;
        }

        try {
            // Parse price
            int foodPrice = Integer.parseInt(foodPriceStr.trim());

            // Handle toppings based on the presence of "ไม่ใส่"
            String toppings;
            if (toppingsArray != null && java.util.Arrays.asList(toppingsArray).contains("ไม่ใส่")) {
                toppings = "ไม่ใส่"; // If "ไม่ใส่" is selected, we ignore other toppings
            } else {
                toppings = (toppingsArray != null) ? String.join(", ", toppingsArray) : "None";
            }

            // Convert sweetLevels to string
            String sweetLevel = (sweetLevels != null) ? String.join(", ", sweetLevels) : "None";

            // Create instance of Food
            Food food = new Food();
            food.setFoodName(foodName);
            food.setFoodType(foodType);
            food.setTopping(toppings);
            food.setSweetLevel(sweetLevel);
            food.setFoodPrice(foodPrice);

            // Insert into database
            DBConnection dbConnection = new DBConnection();
            if (!dbConnection.insertNewFood(food)) {
                request.setAttribute("errorMessage", "Failed to add food item.");
                request.getRequestDispatcher("/addNewFood.html").forward(request, response);
                return;
            }

            // Store Food object in session
            HttpSession session = request.getSession();
            session.setAttribute("food", food);

            // Forward to success page
            request.getRequestDispatcher("/addNewFoodSuccess.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid price format.");
            request.getRequestDispatcher("/addNewFood.html").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for adding new food items";
    }
}
