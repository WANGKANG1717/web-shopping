package com.example.javaWeb.controller;

import com.example.javaWeb.entity.*;
import com.example.javaWeb.service.OrderService;
import com.example.javaWeb.service.ShoppingCartService;
import com.example.javaWeb.service.UserService;
import com.example.javaWeb.service.imp.OrderServiceImp;
import com.example.javaWeb.service.imp.ProductServiceImp;
import com.example.javaWeb.service.imp.ShoppingCartServiceImp;
import com.example.javaWeb.service.imp.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * @Author: WK kang17.xyz
 * @Date: 2022/05/30/10:39
 * @Email: 1686617586@qq.com
 * @Description: ©WK
 */
@WebServlet(name = "order", value = "/order")
public class OrderController extends HttpServlet {
    OrderService orderService=new OrderServiceImp();
    ShoppingCartService shoppingCartService= new ShoppingCartServiceImp();
    UserService userService=new UserServiceImp();

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /**
         * 获取参数识别用户想要请求的方法
         * 然后判断并调用对应的方法
         */
        String method = req.getParameter("method");
        if ("add".equals(method)) {
            addOrder(req, resp);
        } else if ("pay".equals(method)) {
            payOrders(req, resp);
        } else if ("getAll".equals(method)) {
            getUnPayOrder(req, resp);
        } else if ("delete".equals(method)) {
            deleteOrder(req, resp);
        } else if ("addOne".equals(method)) {
            addOneOrder(req, resp);
        } else if ("getPay".equals(method)) {
            getPayOrder(req, resp);
        }
    }

    public void addOrder(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        System.out.println("addOrder");
        /**
         * 做了这么长时间才发现JSp原来其实可以方便的传值的！！！！kao
         * 四种传值方式
         * 我却傻傻的用表单传值。。。。
         */
        String userID= request.getParameter("userID");
        String[] productIDs= request.getParameterValues("productIDs");
        ArrayList<Product> shoppingCard= shoppingCartService.getShoppingCart(userID);
        //为了尽快完成，这里写的有点敷衍了
        /**
         * 做到这里了
         * 做完订单我就结束，不再进行任何的开发，专心的准备考研
         */

        if(productIDs!=null && productIDs.length>0 && shoppingCard!=null && shoppingCard.size()>0) {
            for(int i=0; i<productIDs.length; i++) {
                System.out.print(productIDs[i]);
                Product product=shoppingCard.get(Integer.parseInt(productIDs[i]));
                //添加订单成功，删除购物车中内容
                if(orderService.addOrder(userID, product)) {
                    shoppingCartService.ClearShoppingCart(userID, product.getId().toString());
                }
                else {
                    System.out.println("添加失败->" + product.getId());
                }
            }
        }
        //数据返回
        ArrayList<Order> orders=orderService.getOrdersByUserId(userID, "0");
        request.getSession().setAttribute("orders", orders);
        //
        try {
            request.getRequestDispatcher("/order.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void payOrders(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        System.out.println("payOrders");
        String userID= request.getParameter("userID");
        String[] orderIDs= request.getParameterValues("orderIDs");
        ArrayList<Order> orders= (ArrayList<Order>) request.getSession().getAttribute("orders");
        User user=(User) request.getSession().getAttribute("user");
        if(orderIDs!=null && orderIDs.length>0 && orders!=null && orders.size()>0) {
            for(int i=0; i<orderIDs.length; i++) {
                System.out.print(orderIDs[i]);
                Order order=orders.get(Integer.parseInt(orderIDs[i]));
                boolean flag=orderService.updateOrderStatus(order.getId(), "1");
                if(flag==true) {
                    System.out.println(user.toString());
                    System.out.println(order.toString());
                    user.setBalance(user.getBalance()-order.getTotalPrice());
                    if(userService.update(user)==false) {
                        orderService.updateOrderStatus(order.getId(), "0");
                        System.out.println("更新用户余额失败");
                    }
                }
            }
        }
        //数据返回
        ArrayList<Order> orders2=orderService.getOrdersByUserId(userID, "0");
        request.getSession().setAttribute("orders", orders2);
        //
        try {
            request.getRequestDispatcher("/order.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void getUnPayOrder(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        System.out.println("getUnPayOrder");
        String userID= request.getParameter("userID");
        //数据返回
        ArrayList<Order> orders=orderService.getOrdersByUserId(userID, "0");
        request.getSession().setAttribute("orders", orders);
        //
        try {
            request.getRequestDispatcher("/order.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void getPayOrder(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        System.out.println("getPayOrder");
        String userID= request.getParameter("userID");
        //数据返回
        ArrayList<Order> orders=orderService.getOrdersByUserId(userID, "1");
        request.getSession().setAttribute("orders", orders);
        //
        try {
            request.getRequestDispatcher("/orderPay.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteOrder(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        System.out.println("deleteOrder");
        String id= request.getParameter("id");
        String userID= request.getParameter("userID");
        //数据返回
        orderService.deleteOrderById(id);
        //数据返回
        ArrayList<Order> orders=orderService.getOrdersByUserId(userID, "0");
        request.getSession().setAttribute("orders", orders);
        try {
            request.getRequestDispatcher("/order.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addOneOrder(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        System.out.println("addOneOrder");
        String userID= request.getParameter("userID");
        String productID= request.getParameter("productID");
        String buyNum= request.getParameter("buyNum");
        //
        Product product = new ProductServiceImp().getProduct(Integer.valueOf(productID));
        product.setNum(Integer.valueOf(buyNum));
        //添加订单成功，删除购物车中内容
        if (orderService.addOrder(userID, product)) {
            shoppingCartService.ClearShoppingCart(userID, product.getId().toString());
        } else {
            System.out.println("添加失败->" + product.getId());
        }
        //数据返回
        ArrayList<Order> orders=orderService.getOrdersByUserId(userID, "0");
        request.getSession().setAttribute("orders", orders);
        //
        try {
            request.getRequestDispatcher("/order.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
