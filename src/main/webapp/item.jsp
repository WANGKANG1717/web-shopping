<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>爱尚网扇品</title>
    <link rel="stylesheet" rev="stylesheet" href="css/global.css" type="text/css" media="all"/>
</head>
<body>
<%
    session.setAttribute("router", "/item.jsp");
%>
<script language="JavaScript">
    function addOrderSubmit() {
        var form=document.getElementById("formSubmit");
        form.action="order";
        var method=document.getElementById("formMethod");
        method.value="addOne";
        form.submit();
    }
    function addShoppingCartSubmit() {
        var form=document.getElementById("formSubmit");
        form.action="shoppingCart";
        var method=document.getElementById("formMethod");
        method.value="add";
        form.submit();
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
        <jsp:useBean id="product" scope="session" class="com.example.javaWeb.entity.Product"/>
        <jsp:useBean id="user" scope="session" class="com.example.javaWeb.entity.User"/>
        <div id=item_img>
            <img width="300px" height="225px" src="Picture/<%=product.getImg()%>"/>
        </div>
        <div id=item_other>
            品&nbsp;&nbsp;&nbsp;&nbsp;名：&nbsp;<span
                style="font-size:15px;font-weight:bold;"><%=product.getName()%></span><br>
            原&nbsp;&nbsp;&nbsp;&nbsp;价：&nbsp;<span
                style="text-decoration: line-through;"><%=product.getPrice()%>元</span><br>
            促&nbsp;&nbsp;&nbsp;&nbsp;销：&nbsp;<span
                style="font-size:28px;font-weight:bold;color:#B22222;"><%=product.getPro_price()%></span>元<br>
            售&nbsp;&nbsp;&nbsp;&nbsp;出：&nbsp;<span
                style="font-weight:bold;color:#CC6600;"><%=product.getSales()%></span>件<br>
            <%--            购买，以及加购功能--%>
            <%
                if (user.getName() == null || user.getName().equals("")) { %>
            请先登录
            <% } else { %>
            <form action="shoppingCart" method="post" id="formSubmit">
                <input type="text" name="method" value="add" id="formMethod" style="display: none">
                <input type="text" name="userID" value="<%=user.getId()%>" style="display: none">
                <input type="text" name="productID" value="<%=product.getId()%>" style="display: none">
                数&nbsp;&nbsp;&nbsp;&nbsp;量：&nbsp;<input type="text" name="buyNum" size="6" style="color:#66668C;"
                                                        value="1">件<p>
            </form>
            <input type="image" src="images/buy_button.png" name="submit"
                   onclick="addOrderSubmit()" value="立刻购买">&nbsp;&nbsp;
            <input type="image" src="images/shopping_button.png" name="submit"
                   onclick="addShoppingCartSubmit()" value="加入购物车"></p>
            <% } %>
        </div>
        <div id=item_details><img src="images/details.gif"/></div>
        <div id="item_parameter">
            <div style="float: left;width:230px;color:#404040;">货号：<%=product.getId()%>
            </div>
            <div style="float: left;width:230px;color:#404040;">类别：<%=product.getCategory()%>
            </div>
            <div style="float: left;width:230px;color:#404040;">扇面材质:<%=product.getFan_material()%>
            </div>
            <br>
            <div style="float: left;width:230px;color:#404040;">扇骨材质：<%=product.getFan_bone_material()%>
            </div>
            <div style="float: left;width:230px;color:#404040;">扇骨数量：<%=product.getFan_bone_num()%>根</div>
            <div style="float: left;width:230px;color:#404040;">扇骨长度：<%=product.getFan_bone_length()%>CM</div>
        </div>
        <div id="item_show_img">
            <img src="Picture/source/d<%=product.getImg()%>"/>
        </div>
    </div>

    <div id="footer">
        <jsp:include page="bottom.jsp"/>
    </div>
</div>

</body>
</html>
