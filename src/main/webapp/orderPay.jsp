<%--
  Created by IntelliJ IDEA.
  User: WANGKANG
  Date: 2022/5/31
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.javaWeb.entity.Order" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>已支付订单</title>
    <link rel="stylesheet" rev="stylesheet" href="css/global.css" type="text/css" media="all"/>
</head>
<body>
<%
    session.setAttribute("router", "/orderPay.jsp");
%>
<jsp:useBean id="user" scope="session" class="com.example.javaWeb.entity.User"/>
<jsp:useBean id="orders" scope="session" class="java.util.ArrayList"/>
<div id="page">
    <div id="header">
        <jsp:include page="header.jsp"/>
    </div>

    <div id="left_column">
        <jsp:include page="left_column.jsp"/>
    </div>
    <div id="center_column">
        <%
            if (user.getName() == null || user.getName().equals("")) { %>
        请先登录
        <% } else if (orders == null || orders.size() == 0) {
        %>
        <div id="empty">
            <h3>您未有任何已支付订单！</h3>
            <h3><a href="index.jsp">赶紧行动吧！</a></h3>
        </div>
        <% } else { %>
        <img src="images/shopping_card.gif"/>
        <div id="cart_tb">
            <table style="width: 100%; text-align: center">
                <tr>
                    <td width="5%"><span style="color:#696969;font-size:13px;font-weight:bold;">序号</span></td>
                    <td width="40%"><span style="color:#696969;font-size:13px;font-weight:bold;">订单号</span></td>
                    <td width="35%"><span style="color:#696969;font-size:13px;font-weight:bold;">产品名称</span></td>
                    <td width="10%"><span style="color:#696969;font-size:13px;font-weight:bold;">数量</span></td>
                    <td width="10%"><span style="color:#696969;font-size:13px;font-weight:bold;">小计（元）</span></td>
                </tr>
                <%
                    for (int i = 0; i < orders.size(); i++) {
                        Order order = (Order) orders.get(i); %>
                <tr>
                    <%--                    通过Check的value来判断选择了哪一些--%>
                    <td><%=(i + 1)%>
                    </td>
                    <td><%=order.getId()%>
                    </td>
                    <td><%=order.getProductName()%>
                    </td>
                    <td><%=order.getNum()%>
                    </td>
                    <td><%=order.getTotalPrice()%>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
        <div id="cart_lk">
            <a href="index.jsp">继续购物</a>
        </div>
        <% } %>
    </div>
    <div id="footer">
        <jsp:include page="bottom.jsp"/>
    </div>
</div>

</body>
</html>
