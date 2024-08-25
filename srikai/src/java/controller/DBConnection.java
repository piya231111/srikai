package controller;


import java.sql.*;
import model.Food;

public class DBConnection {

    public boolean insertNewFood(Food food) {
        boolean result = false;
        String url = "jdbc:mysql://localhost:3306/srikai";
        String user = "root";
        String password = "Ploy@231046";

        String query = "INSERT INTO food (name, type, topping, sweetlevel, price) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            Class.forName("com.mysql.cj.jdbc.Driver");

            preparedStatement.setString(1, food.getFoodName());
            preparedStatement.setString(2, food.getFoodType());
            preparedStatement.setString(3, food.getTopping());
            preparedStatement.setString(4, food.getSweetLevel());
            preparedStatement.setDouble(5, food.getFoodPrice());

            int rowsAffected = preparedStatement.executeUpdate();
            result = rowsAffected > 0;

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return result;
    }

    public void testRetrieve() {
        String url = "jdbc:mysql://localhost:3306/srikai";
        String user = "root";
        String password = "Ploy@231046";

        String query = "SELECT * FROM food";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            Class.forName("com.mysql.cj.jdbc.Driver");

            while (resultSet.next()) {
                String name = resultSet.getString("name").trim();
                String type = resultSet.getString("type").trim();
                String topping = resultSet.getString("topping").trim();
                String sweetLevel = resultSet.getString("sweetlevel").trim();
                double price = resultSet.getDouble("price");

                System.out.println("Food: " + name + ", Type: " + type + ", Topping: " + topping + ", Sweet Level: " + sweetLevel + ", Price: " + price);
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public Food getFood(String name) {
        Food food = new Food();
        String url = "jdbc:mysql://localhost:3306/srikai";
        String user = "root";
        String password = "Ploy@231046";

        String query = "SELECT * FROM food WHERE name = ?";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            Class.forName("com.mysql.cj.jdbc.Driver");

            preparedStatement.setString(1, name);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    food.setFoodName(resultSet.getString("name").trim());
                    food.setFoodType(resultSet.getString("type").trim());
                    food.setTopping(resultSet.getString("topping").trim());
                    food.setSweetLevel(resultSet.getString("sweetlevel").trim());
                    food.setFoodPrice(resultSet.getDouble("price"));
                } else {
                    System.out.println("No food found with name: " + name);
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return food;
    }
}
