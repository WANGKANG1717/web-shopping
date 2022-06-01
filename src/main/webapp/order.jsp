<%--
  Created by IntelliJ IDEA.
  User: WANGKANG
  Date: 2022/5/31
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.javaWeb.entity.Product" %>
<%@ page import="com.example.javaWeb.entity.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>未支付订单</title>
    <link rel="stylesheet" rev="stylesheet" href="css/global.css" type="text/css" media="all"/>
</head>
<body>
<%
    session.setAttribute("router", "/order.jsp");
%>
<%!
    Double totalPrice = 0.0;
%>
<jsp:useBean id="user" scope="session" class="com.example.javaWeb.entity.User"/>
<jsp:useBean id="orders" scope="session" class="java.util.ArrayList"/>
<script language="JavaScript">
    function checkAll() {
        var checkAll = document.getElementById("selectAll");
        var flag = checkAll.checked;
        var checkBoxs = document.getElementsByName("proCheck");
        for (var i = 0; i < checkBoxs.length; i++) {
            checkBoxs[i].checked = flag;
        }
        alterTotalPrice();
    }

    function toCheck() {
        var checkAll = document.getElementById("selectAll");
        var checkBoxs = document.getElementsByName("proCheck");
        alterTotalPrice();
        //
        var cnt = 0;
        for (var i = 0; i < checkBoxs.length; i++) {
            if (checkBoxs[i].checked == true) {
                cnt++;
            }
        }
        if (checkBoxs.length > 0 && cnt == checkBoxs.length) {
            checkAll.checked = true;
        }
        else {
            checkAll.checked = false;
        }
    }

    function alterTotalPrice() {
        var checkBoxs = document.getElementsByName("proCheck");
        var proToPrice = document.getElementsByName("proToPrice");
        var totalPrice = document.getElementById("totalPrice");
        var sum = 0;
        for (var i = 0; i < checkBoxs.length; i++) {
            if (checkBoxs[i].checked == true) {
                // console.log(proToPrice[i].innerHTML);
                sum += parseFloat(proToPrice[i].innerHTML);
            }
        }
        totalPrice.innerHTML = sum;
    }

    function addProductIdsToFrom() {
        var totalPrice = document.getElementById("totalPrice")
        totalPrice=parseFloat(totalPrice.innerHTML);
        var userBalance=parseFloat(<%=user.getBalance()%>);
        console.log(userBalance);
        console.log(totalPrice);
        if(totalPrice>userBalance) {
            alert("余额不足，请充值后再试！充值方式->吱父保：13082838117, 充值完成请联系我🐶🙌👌👍");
            return ;
        }
        //
        var form=document.getElementById("orderSubmit");
        var checkBoxs=document.getElementsByName("proCheck");
        // console.log(checkBoxs.length);
        var flag=false;
        for(var i=0; i<checkBoxs.length; i++) {
            // console.log("i");
            //添加选中的到表单中进行提交
            if(checkBoxs[i].checked==true) {
                var newInput = document.createElement("input");
                newInput.type="text";
                newInput.name="orderIDs"
                newInput.style.display="none";
                newInput.setAttribute("value", checkBoxs[i].value);
                form.appendChild(newInput);
                flag=true;
            }
        }
        if(flag==true) {
            form.submit();
        }
        else {
            alert("您未选择要结算的订单，请重试！😒");
        }
    }
</script>
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
            totalPrice = 0.0;
        %>
        <div id="empty">
            <h3>您的订单还是空的，</h3>
            <h3><a href="index.jsp">赶紧行动吧！</a></h3>
        </div>
        <div id="cart_lk">
            <a href="index.jsp">继续购物</a> |
            <form method="post" action="order" style="display: inline" name="toPayOrder">
                <input type="text" name="method" value="getPay" style="display: none">
                <input type="text" style="display: none" name="userID" value="<%=user.getId()%>">
                <a style="cursor:pointer;" onclick="document.toPayOrder.submit()">查看已支付订单</a>
            </form>
        </div>
        <% } else { %>
        <img src="images/shopping_card.gif"/>
        <div id="cart_tb">
            <table style="width: 100%; text-align: center">
                <tr>
                    <td width="5%"><input type="checkbox" id="selectAll" name="selectAll" onclick="checkAll()"/></td>
                    <td width="5%"><span style="color:#696969;font-size:13px;font-weight:bold;">序号</span></td>
                    <td width="30%"><span style="color:#696969;font-size:13px;font-weight:bold;">订单号</span></td>
                    <td width="20%"><span style="color:#696969;font-size:13px;font-weight:bold;">产品名称</span></td>
                    <td width="10%"><span style="color:#696969;font-size:13px;font-weight:bold;">数量</span></td>
                    <td width="10%"><span style="color:#696969;font-size:13px;font-weight:bold;">小计（元）</span></td>
                    <td width="20%"><span style="color:#696969;font-size:13px;font-weight:bold;">操作</span></td>
                </tr>
                <%
                    totalPrice = 0.0;
                    for (int i = 0; i < orders.size(); i++) {
                        Order order = (Order) orders.get(i); %>
                <tr>
                    <%--                    通过Check的value来判断选择了哪一些--%>
                    <td><input type="checkbox" name="proCheck" value="<%=i%>" onclick="toCheck()"/></td>
                    <td><%=(i + 1)%>
                    </td>
                    <td><%=order.getId()%>
                    </td>
                    <td><%=order.getProductName()%>
                    </td>
                    <td><%=order.getNum()%>
                    </td>
                    <td name="proToPrice"><%=order.getTotalPrice()%>
                    </td>
                    <td>
                        <form method="post" action="order" style="display: inline">
                            <input type="text" name="userID" value="<%=user.getId()%>" style="display: none">
                            <input type="text" name="id" value="<%=order.getId()%>" style="display: none">
                            <input type="text" name="method" value="delete" style="display: none">
                            <input type="submit" value="取消订单">
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
        <div id="cart_tt">
            总金额：<span id="totalPrice" style="font-size:18px;color:#f60;">0.0</span>元</td>
        </div>
        <div id="cart_lk">
            <a href="index.jsp">继续购物</a> |
            <form method="post" action="order" style="display: inline" name="toPayOrder">
                <input type="text" name="method" value="getPay" style="display: none">
                <input type="text" style="display: none" name="userID" value="<%=user.getId()%>">
                <a style="cursor:pointer;" onclick="document.toPayOrder.submit()">查看已支付订单</a>
            </form> |
            <form method="post" action="order" style="display: inline" name="orderSubmit" id="orderSubmit">
                <input type="text" name="method" value="pay" style="display: none">
                <input type="text" style="display: none" name="userID" value="<%=user.getId()%>">
                <a style="cursor:pointer;" onclick="addProductIdsToFrom()">结算</a>
            </form>
        </div>
        <% } %>
    </div>
    <div id="footer">
        <jsp:include page="bottom.jsp"/>
    </div>
</div>

</body>
</html>
