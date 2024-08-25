<%-- 
    Document   : AddNewFoodSuccess
    Created on : Aug 21, 2024, 1:05:05 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Food" %>
<!DOCTYPE html>
<html>
</head>
<body>
    <div class="container">
        <%
            Food food = (Food) session.getAttribute("food");
            if (food != null) {
        %>
        <h1>รายการทั้งหมด</h1>
        <p><strong>ชื่ออาหาร:</strong> <%= food.getFoodName()%></p>
        <p><strong>ประเภท:</strong> <%= food.getFoodType()%></p>
        <p><strong>ท็อปปิ้ง:</strong> <%= food.getTopping()%></p>
        <p><strong>ระดับความหวาน:</strong> <%= food.getSweetLevel()%></p>
        <p><strong>ราคา:</strong> <%= food.getFoodPrice()%> บาท</p>
        <button onclick="window.location.href = 'updateFood.jsp'">แก้ไข</button>
        <button onclick="window.location.href = 'index.html'">ตกลง</button>
        <%
        } else {
        %>
        <h1>No Food Data Available</h1>
        <p>No food data was found. Please try again.</p>
        <a href="updateFood.jsp" class="button">กลับไปแก้ไข</a>
        <%
            }
        %>
    </div>
</body>
</html>