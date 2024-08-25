<%-- 
    Document   : updateFood
    Created on : Jul 18, 2024, 12:04:00 PM
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Food" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>แก้ไขข้อมูลอาหาร</title>
        <script>
            // JavaScript function to toggle toppings
            function toggleToppings(checkbox) {
                if (checkbox.value === "ไม่ใส่") {
                    var checkboxes = document.querySelectorAll('input[name="topping"]');
                    checkboxes.forEach(cb => {
                        if (cb !== checkbox)
                            cb.checked = false;
                    });
                }
            }
        </script>
    </head>
    <body>
        <%
            Food food = (Food) session.getAttribute("food");
            if (food != null) {
        %>
        <p>แก้ไขข้อมูลอาหาร</p>
        <form action="AddNewFoodServlet" method="post">
            <label for="foodName">ชื่อ:</label>
            <input type="text" id="foodName" name="foodName" value="<%= food.getFoodName()%>" required><br/>

            <label for="foodType">ประเภท:</label>
            <select id="foodType" name="foodType" required>
                <option value="ปั่น" <%= "ปั่น".equals(food.getFoodType()) ? "selected" : ""%>>ปั่น</option>
                <option value="เย็น" <%= "เย็น".equals(food.getFoodType()) ? "selected" : ""%>>เย็น</option>
                <option value="ร้อน" <%= "ร้อน".equals(food.getFoodType()) ? "selected" : ""%>>ร้อน</option>
                <option value="โซดา" <%= "โซดา".equals(food.getFoodType()) ? "selected" : ""%>>โซดา</option>
                <option value="ชา" <%= "ชา".equals(food.getFoodType()) ? "selected" : ""%>>ชา</option>
            </select><br/>

            <label>ท็อปปิ้ง:</label><br>
            <input type="checkbox" id="toppingNone" name="topping" value="ไม่ใส่" 
                   <%= food.getTopping() != null && food.getTopping().contains("ไม่ใส่") ? "checked" : ""%>
                   onclick="toggleToppings(this)">
            <label for="toppingNone">ไม่ใส่</label><br/>

            <input type="checkbox" id="toppingBubble" name="topping" value="ไข่มุก" 
                   <%= food.getTopping() != null && food.getTopping().contains("ไข่มุก") ? "checked" : ""%>
                   onclick="toggleToppings(this)">
            <label for="toppingBubble">ไข่มุก</label><br/>

            <input type="checkbox" id="toppingJelly" name="topping" value="เจลลี่ผลไม้" 
                   <%= food.getTopping() != null && food.getTopping().contains("เจลลี่ผลไม้") ? "checked" : ""%>
                   onclick="toggleToppings(this)">
            <label for="toppingJelly">เจลลี่ผลไม้</label><br/>

            <label>ระดับความหวาน:</label><br>
            <input type="radio" id="sweetLevel0" name="sweetLevel" value="หวาน 0%" 
                   <%= "หวาน 0%".equals(food.getSweetLevel()) ? "checked" : ""%>>
            <label for="sweetLevel0">หวาน 0%</label><br/>

            <input type="radio" id="sweetLevel25" name="sweetLevel" value="หวาน 25%" 
                   <%= "หวาน 25%".equals(food.getSweetLevel()) ? "checked" : ""%>>
            <label for="sweetLevel25">หวาน 25%</label><br/>

            <input type="radio" id="sweetLevel50" name="sweetLevel" value="หวาน 50%" 
                   <%= "หวาน 50%".equals(food.getSweetLevel()) ? "checked" : ""%>>
            <label for="sweetLevel50">หวาน 50%</label><br/>

            <input type="radio" id="sweetLevel75" name="sweetLevel" value="หวาน 75%" 
                   <%= "หวาน 75%".equals(food.getSweetLevel()) ? "checked" : ""%>>
            <label for="sweetLevel75">หวาน 75%</label><br/>

            <input type="radio" id="sweetLevel100" name="sweetLevel" value="หวาน 100%" 
                   <%= "หวาน 100%".equals(food.getSweetLevel()) ? "checked" : ""%>>
            <label for="sweetLevel100">หวาน 100%</label><br/>

            <label for="foodPrice">ราคา:</label>
            <input type="text" id="foodPrice" name="foodPrice" value="<%= food.getFoodPrice()%>" required><br/>

            <input type="submit" value="แก้ไข">
        </form>

        <button onclick="window.location.href = 'index.html'">ตกลง</button>


        <%
        } else {
        %>
        <p>No food data available. Please <a href="addNewFood.html">add a new food item</a> first.</p>
        <%
            }
        %>
    </body>
</html>
