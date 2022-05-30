package com.example.javaWeb.service;

import com.example.javaWeb.entity.Order;
import com.example.javaWeb.entity.Product;

import java.util.ArrayList;

/**
 * @Author: WK kang17.xyz
 * @Date: 2022/05/29/17:02
 * @Email: 1686617586@qq.com
 * @Description: ©WK
 */
public interface OrderService {
    void addOrder(String userID, ArrayList<Product> products);

    boolean updateOrderStatus(String id, String status);

    Order getOrderById(String id);
}
