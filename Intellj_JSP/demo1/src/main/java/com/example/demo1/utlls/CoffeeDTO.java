package com.example.demo1.utlls;

import java.time.LocalDateTime;
import java.util.Date;

public class CoffeeDTO {

    private Long coffeeNum;

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setCoffeeNum(Long coffeeNum) {
        this.coffeeNum = coffeeNum;
    }

    public void setCoffeeName(String coffeeName) {
        this.coffeeName = coffeeName;
    }

    public void setPrice(int price) {
        this.price = price;
    }


    public Long getCoffeeNum() {
        return coffeeNum;
    }

    public String getCoffeeName() {
        return coffeeName;
    }

    public int getPrice() {
        return price;
    }


    private String coffeeName;
    private int price;
    private java.util.Date regDate;
}
