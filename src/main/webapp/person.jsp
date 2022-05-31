<%--
  Created by IntelliJ IDEA.
  User: WANGKANG
  Date: 2022/5/29
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.javaWeb.entity.Notice" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>商店公告</title>
    <link rel="stylesheet" rev="stylesheet" href="css/global.css" type="text/css" media="all"/>
</head>
<body>
<%
    session.setAttribute("router", "/person.jsp");
%>
<jsp:useBean id="user" scope="session" class="com.example.javaWeb.entity.User"/>
<jsp:useBean id="updateMsg" scope="session" class="java.lang.String"/>
<%!
    String getCheck(String sex, String mode) {
        if(mode.equals(sex)) {
            return "checked";
        }
        return "";
    }
    String getHobby(String[] hobby, String mode) {
        if(hobby==null) return "";
        for(int i=0; i<hobby.length; i++) {
            if(hobby[i].equals(mode)) {
                return "checked";
            }
        }
        return "";
    }
%>
<div id="page">
    <div id="header">
        <jsp:include page="header.jsp"/>
    </div>

    <div id="left_column">
        <jsp:include page="left_column.jsp"/>
    </div>
    <div id="center_column">
        <div style="width: 100%; text-align: center">
            <div style="font-family: 方正舒体; font: 35px bolder; width: 100%;">
                个人中心
            </div>
            <div class="div_my1">
                <%
                    if(updateMsg!=null && !updateMsg.equals("")) {
                        out.print(updateMsg);
                    }
                    updateMsg=null;
                %>
                <form action="user" method="post">
                    <input type="hidden" name="method" value="update">
                    <input type="text" name="id" value="<%=user.getId()%>" style="display: none"><br>

                    <div class="div_my2">用户名：</div>
                    <input type="text" name="username" value="<%=user.getName()%>" style="width: 200px;"><br>

                    <div class="div_my2">原密码：</div>
                    <input type="password" name="oldPasswd" placeholder="请输入原密码，以验证身份" style="width: 200px;"><br>

                    <div class="div_my2">新密码：</div>
                    <input type="password" name="newPasswd" placeholder="若不修改密码，此栏可不填" style="width: 200px;"><br>

                    <div class="div_my2">性别：</div>
                    <input type="radio" name="sex" value="男" <%=getCheck(user.getSex(), "男")%>>男
                    <input type="radio" name="sex" value="女" <%=getCheck(user.getSex(), "女")%>>女<br>

                    <div class="div_my2">兴趣：</div>
                         <input type="checkbox" name="hobby" value="爬山" <%=getHobby(user.getHobby(), "爬山")%>>爬山
                         <input type="checkbox" name="hobby" value="钓鱼" <%=getHobby(user.getHobby(), "钓鱼")%>>钓鱼<br>
                    <div class="div_my2">余额：</div>
                    <input type="text" value="<%=user.getBalance()%>" style="margin-top: 10px" disabled> <br/>
                    <input type="submit" value="修改" style="margin-top: 10px">
                    </table>
                </form>
            </div>
        </div>
    </div>
    <div id="footer">
        <jsp:include page="bottom.jsp"/>
    </div>
</div>

</body>
</html>

<style>
    .div_my1 {
        font-size: 17px;
        text-align: left;
    }
    .div_my2 {
        width: 100px;
        display: inline-block;
    }
</style>
