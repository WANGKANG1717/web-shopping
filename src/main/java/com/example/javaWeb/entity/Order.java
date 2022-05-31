package com.example.javaWeb.entity;

import java.time.LocalDateTime;

/**
 * @Author: WK kang17.xyz
 * @Date: 2022/05/29/16:25
 * @Email: 1686617586@qq.com
 * @Description: ©WK
 */
public class Order {
    String id;
    String userID;
    String productID;
    String productName;
    Integer num;
    Double totalPrice;
    LocalDateTime tradeTime;
    String status;

    public Order() {}

    public Order(String id, String userID, String productID, String productName, Integer num, Double totalPrice) {
        this.id = id;
        this.userID = userID;
        this.productID = productID;
        this.productName=productName;
        this.num = num;
        this.totalPrice = totalPrice;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public LocalDateTime getTradeTime() {
        return tradeTime;
    }

    public void setTradeTime(LocalDateTime tradeTime) {
        this.tradeTime = tradeTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", userID='" + userID + '\'' +
                ", productID='" + productID + '\'' +
                ", productName='" + productName + '\'' +
                ", num=" + num +
                ", totalPrice=" + totalPrice +
                ", tradeTime=" + tradeTime +
                ", status='" + status + '\'' +
                '}';
    }
}
