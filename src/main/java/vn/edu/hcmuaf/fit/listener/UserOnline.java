package vn.edu.hcmuaf.fit.listener;

import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.impl.CartItemDAO;
import vn.edu.hcmuaf.fit.model.cart.CartItem;
import vn.edu.hcmuaf.fit.model.cart.Carts;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;
import java.util.List;

@WebListener
public class UserOnline implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
//        User user =(User) application.getAttribute("User");
//        Carts cart = (Carts) se.getSession().getAttribute(Variable.Global.CART.toString());
//        User user = (User) se.getSession().getAttribute(Variable.Global.USER.toString());
//            System.out.println("merge");
//            cart.merge(user.listToCarts());

//            se.getSession().setAttribute(se.getSession().getAttribute(Variable.Global.CART.toString()),);


//        application.setAttribute("Cart",user);


    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("detroy");



    }
}
