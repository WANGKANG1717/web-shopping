package com.example.javaWeb.dao;

import com.example.javaWeb.entity.Order;

/**
 * @Author: WK kang17.xyz
 * @Date: 2022/05/29/16:44
 * @Email: 1686617586@qq.com
 * @Description: ©WK
 */
public interface OrderDao {
    boolean add(Order order);

    boolean updateStatus(String id, String status);

    Order get(String id);
}
