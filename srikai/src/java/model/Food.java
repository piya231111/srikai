package model;

public class Food {

    private String foodName;
    private String foodType;
    private String topping; 
    private String sweetLevel;
    private double foodPrice;  // เปลี่ยนจาก int เป็น double

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getFoodType() {
        return foodType;
    }

    public void setFoodType(String foodType) {
        this.foodType = foodType;
    }

    public String getTopping() {
        return topping;
    }

    public void setTopping(String topping) {
        this.topping = topping;
    }

    public String getSweetLevel() {
        return sweetLevel;
    }

    public void setSweetLevel(String sweetLevel) {
        this.sweetLevel = sweetLevel;
    }

    public double getFoodPrice() {
        return foodPrice;
    }

    public void setFoodPrice(double foodPrice) {
        this.foodPrice = foodPrice;
    }

    // ลบเมธอด getFoodName(String trim) ที่ไม่จำเป็นออก
}
