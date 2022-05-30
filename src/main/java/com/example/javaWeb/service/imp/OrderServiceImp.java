package com.example.javaWeb.service.imp;

import com.example.javaWeb.dao.OrderDao;
import com.example.javaWeb.dao.imp.OrderDaoImp;
import com.example.javaWeb.entity.Order;
import com.example.javaWeb.entity.Product;
import com.example.javaWeb.service.OrderService;

import java.util.ArrayList;
import java.util.Random;

/**
 * @Author: WK kang17.xyz
 * @Date: 2022/05/29/17:03
 * @Email: 1686617586@qq.com
 * @Description: ©WK
 */
public class OrderServiceImp implements OrderService {
    OrderDao orderDao = new OrderDaoImp();

    public static String getRandomNumber(int length) {
        String str = "0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(10);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }

    @Override
    public void addOrder(String userID, ArrayList<Product> products) {
        String id = getRandomNumber(15);
        for (int i = 0; i < products.size(); i++) {
            Product product = products.get(i);
            Order order = new Order(id, userID, product.getId().toString(), product.getNum(), product.getTotal_price());
            if (orderDao.add(order)) {
                System.out.println("Order -> product  " + i + "  添加失败");
            }
        }
    }

    @Override
    public boolean updateOrderStatus(String id, String status) {
        return orderDao.updateStatus(id, status);
    }

    @Override
    public Order getOrderById(String id) {
        return orderDao.get(id);
    }
}
