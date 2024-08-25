package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestSQLSelect {

    public static void main(String[] args) {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/srikai",
                    "root", "Ploy@231046");

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(
                    "SELECT * FROM food WHERE name='ชากุหลาบ'");
            String foodName, foodType, topping, sweetLevel;
            double foodPrice;

            while (resultSet.next()) {
                foodName = resultSet.getString("name");
                foodType = resultSet.getString("type").trim();
                topping = resultSet.getString("topping").trim();
                sweetLevel = resultSet.getString("sweetlevel").trim();
                foodPrice = resultSet.getDouble("price");

                System.out.println("Name: " + foodName
                        + ", Type: " + foodType
                        + ", Topping: " + topping
                        + ", Sweetlevel: " + sweetLevel
                        + ", Price: " + foodPrice);
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException exception) {
            System.out.println(exception);
        }
    }
}
