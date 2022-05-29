package com.example.javaWeb.dao.imp;

import com.example.javaWeb.dao.OrderDao;
import com.example.javaWeb.entity.Order;
import com.example.javaWeb.entity.User;
import com.example.javaWeb.jdbcUtils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

/**
 * @Author: WK kang17.xyz
 * @Date: 2022/05/29/16:45
 * @Email: 1686617586@qq.com
 * @Description: ©WK
 */
public class OrderDaoImp implements OrderDao {
    private JDBCUtils jdbcUtils = new JDBCUtils();
    private Connection connection;
    private PreparedStatement preparedStatement;

    @Override
    public boolean add(Order order) {
        connection = jdbcUtils.getConnection();
        String sql = "INSERT INTO  `order` set id=?, userID=?, productID=?, num=?, totalPrice=?;";
        int res = 0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            //执行sql语句之前需要给参数赋值
            preparedStatement.setString(1, order.getId());
            preparedStatement.setString(2, order.getUserID());
            preparedStatement.setString(3, order.getProductID());
            preparedStatement.setString(4, order.getNum().toString());
            preparedStatement.setString(5, order.getTotalPrice().toString());
            res = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        jdbcUtils.close(connection, preparedStatement, null);
        if (res != 0) return true;
        else return false;
    }

    /**
     * 为了简单期间，仅提供修改订单状态。
     */
    @Override
    public boolean updateStatus(String id, String status) {
        connection = jdbcUtils.getConnection();
        String sql = "UPDATE `order` SET `status`=? WHERE id=?;";
        boolean flag = false;
        try {
            preparedStatement = connection.prepareStatement(sql);
            //执行sql语句之前需要给参数赋值
            preparedStatement.setString(1, status);
            preparedStatement.setString(2, id);
            //执行sql语句
            int res = preparedStatement.executeUpdate();
            if (res==1) {
                flag=true;
                System.out.println("updateStatus Success");
            } else {
                System.out.println("updateStatus False");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        jdbcUtils.close(connection, preparedStatement, null);
        return flag;
    }

    @Override
    public Order get(String id) {
        connection = jdbcUtils.getConnection();
        String sql = "select * from 'order' where id=?";
        ResultSet resultSet = null;
        Order order=null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            //执行sql语句之前需要给参数赋值
            preparedStatement.setString(1, id);
            //执行sql语句
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                order=new Order();
                order.setId(resultSet.getString(1));
                order.setUserID(resultSet.getString(2));
                order.setProductID(resultSet.getString(3));
                order.setNum(Integer.parseInt(resultSet.getString(4)));
                order.setTotalPrice(Double.parseDouble(resultSet.getString(5)));
                order.setTradeTime(LocalDateTime.parse(resultSet.getString(6)));
                order.setStatus(resultSet.getString(7));
                System.out.println("getOrder Success");
            } else {
                System.out.println("getOrder False");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        jdbcUtils.close(connection, preparedStatement, resultSet);
        return order;
    }
}
