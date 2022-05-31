<%@ page import="com.example.javaWeb.entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>爱尚网扇品</title>
    <link rel="stylesheet" rev="stylesheet" href="css/global.css" type="text/css" media="all"/>
</head>
<body>
<%
    session.setAttribute("router", "/cart_view.jsp");
%>
<script language="JavaScript">
    function checkAll() {
        var checkAll=document.getElementById("selectAll");
        var flag=checkAll.checked;
        var checkBoxs=document.getElementsByName("proCheck");
        for(var i=0; i<checkBoxs.length; i++) {
            // console.log(checkBoxs[i].value);
            checkBoxs[i].checked=flag;
        }
        alterTotalPrice();
    }

    function toCheck() {
        var checkAll = document.getElementById("selectAll");
        var checkBoxs = document.getElementsByName("proCheck");
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
        alterTotalPrice();
    }

    function alterTotalPrice() {
        var checkBoxs = document.getElementsByName("proCheck");
        var proToPrice = document.getElementsByName("proToPrice");
        var proNum = document.getElementsByName("proNum");
        var totalPrice = document.getElementById("totalPrice");
        var sum = 0;
        for (var i = 0; i < checkBoxs.length; i++) {
            if (checkBoxs[i].checked == true) {
                // console.log(proToPrice[i].innerHTML);
                var price=parseFloat(proToPrice[i].innerHTML) * parseInt(proNum[i].innerHTML)
                sum += price;
            }
        }
        totalPrice.innerHTML = sum;
    }

    function addProductIdsToFrom() {
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
                newInput.name="productIDs"
                newInput.style.display="none";
                newInput.setAttribute("value", checkBoxs[i].value);
                form.appendChild(newInput);
                flag=true;
            }
        }
        if(flag==true) {
            form.submit();
        }
        else  {
            alert("您未选择要提交订单的商品，请重试！😒");
        }
    }
</script>
<%!
    Double totalPrice = 0.0;
%>
<jsp:useBean id="user" scope="session" class="com.example.javaWeb.entity.User"/>
<jsp:useBean id="shoppingCard" scope="session" class="java.util.ArrayList"/>
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
        <% } else if (shoppingCard == null || shoppingCard.size() == 0) {
            totalPrice = 0.0;
        %>
        <div id="empty">
            <h3>您的购物车还是空的，</h3>
            <h3>赶紧行动吧！</h3>
        </div>
        <% } else { %>
        <img src="images/shopping_card.gif"/>
        <div id="cart_tb">
            <table style="width: 100%; text-align: center">
                <tr>
                    <td width="5%"><input type="checkbox" id="selectAll" name="selectAll" onclick="checkAll()"/></td>
                    <td width="5%"><span style="color:#696969;font-size:13px;font-weight:bold;">序号</span></td>
                    <td width="30%"><span style="color:#696969;font-size:13px;font-weight:bold;">商品名称</span></td>
                    <td width="20%"><span style="color:#696969;font-size:13px;font-weight:bold;">单价（元）</span></td>
                    <td width="10%"><span style="color:#696969;font-size:13px;font-weight:bold;">数量</span></td>
                    <td width="10%"><span style="color:#696969;font-size:13px;font-weight:bold;">小计（元）</span></td>
                    <td width="20%"><span style="color:#696969;font-size:13px;font-weight:bold;">操作</span></td>
                </tr>
                <%
                    totalPrice = 0.0;
                    for (int i = 0; i < shoppingCard.size(); i++) {
                        Product product = (Product) shoppingCard.get(i); %>
                <tr>
<%--                    通过Check的value来判断选择了哪一些--%>
                    <td><input type="checkbox" name="proCheck" value="<%=i%>" onclick="toCheck()"/></td>
                    <td><%=(i + 1)%>
                    </td>
                    <td><%=product.getName()%>
                    </td>
                    <td name="proToPrice"><%=product.getPro_price()%>
                    </td>
                    <td name="proNum"><%=product.getNum()%>
                    </td>
                    <td><%=product.getTotal_price()%>
                    </td>
                    <td>
                        <form method="post" action="shoppingCart" style="display: inline">
                            <input type="text" name="userID" value="<%=user.getId()%>" style="display: none">
                            <input type="text" name="productID" value="<%=product.getId()%>" style="display: none">
                            <input type="text" name="buyNum" value="-1" style="display: none">
                            <input type="text" name="method" value="add" style="display: none">
                            <% if (product.getNum() > 1) { %>
                            <input type="submit" value="-" style="width: 25px">
                            <% } else { %>
                            <input type="submit" disabled value="-" style="width: 25px">
                            <% } %>
                        </form>
                        <form method="post" action="shoppingCart" style="display: inline">
                            <input type="text" name="userID" value="<%=user.getId()%>" style="display: none">
                            <input type="text" name="productID" value="<%=product.getId()%>" style="display: none">
                            <input type="text" name="buyNum" value="1" style="display: none">
                            <input type="text" name="method" value="add" style="display: none">
                            <input type="submit" value="+" style="width: 25px">
                        </form>
                        <form method="post" action="shoppingCart" style="display: inline">
                            <input type="text" name="userID" value="<%=user.getId()%>" style="display: none">
                            <input type="text" name="productID" value="<%=product.getId()%>" style="display: none">
                            <input type="text" name="method" value="clearOne" style="display: none">
                            <input type="submit" value="删除">
                        </form>
                    </td>
                </tr>
                <% totalPrice += product.getTotal_price();
                }
                %>
            </table>
        </div>
        <div id="cart_tt">
            合计总金额：<span id="totalPrice" style="font-size:18px;color:#f60;">0.0</span>元</td>
        </div>
        <div id="cart_lk">
            <a href="index.jsp">继续购物</a> |
            <a href="shoppingCart?userID=<%=user.getId()%>&method=clearAll">清空购物车</a> |
            <form method="post" action="order" style="display: inline" name="orderSubmit" id="orderSubmit">
                <input type="text" name="method" value="add" style="display: none">
                <input type="text" style="display: none" name="userID" value="<%=user.getId()%>">
                <a style="cursor:pointer;" onclick="addProductIdsToFrom()">去收银台结账</a>
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
