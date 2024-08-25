<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>เพิ่มอาหาร</title>
        <script>
            function toggleToppings(checkbox) {
                // Get all topping checkboxes
                var toppingCheckboxes = document.querySelectorAll('input[name="topping"]');
                if (checkbox.value === "ไม่ใส่" && checkbox.checked) {
                    // Disable all other topping checkboxes
                    toppingCheckboxes.forEach(function (item) {
                        if (item !== checkbox) {
                            item.disabled = true;
                            item.checked = false;
                        }
                    });
                } else {
                    // Enable all topping checkboxes
                    toppingCheckboxes.forEach(function (item) {
                        item.disabled = false;
                    });
                }
            }

            // Initialize the state of toppings based on the current "ไม่ใส่" checkbox
            function initializeToppingState() {
                var toppingNoneCheckbox = document.getElementById('toppingNone');
                var otherToppings = document.querySelectorAll('input[name="topping"]:not(#toppingNone)');
                if (toppingNoneCheckbox.checked) {
                    otherToppings.forEach(function (item) {
                        item.disabled = true;
                    });
                }
            }

            window.onload = initializeToppingState;
        </script>
    </head>
    <body>
        <div>เพิ่มอาหาร</div>
        <form action="AddNewFoodServlet" method="post">
            <label for="foodName">ชื่อ:</label>
            <input type="text" id="foodName" name="foodName" required><br/>

            <label for="foodType">ประเภท:</label>
            <select id="foodType" name="foodType" required>
                <option value="">เลือกประเภท</option>
                <option value="ปั่น">ปั่น</option>
                <option value="เย็น">เย็น</option>
                <option value="ร้อน">ร้อน</option>
                <option value="โซดา">โซดา</option>
                <option value="ชา">ชา</option>
            </select><br/>

            <fieldset>
                <legend>ท็อปปิ้ง:</legend>
                <input type="checkbox" id="toppingNone" name="topping" value="ไม่ใส่">
                <label for="toppingNone">ไม่ใส่</label><br/>

                <input type="checkbox" id="toppingBubble" name="topping" value="ไข่มุก">
                <label for="toppingBubble">ไข่มุก</label><br/>

                <input type="checkbox" id="toppingJelly" name="topping" value="เจลลี่ผลไม้">
                <label for="toppingJelly">เจลลี่ผลไม้</label><br/>
            </fieldset>

            <fieldset>
                <legend>ระดับความหวาน:</legend>
                <input type="radio" id="sweetLevel0" name="sweetLevel" value="หวาน 0%" required>
                <label for="sweetLevel0">หวาน 0%</label><br/>

                <input type="radio" id="sweetLevel25" name="sweetLevel" value="หวาน 25%">
                <label for="sweetLevel25">หวาน 25%</label><br/>

                <input type="radio" id="sweetLevel50" name="sweetLevel" value="หวาน 50%">
                <label for="sweetLevel50">หวาน 50%</label><br/>

                <input type="radio" id="sweetLevel75" name="sweetLevel" value="หวาน 75%">
                <label for="sweetLevel75">หวาน 75%</label><br/>

                <input type="radio" id="sweetLevel100" name="sweetLevel" value="หวาน 100%">
                <label for="sweetLevel100">หวาน 100%</label><br/>
            </fieldset>

            <label for="foodPrice">ราคา:</label>
            <input type="number" id="foodPrice" name="foodPrice" required><br/>

            <input type="submit" value="เพิ่มอาหาร">
        </form>
    </body>
</html>
