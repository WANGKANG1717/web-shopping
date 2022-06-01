package com.example.javaWeb.controller;

import com.example.javaWeb.entity.User;
import com.example.javaWeb.service.UserService;
import com.example.javaWeb.service.imp.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet(name = "user", value = "/user")
public class UserController extends HttpServlet {
    private UserService userService = new UserServiceImp();
    private String router;

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //统一处理路由跳转
        router=(String) req.getSession().getAttribute("router");
        if(router==null || router.equals("")) {
            router="/index.jsp";
        }
        /**
         * 获取参数识别用户想要请求的方法
         * 然后判断并调用对应的方法
         */
        String method = req.getParameter("method");
        if ("login".equals(method)) {
            doLogin(req, resp);
        } else if ("register".equals(method)) {
            doRegister(req, resp);
        } else if ("exit".equals(method)) {
            getExit(req, resp);
        } else if ("update".equals(method)) {
            updateUser(req, resp);
        }
    }

    //登录
    public void doLogin(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        String userName = request.getParameter("username");
        String passwd = request.getParameter("passwd");
//        System.out.println(userName+passwd);
        String info = null;
        /**
         * 本来偷懒使用username
         * 后来发现太不方便了，还是传回user信息把
         */
        User user = userService.Login(userName, passwd);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
        } else {
            info = "用户名或密码错误";
            System.out.println("验证失败");
            request.setAttribute("outputMessage", info);
        }
        try {
                request.getRequestDispatcher(router).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 狗血
     * 我集成到一个文件里面后，注册乱码了
     * 而且还极难搞，，，，狗东西
     *
     * @param request
     * @param response
     */
    //注册
    public void doRegister(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        String userName = request.getParameter("username");
        String passwd = request.getParameter("passwd");
        String passwd2 = request.getParameter("passwd2");
        String sex = request.getParameter("sex");
        String[] hobby = request.getParameterValues("hobby");
        System.out.println(sex);
//        System.out.println(hobby[0]);
        String msg = "";
        if (userName == null || userName.equals("")) {
            msg += "userName_is_empty!<br>";
        }
        if (passwd == null || passwd.equals("")) {
            msg += "passwd_is_empty!<br>";
        }
        if (passwd2 == null || passwd2.equals("")) {
            msg += "passwdconfirm_is_empty!<br>";
        }
        if (sex == null || sex.equals("")) {
            msg += "sex_is_empty!<br>";
        }
        if (hobby == null || hobby.equals("")) {
            msg += "hobby_is_empty!<br>";
        }
        if (passwd.equals(passwd2) != true) {
            msg += "passwd_is_not_equal!<br>";
        }
        if (msg.equals("") == false) {
            request.setAttribute("outputMessage", msg);
            try {
                request.getRequestDispatcher("/reg.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            userService.Register(userName, passwd, sex, hobby);
            msg = "注册成功！";
            //跳转登录界面
            request.setAttribute("outputMessage", msg);
            try {
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    //退出
    public void getExit(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        session.invalidate();
        String userID = request.getParameter("userID");
        //
        userService.Exit(userID);
        try {
            System.out.println(router+"router");
            request.getRequestDispatcher(router).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateUser(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        System.out.println("updateUser");
        String userID = request.getParameter("id");
        String userName = request.getParameter("username");
        String oldPasswd = request.getParameter("oldPasswd");
        String newPasswd = request.getParameter("newPasswd");
        String sex = request.getParameter("sex");
        String[] hobby = request.getParameterValues("hobby");
//        System.out.println(userID+" "+ userName+" "+oldPasswd+" "+newPasswd+" "+sex+" ");
        //
        String updateMsg=null;
        boolean flag=userService.update(new User(Integer.parseInt(userID), userName, newPasswd, sex, hobby), oldPasswd);
        if(flag==true) {
            updateMsg="恭喜，更新信息成功。";
        }
        else {
            updateMsg="更新失败，请检查表单。";
        }

        User user=userService.getUserById(userID);

        request.getSession().setAttribute("user", user);
        request.getSession().setAttribute("updateMsg", updateMsg);

        try {
            request.getRequestDispatcher("/person.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
