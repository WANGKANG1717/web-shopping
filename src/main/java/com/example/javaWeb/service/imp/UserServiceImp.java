package com.example.javaWeb.service.imp;

import com.example.javaWeb.dao.UserDao;
import com.example.javaWeb.dao.imp.UserDaoImp;
import com.example.javaWeb.entity.User;
import com.example.javaWeb.service.UserService;

/**
 * @Author: WK kang17.xyz
 * @Date: 2022/05/18/10:12
 * @Email: 1686617586@qq.com
 * @Description: ©WK
 */
public class UserServiceImp implements UserService {
    private UserDao userDao=new UserDaoImp();

    @Override
    public boolean Register(String userName, String passwd, String sex, String[] hobby) {
        User user =new User(userName, passwd, sex, hobby);
        return userDao.add(user);
    }

    @Override
    public User Login(String username, String password) {
        User user=userDao.getByName_Pwd(username, password);
        if(user!=null) {
            user.setOnline(1);
            userDao.update(user);
        }
        return user;
    }

    @Override
    public User getUserById(String userID) {
        return userDao.getById(userID);
    }

    @Override
    public boolean Exit(String userID) {
        boolean flag=false;
        User user=userDao.getById(userID);
        //设置下线
        if(user!=null) {
            user.setOnline(0);
            flag=userDao.update(user);
        }
        return flag;
    }

    @Override
    public boolean update(User user, String oldPassword) {
        User userOld=userDao.getById(user.getId().toString());
        if(!userOld.getPasswd().equals(oldPassword)) {
//            System.out.println("这里有问题1");
            return false;
        }
        else {
//            System.out.println("这里有问题2");
            //更新用户信息
            userOld.setName(user.getName());
            //新密码为空则表示不更改密码
            if(user.getPasswd()!=null && !user.getPasswd().equals("")) {
                userOld.setPasswd(user.getPasswd());
            }
            userOld.setSex(user.getSex());
            userOld.setHobby(user.getHobby());
            return userDao.update(userOld);
        }
    }

    @Override
    public boolean update(User user) {
        return userDao.update(user);
    }
}
