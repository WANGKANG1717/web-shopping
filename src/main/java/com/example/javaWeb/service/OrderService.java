package com.example.javaWeb.service;

import com.example.javaWeb.entity.Order;

/**
 * @Author: WK kang17.xyz
 * @Date: 2022/05/29/17:02
 * @Email: 1686617586@qq.com
 * @Description: ©WK
 */
public interface OrderService {
    String addOrder(String userID, String productID, Integer num, Double singlePrice);

    boolean updateOrderStatus(String id, String status);

    Order getOrderById(String id);
}
