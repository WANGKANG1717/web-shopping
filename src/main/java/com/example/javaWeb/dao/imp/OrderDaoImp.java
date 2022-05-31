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
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

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
        String sql = "INSERT INTO  `order` set id=?, userID=?, productID=?, productName=?, num=?, totalPrice=?;";
        int res = 0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            //执行sql语句之前需要给参数赋值
            preparedStatement.setString(1, order.getId());
            preparedStatement.setString(2, order.getUserID());
            preparedStatement.setString(3, order.getProductID());
            preparedStatement.setString(4, order.getProductName());
            preparedStatement.setString(5, order.getNum().toString());
            preparedStatement.setString(6, order.getTotalPrice().toString());
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
        String sql = "select * from `order` where id=?;";
        ResultSet resultSet = null;
        Order order=null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            //执行sql语句之前需要给参数赋值
            preparedStatement.setString(1, id);
            //执行sql语句
            resultSet = preparedStatement.executeQuery();
            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (resultSet.next()) {
                order=new Order();
                order.setId(resultSet.getString(1));
                order.setUserID(resultSet.getString(2));
                order.setProductID(resultSet.getString(3));
                order.setProductName(resultSet.getString(4));
                order.setNum(Integer.parseInt(resultSet.getString(5)));
                order.setTotalPrice(Double.parseDouble(resultSet.getString(6)));
                order.setTradeTime(LocalDateTime.parse(resultSet.getString(7), dateFormat));
                order.setStatus(resultSet.getString(8));
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

    @Override
    public ArrayList<Order> getAll(String userID, String status) {
        connection = jdbcUtils.getConnection();
        String sql = "SELECT * FROM `order` where userID=? AND status=?;";
        ResultSet resultSet = null;
        ArrayList<Order> orders=new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            //执行sql语句之前需要给参数赋值
            preparedStatement.setString(1, userID);
            preparedStatement.setString(2, status);
            //执行sql语句
            resultSet = preparedStatement.executeQuery();
            DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            while (resultSet.next()) {
                Order order=new Order();
                order.setId(resultSet.getString(1));
                order.setUserID(resultSet.getString(2));
                order.setProductID(resultSet.getString(3));
                order.setProductName(resultSet.getString(4));
                order.setNum(Integer.parseInt(resultSet.getString(5)));
                order.setTotalPrice(Double.parseDouble(resultSet.getString(6)));
                order.setTradeTime(LocalDateTime.parse(resultSet.getString(7), dateFormat));
                order.setStatus(resultSet.getString(8));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        jdbcUtils.close(connection, preparedStatement, resultSet);
        return orders;
    }

    @Override
    public boolean delete(String id) {
        System.out.println("Message -> deleteById");
        connection = jdbcUtils.getConnection();
        String sql = "DELETE FROM `order` WHERE id=?;";
        boolean flag=false;
        try {
            preparedStatement = connection.prepareStatement(sql);
            //执行sql语句之前需要给参数赋值
            preparedStatement.setString(1, id);
            if(preparedStatement.executeUpdate()==1) {
                flag=true;
            }
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
        jdbcUtils.close(connection, preparedStatement, null);
        return flag;
    }
}
