package com.example.javaWeb.controller;

import com.example.javaWeb.entity.Notice;
import com.example.javaWeb.entity.Product;
import com.example.javaWeb.entity.ShoppingCart;
import com.example.javaWeb.service.OrderService;
import com.example.javaWeb.service.imp.OrderServiceImp;

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

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /**
         * 获取参数识别用户想要请求的方法
         * 然后判断并调用对应的方法
         */
        String method = req.getParameter("method");
        if ("add".equals(method)) {
            addOrder(req, resp);
        } else if ("update".equals(method)) {

        } else if ("getAll".equals(method)) {

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
        ArrayList<Product> shoppingCard= (ArrayList<Product>) request.getSession().getAttribute("shoppingCard");
//        System.out.println(productIDs.length);
//        for(int i=0; i<productIDs.length; i++) {
//            System.out.println(productIDs[i]);
//        }
//        System.out.println(shoppingCard.size() +" addad");
        /**
         * 做到这里了
         * 做完订单我就结束，不再进行任何的开发，专心的准备考研
         */
        ArrayList<Product> products=new ArrayList<>();
        if(productIDs!=null || productIDs.length>0) {
            for(int i=0; i<productIDs.length; i++) {
                products.add(shoppingCard.get(Integer.parseInt(productIDs[i])));
            }
            //
            orderService.addOrder(userID, products);
        }
        //
        //数据返回
        //
        try {
            request.getRequestDispatcher("/order.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
