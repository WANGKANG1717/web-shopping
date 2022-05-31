package com.example.javaWeb.service.imp;

import cn.hutool.core.util.IdUtil;
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

    @Override
    public boolean addOrder(String userID, Product product) {
            //hutool生成订单号
            String id = IdUtil.getSnowflake().nextIdStr();
            Order order = new Order(id, userID, product.getId().toString(), product.getName(), product.getNum(), product.getPro_price()*product.getNum());
            return orderDao.add(order);
    }

    @Override
    public void addOrders(String userID, ArrayList<Product> products) {
        for (int i = 0; i < products.size(); i++) {
            Product product = products.get(i);
            //hutool生成订单号
            String id = IdUtil.getSnowflake().nextIdStr();
            Order order = new Order(id, userID, product.getId().toString(), product.getName(),  product.getNum(),product.getPro_price()*product.getNum());
            if (orderDao.add(order)) {
                System.out.println("Order -> product  " + i + "  添加成功");
            }
            else {
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

    @Override
    public ArrayList<Order> getOrdersByUserId(String userID, String status) {
        return orderDao.getAll(userID, status);
    }

    @Override
    public boolean deleteOrderById(String id) {
        return orderDao.delete(id);
    }
}
