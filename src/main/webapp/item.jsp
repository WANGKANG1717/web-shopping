<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>爱尚网扇品</title>
    <link rel="stylesheet" rev="stylesheet" href="css/global.css" type="text/css" media="all"/>
</head>
<body>

<div id="page">
    <div id="header">
        <jsp:include page="header.jsp"/>
    </div>

    <div id="left_column">
        <jsp:include page="left_column.jsp"/>
    </div>

    <div id="center_column">
        <jsp:useBean id="product" scope="session" class="com.example.javaWeb.Bean.Product"/>
        <div id=item_img>
            <img width="300px" height="225px" src="Picture/<%=product.getImg()%>"/>
        </div>
        <div id=item_other>
            品&nbsp;&nbsp;&nbsp;&nbsp;名：&nbsp;<span style="font-size:15px;font-weight:bold;"><%=product.getName()%></span><br>
            原&nbsp;&nbsp;&nbsp;&nbsp;价：&nbsp;<span style="text-decoration: line-through;"><%=product.getPrice()%>元</span><br>
            促&nbsp;&nbsp;&nbsp;&nbsp;销：&nbsp;<span style="font-size:28px;font-weight:bold;color:#B22222;"><%=product.getPro_price()%></span>元<br>
            售&nbsp;&nbsp;&nbsp;&nbsp;出：&nbsp;<span style="font-weight:bold;color:#CC6600;"><%=product.getSales()%></span>件<br>
<%--            购买，以及加购功能--%>
            <%
               if(session.getAttribute("user")==null) { %>
                请先登录
            <% } else { %>
            <form action="addShoppingCart" method="post">
                <input type="hidden" name="username" value="<%=session.getAttribute("user")%>">
                <input type="hidden" name="productId" value="<%=product.getId()%>">
                数&nbsp;&nbsp;&nbsp;&nbsp;量：&nbsp;<input type="text" name="buyNum" size="6" style="color:#66668C;" value="1">件<p>
                <img src="images/buy_button.png"/>&nbsp;&nbsp;
                <input type="image" src="images/shopping_button.png" name="submit" value="加入购物车"></p>
            </form>
            <% } %>
        </div>
        <div id=item_details><img src="images/details.gif"/></div>
        <div id="item_parameter">
            <div style="float: left;width:230px;color:#404040;">货号：<%=product.getId()%></div>
            <div style="float: left;width:230px;color:#404040;">类别：<%=product.getCategory()%></div>
            <div style="float: left;width:230px;color:#404040;">扇面材质:<%=product.getFan_material()%></div>
            <br>
            <div style="float: left;width:230px;color:#404040;">扇骨材质：<%=product.getFan_bone_material()%></div>
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
